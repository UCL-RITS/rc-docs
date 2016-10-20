# Software Installation on Legion

publication-date: Fri, 04 Apr 2014 10:50:49 +0000
author: uccaoke

One of the activities that our team undertake to support researchers is the installation of packages on the central compute resource, Legion.  This process is somewhat opaque to users and so I feel like it's time to describe what we do when a user requests a package through an e-mail to rc-support.

Usually package requests come as a list of things a user requires on a ticket sent into our support board.  What happens next is that the person on the support rota does a preliminary bit of research (via Google/links provided by the researcher) and then creates another ticket in our GitHub issues repository, containing the relevant information, and assigning a priority.

What happens next depends on a number of factors such as licensing, but for the purposes of this post I shall assume that the package requested is Open Source (and thus lacks any complicated licensing scheme).

For operational work, our team operates with other teams who provide RITS services under a process derived from SCRUM.  We operate on two week sprints which means that every two weeks we have a meeting as a team, and divide up the issues on GitHub between team members based on the time they have available that sprint, individual expertise and so on.

So, what does installation of a package actually entail?

Well, we have to build the package, deploy it, integrate it into our modules system, test it, and then usually we send a message to the user who requested it asking them to do some testing as well.

Some things to note.  Firstly, we do all of this as a non-privileged role account, not as root.  It's a common misconception amongst the user base that to install packages on Linux you need to be root.  This is an impression informed by a) using package management systems like dpkg or rpm to install packages from their distribution b) the installation instructions for some packages.  In reality an exceptionally small faction of packages need to be installed as root, namely those which install kernel modules or such-like (packages like vTune for example).

Secondly, we don't use our distribution (Scientific Linux)'s package manager to install the tools that users need.  This is partly because an awful lot of the packages users want are not available from the repositories, (or are but obsolete versions), but mostly because that would cause a signifcant issue for us from a software management point of view.  Legion is a cluster.  It is not a single machine but literally thousands of Linux servers all running an identical disk image.  If we were to use rpm/yum to install packages, they would have to be installed on every compute node on Legion, either by running the installer, or by re-imaging the node and this would take a significant amount of the service out of production while we did this.  Instead, all the software we deploy is to an NFS share which you can see on Legon under /shared/ucl/apps.  This means it is instantaneously available on all compute nodes once deployed.

What is this process actually like and why does it sometimes take so
long? Well, for the purposes of this post let's look at a package that
I've installed recently called CompuCell3D
(<http://www.compucell3d.org/>). It's important to realise that the
developers of CompuCell3D have actually done everything right. They've
used a sane build system. Their code is available from GitHub. They've
used 3rd party libraries rather than re-implementing eveything from
scratch. So it ought to be easy to install.

But it isn't.

Why?  Well unfortunately, by doing everything right, their package now relies on a lot of other packages.  It relies on QT4, the Python wrappers (PyQT) for QT4, Qscintilla, QWT and the wrappers for that, VTK, and so on. PyQT4 relies on SIP and so on.  This quickly becomes a massive dependency tree of stuff that needs to be installed, and there are lots of hidden bear-traps to stumble into along the way, some of which require you to back-track up the dependency tree.

Here are some of the things that happened in building up the dependencies.

Firstly, I thought I might be able to get around installing all of the dependencies by using Enthought Python, which we have a general license for and comes with a lot of packages pre-installed.  Unfortunately, in order for this to work, various directories of libraries provided by Enthought need to be added to the $LD_LIBRARY_PATH and this brings up an interesting clash between the system version of TermCap and the version provided with EPD.  So this option is out.

So we need to build things.

When I install packages I make a value judgement about which compiler to
use. If this is an application that does a lot of computation and is
relatively simple, it's usually better to use the Intel compilers for
performance reasons. If a package is complicated (anything that links to
R or Python) it is usually better to use the GNU compilers because the
developers of Python and R add-ons tend to be fairly bad at writing
portable code. Since this package linked to Python, the GNU compilers
were the way to go. I wanted to build things up with the system
compilers, because that way users don't need to load so many modules to
make things work, unfortunately it looks like QT4 doesn't build properly
any more with GNU 4.1.2 or 4.4.0. Luckily, we have a more modern version
of GCC (4.6.3) installed already that we commonly use to build things.


Another thing we have to make a judgement call about is whether to individually install all the dependencies as modules, or bundle everything up in one package.  I prefer to do the former, but since this package involves things like QT, this time I decided to package this up all in one.  I did however decide to build it in such a way that all the dependencies were kept separate from the package itself so that future updates to the package would not need to rebuild them.

So I built Python and QT4 and ATLAS (which would speed up Numpy later on).  One nice thing I noticed is that ATLAS's build process has been significantly improved since I last built it.  I installed setuptools on Python so that I could pull in pip and Numpy easily and then installed those.  I also installed SWIG.

This was the end of the packages that I am very familiar with and so this is where it started to get complicated.  CompuCell3D depends on VTK, a package I have built in the far distant past (about 6 or 7 years ago) on other platforms and found somewhat troublesome.  I grabbed the source for 6.1 and kicked off the build over the weekend.  Unfortunately, I'd messed up configuring it, and so when I got in on Monday I had to build it again.  Building VTK takes a whole working day, so that meant I lost a day's worth of progress.  Never mind, that happens.

With VTK built I then had to build the stack of Riverbank python/QT packages which rather frustratingly aren't available on PyPi and therefore aren't pip installable.  I've done some of these before doing preparatory work for another project.  The routine goes like this.

- SIP is required for PyQT
- PyQT is required for QScintilla2

Each one has a slightly different build process, and the build process for PyQT has changed recently, (more on that later!).

Then I moved on to QWT.  QWT's build process uses `qmake`, but really, really wants to install itself to `/usr` which we don't want to do, partly because we aren't root and therefore can't, but mostly because of the deployment issues we've already discussed.  This means we need to do some detective work.  The almighty Google, font of all knowledge implies that we can pass `PREFIX=` to `qmake` and this will fix the problem.  It doesn't.  So we need to be creative.  Grepping about in the source folder, I found two references to `/usr`, one in `qwtconfig.pri` and one in `qwt.prf`.  I modfied these like so:

```
qwtconfig.pri: INSTALLBASE    = /shared/ucl/apps/CompuCell3D/support
qwt.prf:       QwtBase        = /shared/ucl/apps/CompuCell3D/support
```

and re-ran `qmake` (also including the `PREFIX=`, just in case).  This allowed QWT to build and install to the correct location.

Then I needed to install the Python QWT bindings and this is where
things started to go really wrong. PyQWT depends on PyQT. Unfortunately,
to detect whether PyQT is installed or not, it relies on a tool that
PyQT used to build called “pyqtconfig”. And the new build process no
longer builds this utility. I'm not the first person to notice this
issue, you can see that people who use Brew on Macs have run into this
before: <https://github.com/Homebrew/homebrew/issues/21984> From the
comments there and the documentation on PyQT here
(<http://pyqt.sourceforge.net/Docs/PyQt4/build_system.html>) I decided
to rebuild PyQT with the old build system. Luckily, by this time it was
the end of the day so I could leave it building overnight.

I got in to work the next day, discovered it had worked and installed PyQWT successfully.

By this stage I had in theory all the software installed that I needed to build CompuCell3D.  Unfortunately, unbeknownst to me this was not the case.

Firstly, CMake failed to correctly set up paths for things I had installed.  Digging about in the CMakeCache, I discovered that CMake had correctly detected the Python interpreter I wanted to use, but bizarrely had decided that it wanted to both link against the libpython from the system install and use the headers from the system install.

I fixed this, re-ran make and ran into yet another issue.  It turns out that in the migration from version 5.x to 6.1 of VTK, KitWare (the developers) removed a lot of functionality from VTK, functionality that CompuCell3D relies on.  I had, it was clear, been foolish in installing the latest version of VTK.  Sighing, I removed it, grabbed the source for 5.10.1 and started the build process for it.  This took two attempts (each lasting a day), because of issues detecting SIP.  Finally, at 11:15PM last night, I had a build of VTK 5.10.1 installed into the support packages tree.  I built CompuCell3D successfully, wrote a module file so that it appears in modules, and went to bed.

I got into work this morning and decided to do some testing.  Unsurprisingly, it didn't work.  After some more grep-based detective work, I discovered that the issue is that along with QScintilla2, you have to build its Python bindings separately, which I'd missed.  I hadn't discovered this was an issue last night, because of course Python problems only show up at run time, CompuCell3D is an X/OpenGL application and I was logged in from home.  I fixed this, ran some tests and notified the user who requested the code.

All in all, from the initial request this took 2 months, ~4 weeks of which were spent sat in the GitHub issues queue waiting to be assigned to someone with enough unallocated time to complete the work, and the second month of which was spent actually building the dependencies and package itself (fitted around other work, such as writing project proposals, manning the support board, installing other, simpler packages, meeting with users and so on).

Obviously, this is a long and involved process, and none of the
developers of individual packages are at fault. The issues are the net
result of the complexities that arise when you have to install a
collection of interdependent packages from source and even though each
and every developer did almost everything right, they still crop up.
Here in RCPS we are looking at ways to decrease the work load created by
installing software, partly to make our lives easier, and partly to
decrease the turn-around time for getting these things to work that
users experience. We have looked at a number of candidates for package
management tools, and currently the front-runner is a system called
EasyBuild from Ghent University (<http://hpcugent.github.io/easybuild/>)
which has the advantage that it's targeted at HPC software so many of
the packages our users require are already in the package system.
Unfortunately, some integration work needs to be done to make this
suitable for Legion but it is one of the things we are currently working
on.

In the end, we'd like to be able to deploy all the packages we install through EasyBuild (or whichever package we select) either by using the configurations in the system already, or by writing our own.  This would mean upgrading the core operating system on our resources would be greatly simplified (for example).  Unfortunately, the licensing terms for a number of popular packages used in HPC are not amenable to doing this so some things will always have to be done by hand.

