
==Download your code==

Use wget or curl to download the source code for the software you want to install to your account. There might be binaries available, but they often won't work on our clusters because they were compiled for other machines with other library versions available. Use tar or unzip or similar depending on archive type to uncompress your source code.

<code>
 wget https://www.example.com/program.tar.gz
 tar -xvf program.tar.gz
</code>

You won't be able to use a package manager like yum, you'll need to follow the manual installation instructions for a user-space install (not using sudo).

==Set up your modules==

Before you start compiling, you need to make sure you have the right compilers, libraries and other tools available for your software. If you haven't changed anything, you will have the default modules loaded. For more information on how to use modules, see [[RC Systems user environment]].

Check what the instructions for your software tell you about compiling it. If the website doesn't say much, the source code will hopefully have a README or INSTALL file.

You may want to use a different compiler - the default is the Intel compiler. 

<code>module avail compilers</code> will show you all the compiler modules available. Most Open Source software tends to assume you're using GCC and OpenMPI (if it uses MPI) and is most tested with that combination, so if it doesn't specify you may want to begin there (do check what the newest modules available are):

<code>
 module unload compilers mpi mkl
 module load compilers/gnu/4.9.2
 module load mpi/openmpi/1.10.1/gnu-4.9.2
</code>

==Available compilers==

The following compilers are available and supported on Legion:

* Intel C, C++ and Fortran
* GNU C, C++ and Fortran

We currently have a limited number of licenses for the Intel compilers so only a certain number of users can use them simultaneously. This means that your compilation may fail with an error complaining about not being able to obtain a valid license. If this happens, simply wait for a few minutes and try again.

In addition to the supported tools, there are a number of tools installed on Legion which are not supported (for example the PGI compilers) which were installed to build certain supported packages. Users who use the unsupported packages do so at their own risk.

[[#top | back to top]]

==Build systems==

Most software will use some kind of build system to manage how files are compiled and linked and in what order. Here are a few common ones.

===Automake configure===

[http://www.gnu.org/software/automake/manual/automake.html Automake] will generate the Makefile for you and hopefully pick up sensible options through configuration. You can give it an install prefix to tell it where to install (or you can build it in place and not use make install at all). 

<code>
 ./configure --prefix=/home/username/place/you/want/to/install
 make
 # if it has a test suite, good idea to use it
 make test 
 make install
</code>

If it has more configuration flags, you can use <code>./configure --help</code> to view them. 

Usually configure will create a config.log: you can look in there to find if any tests have failed or things you think should have been picked up haven't.

===CMake===

[http://www.cmake.org/ CMake] is another build system. It will have a CMakeFile or the instructions will ask you to use cmake or ccmake rather than make. It also generates Makefiles for you. <code>ccmake</code> is a terminal-based interactive interface where you can see what variables are set to and change them, then repeatedly configure until everything is correct, generate the Makefile and quit. <code>cmake</code> is the commandline version. The process tends to go like this:

<code>
 ccmake CMakeLists.txt
 # press c to configure - will pick up some options
 # press t to toggle advanced options
 # keep making changes and configuring until no more errors or changes
 # press g to generate and exit
 make
 # if it has a test suite, good idea to use it
 make test 
 make install
</code>

If you need to rerun ccmake and reconfigure, remember to delete your CMakeCache.txt, or you'll be wondering why your changes haven't taken. Turning on verbose Makefiles in ccmake is also useful if your code didn't compile first time - you'll be able to see what flags the compiler or linker is actually being given when it fails.

===Make===

Your code may just come with a Makefile and have no configure, in which case the generic way to compile it is as follows:

<code>
 make targetname
</code>

There's usually a default target, which <code>make</code> on its own will use. If you need to change any configuration options, you'll need to edit those sections of the Makefile (at the top, where the variables/flags are defined). 

Here are some typical variables you may want to change in a Makefile.

These are what compilers/mpi wrappers to use - these are also defined by the compiler modules, so you can see what they should be.
Intel would be icc, icpc, ifort, for example. If it's a program that can be compiled using MPI and only has a variable for CC, then set that to mpicc.

<code>
 CC=gcc
 CXX=g++
 FC=gfortran
 MPICC=mpicc
 MPICXX=mpicxx
 MPIF90=mpif90
</code>

CFLAGS and LDFLAGS are flags for the compiler and linker respectively, and there might be LIBS or INCLUDE as well. When linking a library with the name libfoo, use -lfoo.

<code>
 CFLAGS="-I/path/to/include"
 LDFLAGS="-L/path/to/foo/lib -L/path/to/bar/lib"
 LDLIBS="-lfoo -lbar"
</code>

Remember to <code>make clean</code> first if you are recompiling with new options! 

[[#top | back to top]]

==AVX instructions==

'''Note''': Legion's current login nodes are of a newer architecture than some of the compute nodes - the login nodes have AVX instructions but the XYZ type nodes do not. This means if you want your code to run on the older nodes, some compiler options cannot be used (e.g. <code>-march=native</code>, <code>-mtune</code>, <code>-xHost</code>) or your code will segfault.

You can either build the code on the login nodes and restrict your jobs to only running on the newer nodes, compile the code with appropriate options for all the nodes, or compile your code inside a job that is running on the XYZ nodes (or during a qrsh session on the same).

===Intel compilers===

To tell the Intel compilers to build for SSE4.2 instructions and no AVX, add this to CFLAGS (and CXXFLAGS if relevant):
<code>
 CFLAGS=-axSSE4.2
</code>

(Also see <code>icc -help codegen</code>).

===GNU compilers===

To tell GCC to build for SSE4.2 without AVX, add this to CFLAGS (and CXXFLAGS if relevant):
<code>
 CFLAGS=-march=nehalem
</code>

===Restrict node type===

To restrict a job to newer nodes only, put this in your script:
<code>
 #$ -ac allow=TU
</code>

You can also compile one version without AVX and one with, so you can take advantage of the newer nodes when possible. You could use <code>hostname</code> in your jobscript to check what type of node you were on and run the appropriate binary. Hostnames begin with node-x for an X-type node, node-u for a U-type and so on.

===Test for AVX===

We have a script that will let you test whether your compiled code is using AVX instructions. If you pass it a directory it will recursively test everything in there. Note that if your code builds multiple kernels and so can choose based on where it runs which instructions to use (like MKL) then this will find AVX instructions but they won't cause your code to segfault.

<code>
 find /home/username/path/ -perm /111 -type f | xargs /shared/ucl/apps/rcops_scripts/hasavx -q
</code>

[[#top | back to top]]

==BLAS and LAPACK==

BLAS and LAPACK are provided as part of MKL, OpenBLAS or ATLAS. There are several different OpenBLAS and ATLAS modules on Legion for different compilers. MKL is available in the Intel compiler module.

Your code may try to link <code>-lblas -llapack</code>: this isn't the right way to use BLAS and LAPACK with MKL or ATLAS (our OpenBLAS now has symlinks that allow you to do this).

* [[MKL on Legion]]
* [[OpenBLAS on Legion]]
* [[ATLAS on Legion]]

[[#top | back to top]]

==Set your PATH and other environment variables==

After you have installed your software, you'll need to add it to your PATH environment variable so you can run it without having to give the full path to its location.

Put this in your .bashrc so it will set this with every new session you create. Replace username with your username and point to the directory your binary was built in (frequently <code>program/bin</code>). This adds it to the front of your PATH, so if you install a newer version of something, it will be found before the system one.

<code> 
 export PATH=/home/username/location/of/software/binary:$PATH
</code>

If you built a library that you'll go on to compile other software with, you probably want to also add the lib directory to your LD_LIBRARY_PATH and LIBRARY_PATH, and the include directory to CPATH (add export statements as above). This may mean your configure step will pick your library up correctly without any further effort on your part.

To make these changes to your .bashrc take effect in your current session:

<code>
 source ~/.bashrc
</code>

[[#top | back to top]]

==Python==

There are <code>python2/recommended</code> and <code>python3/recommended</code> bundles. These use a virtualenv and have pip set up for you. They both have numpy and scipy available. 

===Set compiler module===

The Python versions on Legion were built with GCC. You can run them with the default Intel compilers loaded because everything depends on the gcc-libs/4.9.2 module. When you are building your own Python packages you should have the GCC compiler module loaded however, to avoid the situation where you build a package with the Intel compiler and then try to run it with GCC, in which case it will be unable to find Intel-specific instructions.

<code>
 module unload compilers
 module load compilers/gnu/4.9.2
</code>

If you get an error like this when trying to run something, recheck what compiler you used.

<code>
 undefined symbol: __intel_sse2_strrchr
</code>

===Install your own packages in the same virtualenv===

This will use our central virtualenv, which contains a number of packages already installed.

<code>
 pip install --user <python2pkg>
 pip3 install --user <python3pkg>
</code>

These will install into <code>.python2local</code> or <code>.python3local</code> respectively.

To see what is already installed, the [https://github.com/UCL-RITS/rcps-buildscripts/blob/master/lists/python-shared.list Python-shared list] shows what is installed for both Python2 and 3, while the [https://github.com/UCL-RITS/rcps-buildscripts/blob/master/lists/python-2.list Python2 list] and [https://github.com/UCL-RITS/rcps-buildscripts/blob/master/lists/python-3.list Python3 list] show what is only installed for one or the other. (There may also be prereqs that aren't listed explicitly - pip will tell you if something is already installed as long as you have the recommended module bundle loaded).

===Use your own virtualenvs===

If you need different packages that are not compatible with the central installs, you can create a new virtualenv and only yours will be available.

<code>
 virtualenv <DIR>
 source <DIR>/bin/activate
</code>

Your bash prompt will show you that a different virtualenv is active.

===Installing via setup.py===

If you need to install using setup.py, you can use the <code>--user</code> flag and as long as one of the python bundles is loaded, it will install into the same <code>.python2local</code> or <code>.python3local</code> as pip and you won't need to add any new paths to your environment.

<code>
  python setup.py install --user
</code>

You can alternatively use <code>--prefix</code> in which case you will have to set the install prefix to somewhere in your space, and also set PYTHONPATH and PATH to include your install location. Some installs won't create the prefix directory for you, in which case create it first. This is useful if you want to keep this package entirely separate and only in your paths on demand.

<code>
 export PYTHONPATH=/home/username/your/path/lib/python2.7/site-packages:$PYTHONPATH
 # if necessary, create install path
 mkdir -p home/username/your/path/lib/python2.7/site-packages
 python setup.py install --prefix=/home/username/your/path

 # add these to your .bashrc or jobscript
 export PYTHONPATH=/home/username/your/path/lib/python2.7/site-packages:$PYTHONPATH
 export PATH=/home/username/your/path/bin:$PATH
</code>

Check that the PATH is where your Python executables were installed, and the PYTHONPATH is correct. It will tend to tell you at install time if you need to change or create the PYTHONPATH directory.

===Python script executable paths===

If you have an executable python script giving the location of python like this, and it fails because that python doesn't exist in that location or isn't the one that has the additional packages installed:
<code>
 #!/usr/bin/python2.6
</code>

You should change it so it uses the first python found in your environment.
<code>
 #!/usr/bin/env python
</code>

[[#top | back to top]]

==Perl==

Perl modules will freqently have a Makefile.PL (especially if you download the tar files from CPAN.org yourself). You can install manually as:

<code>
 perl Makefile.PL PREFIX=/home/username/your/perl/location
 make
 make install
</code>

===CPAN===

You can use CPAN to download and install modules locally for you. The first time you run the <code>cpan</code> command, it will create a <code>.cpan</code> directory for you and ask you to give it configuration settings or allow it to set them automatically. 

You need to tell it where you want your install prefix to be.

If it is automatically configured, you need to edit these lines in your <code>.cpan/CPAN/MyConfig.pm</code>, for example if you want it to be in a lib directory in your home (change username to your own username):

<code>
 'make_install_arg' => q[PREFIX=/home/username/lib],
  # other lines in here
 'makepl_arg' => q[PREFIX=/home/username/lib],
</code>

It will download and build modules inside .cpan and install them where you specified.

===Set PERL5LIB paths===

If you install your own Perl or Perl modules, you will need to append them to your PERL5LIB:

<code>
 export PERL5LIB=/home/username/your/perl/location:$PERL5LIB
</code>

If you installed with CPAN, you may need to add several paths to this based on the layout it creates inside your nominated Perl directory.

===Errors when using non-default Perl versions===

====warnings.pm====

If you are using a version of Perl that is not the default system Perl and get strange errors when trying to run a Perl script, particularly ones about warnings.pm:

<code>
 Search pattern not terminated at /shared/ucl/apps/perl/5.20.0/lib/5.20.0/warnings.pm line 1099
</code> 

then you need to edit the script so that instead of beginning with <code>#!/usr/bin/perl</code>, it begins with <code>#!/usr/bin/env perl</code>. Otherwise it will try to use the old system Perl libraries with your newer Perl executable, which won't work.

====libperl.so not found====

You probably built perl without telling it to build the shared library too. Add <code>-Duseshrplib</code> to your build flags.

[[#top | back to top]]

==R==

There are instructions on installing and using local R packages in [https://wiki.rc.ucl.ac.uk/wiki/R_on_Legion#Using_your_own_local_R_packages Using your own local R packages].

[[#top | back to top]]

==Compiling with MPI==

OpenMPI and Intel MPI are available. Certain programs do not work well with one or the other, so if you are having problems try the other one. Intel MPI is based on MPICH, so if the program you are compiling mentions that, try Intel MPI first.

The Intel MPI is threadsafe; OpenMPI isn't.

Note that OpenMPI 1.8.4 had a segv bug in non-blocking collectives that is fixed in OpenMPI 1.10.1.

[[#top | back to top]]

==Enabling OpenMP==

To enable OpenMP with the Intel compilers, you simply need to add <code>-openmp</code> to your compile line. With the GNU compilers you need to add <code>-fopenmp</code>.

==Problems==

If you experience problems building your applications, please contact your local IT support in the first instance. We are available at rc-support AT ucl.ac.uk to help you if you still cannot build your app or if you need to report a problem with our software stack.  

[[#top | back to top]]
