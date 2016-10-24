
In October 2015 Legion was upgraded from Scientific Linux 5 to Red Hat Enterprise Linux 7. Grace also uses this OS.

==Host key warning==

The host keys for these login nodes and for legion.rc.ucl.ac.uk have changed, so when you try to log in you may get a warning from ssh saying that this has happened. You will need to remove the old keys from the known hosts list.

===Current host keys===

To verify that you are connecting to the correct machine, the current host keys are below. (If you are connecting with an older ssh client you may get RSA keys instead, which will be different). Compare these with what the host key warning is telling you.

<code>
 legion.rc.ucl.ac.uk (login06 to login09) &  login05.external.legion.ucl.ac.uk
 Server host key: ECDSA 4a:8a:0b:be:ee:5f:a0:7c:1e:41:a7:d9:4a:d0:54:7f

 grace.rc.ucl.ac.uk
 Server host key: ECDSA 3e:d6:86:42:c7:1d:b5:74:18:d3:b1:40:3e:58:3f:c9
</code>

===Remove old host keys===

On Linux you can remove the old keys with:

<code>
 ssh-keygen -R login09.external.legion.ucl.ac.uk
 ssh-keygen -R 193.60.225.59

 ssh-keygen -R login08.external.legion.ucl.ac.uk
 ssh-keygen -R 193.60.225.58

 ssh-keygen -R login07.external.legion.ucl.ac.uk
 ssh-keygen -R 193.60.225.57

 ssh-keygen -R login06.external.legion.ucl.ac.uk
 ssh-keygen -R 193.60.225.56

 ssh-keygen -R legion.rc.ucl.ac.uk
</code>

On Socrates you will probably need to edit your <code>~/.ssh/known_hosts</code> file manually and delete the line for legion. (pico and vi are available text editors on Socrates).

Using WinSCP the warning will look like this, and you will have the option to update the key.
<code>
 'Server's host key does not match the one that WinSCP has in cache.'
</code>

=Modules=

There are some fairly significant changes to the modules available and of course newer versions of packages than were available under the old system. To see all the modules:
<code>
 module avail
</code>

If you have the Legion default modules loaded in your .bashrc, then you should have the new default modules loaded automatically.

<code>
 module list
 Currently Loaded Modulefiles:
   1) gcc-libs/4.9.2             7) subversion/1.8.13         13) rcps-core/1.0.0
   2) cmake/3.2.1                8) screen/4.2.1              14) compilers/intel/2015/update2
   3) flex/2.5.39                9) gerun                     15) mpi/intel/2015/update3/intel
   4) git/2.3.5                 10) nano/2.4.2                16) default-modules
   5) apr/1.5.2                 11) nedit/5.6-aug15
   6) apr-util/1.5.4            12) dos2unix/7.3


</code>

If you have “module load” commands in your .bashrc, you'll have to update them to reflect the changes to the module names/versions, otherwise you will see error messages.

You can check our progress in installing all applications on the github repository for the module files here:

https://github.com/UCL-RITS/rcps-modulefiles

And the scripts that build the packages here:

https://github.com/UCL-RITS/rcps-buildscripts


=Jobscript differences=

==Parallel environments for shared memory threads or MPI==

The way you request threads has changed: instead of using <code>#$ -l thr=4</code>, you would put this in your jobscript:

<code>
 # Request 4 threads
 #$ -pe smp 4
</code>

If you are using MPI, then there is only one parallel environment:

<code>
 # Request 4 MPI processes
 #$ -pe mpi 4
</code>

(<code>-pe mpi</code> is an alias for <code>-pe qlc</code> so you can use either and they are equivalent).

==RAM requested by shared memory jobs==

As a result of the change above, threaded jobs now also request RAM per core like MPI jobs do, rather than requesting the total amount. For example, asking for 4 threads and 12G RAM will give you a total of 48G RAM and not 12G as it was before. Check your memory requirements as you will greatly reduce the places your jobs can run if you leave them too high.

==Mixed-mode OpenMP and MPI==

This has changed significantly. You will now request the total number of cores you wish to use, and either set OMP_NUM_THREADS yourself, or allow it to be worked out automatically.

<code>
 # Run 12 MPI processes, each spawning 2 threads
 #$ -pe qlc 24
 export OMP_NUM_THREADS=2
 gerun your_binary
</code>
 

The below will automatically set OMP_NUM_THREADS to $NSLOTS/$NHOSTS, so you will use threads within a node and MPI between nodes and don't need to know in advance what size of node you are running on. Gerun will then run $NSLOTS/$OMP_NUM_THREADS processes, round-robin allocated (if supported by the MPI).

<code>
 #$ -pe qlc 24
 export OMP_NUM_THREADS=$(ppn)
 gerun your_binary
</code>

For example, if that runs on 2 x 12-core nodes, you'll get 2 MPI processes, each using 12 threads.

=Python=

There are <code>python2/recommended</code> and <code>python3/recommended</code> bundles. These use a virtualenv and have pip set up for you. They both have numpy and scipy available. 

See also [[Compiling#Python]] for how to install your own packages.

To see what is already installed, the [https://github.com/UCL-RITS/rcps-buildscripts/blob/master/lists/python-shared.list Python-shared list] shows what is installed for both Python2 and 3, while the [https://github.com/UCL-RITS/rcps-buildscripts/blob/master/lists/python-2.list Python2 list] and [https://github.com/UCL-RITS/rcps-buildscripts/blob/master/lists/python-3.list Python3 list] show what is only installed for one or the other. (There may also be prereqs that aren't listed explicitly - pip will tell you if something is already installed as long as you have the bundle loaded).

=Find something broken?=

We expect that there are some packages are that broken in ways that we did not predict and so please report any problems you find.

As usual, please send all questions to rc-support@ucl.ac.uk, and when you do please make it clear whether the issue you are experiencing is with the old Legion OS or the new one.

If you find a bug with a specific package, then it would be helpful instead to lodge an issue in the github issue tracker:

https://github.com/UCL-RITS/rcps-buildscripts/issues

In future we intend to use this for requesting new packages as doing so will allow you to see if a package you want has already been requested and add your support to that, helping us prioritise application installs. (If you don't have or want a GitHub account you can still email us, of course, but you should check that page for progress).
