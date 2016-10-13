
This page attempts to address some of the topics we most frequently receive questions about, or to which the answers are most complex.

===Why is my job in Eqw status?===

If your job goes straight into Eqw state, there was an error in your jobscript that meant your job couldn't be started. You can see a truncated version of the error with
 
<code>
 qstat -j <job_ID>
</code>

To see the full error:

<code>
 module load userscripts
 qexplain <job_ID>
</code>

This often happens because a file or directory you are trying to use doesn't exist.

==="Unable to determine job requirements" error===

<code>Unable to run job: Rejected by ucl_jsv4h Reason:Unable to determine job requirements.
Exiting.</code>

This usually happens because you have pasted a script in from the website, and you have ended up with excess leading spaces before the #$ directives. This means SGE isn't picking them up and doesn't know what resources you are requesting. Remove the spaces and it will work.

==="/bin/bash: invalid option" error===

This is a sign that your jobscript is a DOS-formatted text file and not a Unix one - the line break characters are different. Type <tt>dos2unix <yourscriptname></tt> in your terminal to convert it.

Sometimes the offending characters will be visible in the error. You can see here it's trying to use ^M as an option.

[[Category:Pages with bash scripts]]


<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 /bin/bash: -^M: invalid option
 Usage:  /bin/bash [GNU long option] [option] ...
        /bin/bash [GNU long option] [option] script-file ...
</code>
</div>





===Your Scratch space goes missing===

You may have accidentally deleted or replaced the link to your Scratch space. Do an <code>ls -al</code> in your home - if set up correctly, it should look like this:

<code>
 lrwxrwxrwx   1 username private       24 Apr 14  2014 Scratch -> /scratch/scratch/username
</code>

where <code>username</code> is your UCL user ID. You can recreate the symlink with
<code>
 ln -s /scratch/scratch/username Scratch
</code>

===Which MKL library files should I use to build my application?===

Depending on which whether you wish to use BLAS/LAPACK/ScaLAPACK/etc... there is a specific set of libraries that you need to pass to your compilation command line. Fortunately, Intel have released a tool that allows you to determine which libraries to link and in which order for a number of compilers and operating systems ([http://software.intel.com/en-us/articles/intel-mkl-link-line-advisor/ http://software.intel.com/en-us/articles/intel-mkl-link-line-advisor/]). See also [[MKL_on_Legion]]

===SSH known_hosts===

If you look in the error file for your job, you will likely find a number of errors like the one below. Please ignore these as they are the result of compute nodes being unable to write to your home directory and do not indicate a problem.

[[Category:Pages with bash scripts]]


<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 Failed to add the RSA host key for IP address '10.143.9.1' to the list of known hosts (/home/uccaoke/.ssh/known_hosts)
</code>
</div>





==="ssh: Unsupported option - -x" errors===

These errors indicate that you are attempting to use the QLogic version of mpirun in the OpenMPI parallel environment. It is likely you are doing this by accident and probably intend to use the OpenMPI mpirun but do not have your modules configured correctly.  

Please add the lines below, either after default modules (defmods) are loaded in your .bashrc, or else in your job script before mpirun:

[[Category:Pages with bash scripts]]


<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 module remove mpi/qlogic/1.2.7/gnu
 module add mpi/openmpi/1.4.1/intel
</code>
</div>




'''Note''': the above assumes you are using the Intel compilers.

===You get "Program not started through mpirun. Exiting..." but are using mpirun!===

This is most often caused by launching a program built with QLogic MPI with the mpirun from another MPI implementation (e.g. OpenMPI). You can determine which version of MPI your program was built with by running ldd on the application binary.

===You want to know where the libraries loaded via modules system are on disk===

If the output of ldd shows that your binary is linked to /usr/mpi/qlogic//lib64/libmpich.so.2 then your application was built with QLogic.  If it links to /usr/mpi/intel/openmpi-1.4.1-qlc//lib64/libmpi.so.0 it was built with OpenMPI.  Adjust the environment (parallel environment, modules loaded in your script/.bashrc) to match your binary, or re-build your binary with the MPI you are using in your job script.

Look at the contents of the default modules to find the path to those libraries on the current system. Look at the following command listing:

[[Category:Pages with bash scripts]]


<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 Legion [login04] tmp > module list
 Currently Loaded Modulefiles:
  1) sge/6.2u3                    4) intel/mkl/10.2.5/035         7) nedit/5.6
  2) ucl                          5) ofed/qlogic/intel/64/1.2.7   8) mrxvt/0.5.4
  3) intel/compiler/11.1/072      6) rcops/1.0
 Legion [login04] tmp > module avail hdf
 ------------------------------------------ /shared/ucl/apps/modulefiles -------------------------------------------
 hdf/64/4.2r4    hdf/64/5-1.6.10
 Legion [login04] tmp > module load hdf/64/5-1.6.10
 Legion [login04] tmp > module list
 Currently Loaded Modulefiles:
  1) sge/6.2u3                    4) intel/mkl/10.2.5/035         7) nedit/5.6
  2) ucl                          5) ofed/qlogic/intel/64/1.2.7   8) mrxvt/0.5.4
  3) intel/compiler/11.1/072      6) rcops/1.0                    9) hdf/64/5-1.6.10
 Legion [login04] tmp > module show ofed/qlogic/intel/64/1.2.7 hdf/64/5-1.6.10 intel/compiler/11.1/072
 -------------------------------------------------------------------
 /shared/ucl/apps/modulefiles/ofed/qlogic/intel/64/1.2.7:
 module-whatis	 adds Qlogic-MPI to your environment variables 
 prepend-path	 PATH /usr/mpi/qlogic//bin 
 prepend-path	 PATH /usr/mpi/qlogic//sbin 
 append-path	 MANPATH /usr/mpi/qlogic//share/man 
 setenv		 MPI_HOME /usr/mpi/qlogic/ 
 setenv		 MPI_RUN /usr/mpi/qlogic//bin/mpirun 
 setenv		 MPICH_CC icc 
 setenv		 MPICH_CCC icpc 
 setenv		 MPICH_F77 ifort 
 setenv		 MPICH_F90 ifort 
 setenv		 MPICH_ROOT /usr/mpi/qlogic/ 
 prepend-path	 LD_RUN_PATH /usr/mpi/qlogic//lib64 
 prepend-path	 LD_LIBRARY_PATH /usr/mpi/qlogic//lib64 
 -------------------------------------------------------------------
 -------------------------------------------------------------------
 /shared/ucl/apps/modulefiles/hdf/64/5-1.6.10:
 module-whatis	 Adds HDF 5-1.6.1  to your environment 
 prepend-path	 PATH /shared/ucl/apps/hdf5-1.6.1/bin 
 append-path	 LD_LIBRARY_PATH /shared/ucl/apps/hdf5-1.6.1/lib 
 -------------------------------------------------------------------
 -------------------------------------------------------------------
 /shared/ucl/apps/modulefiles/intel/compiler/11.1/072:
 module-whatis	 adds Intel compilers to your environment variables 
 append-path	 PATH /cm/shared/apps/intel/toolkit/Compiler/11.1/072//bin 
 append-path	 PATH /cm/shared/apps/intel/toolkit/Compiler/11.1/072//bin/intel64
 append-path	 MANPATH /cm/shared/apps/intel/toolkit/Compiler/11.1/072//man 
 append-path	 LD_LIBRARY_PATH /cm/shared/apps/intel/toolkit/Compiler/11.1/072//lib 
 append-path	 LD_LIBRARY_PATH /cm/shared/apps/intel/toolkit/Compiler/11.1/072//lib/intel64 
 setenv		 INTEL_LICENSE_FILE /cm/shared/licenses/intel/ 
 setenv		 INTEL_CC_HOME /cm/shared/apps/intel/toolkit/Compiler/11.1/072/ 
 setenv		 INTEL_FC_HOME /cm/shared/apps/intel/toolkit/Compiler/11.1/072/ 
 -------------------------------------------------------------------
</code>
</div>




As you can see, the modules system sets the paths to libraries in environment variables which the system uses to locate files.

===Unable to run job: JSV stderr: perl: warning: Setting locale failed.===

This error is generally because your SSH client is passing LANG through as part of the SSH command, and is passing something that conflicts with what Legion has it set to. You may be more likely to come across this with newer versions of Mac OS X - if your client is different, have a look for an equivalent option.

In Mac OS X Terminal, click Settings and under International untick the box that says "Set locale environment variables on startup".

Per session, you can try <code>LANG=C ssh userid@legion.rc.ucl.ac.uk</code>

===Why can't I find out when my job will run?===

An informative discussion on this matter can be found in the [[Legion Scheduler]] section of the User Guide.

===What can I do to minimise the time I need to wait for my job(s) to run?===

# Minimise the amount of wall clock time you request.
# Use job arrays instead of submitting large numbers of jobs (see our [[Legion Scripts | job script examples]]).
# Plan your work so that you can do other things while your jobs are being scheduled - the rule of thumb is that you will have to wait about twice the requested wall clock time (on average).

===What is my project code (short string) / project ID?===

Prior to July 2014, every user had a project code. Now all users belong to the default project "AllUsers" and no longer have to specify this. If you see older job script examples mentioning a project ID, you can delete that section. Only projects with access to paid or specialised resources need to give a project code in order to use those resources. If you do not know yours, contact rc-support.

===MPI Quiescence Errors===

If your code terminates with an error like the one below and you are using the QLogic MPI stack, try adding -q 0 to your mpirun command in your script.

[[Category:Pages with bash scripts]]


<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 MPIRUN.node-i24: MPI progress Quiescence Detected after 900 seconds.
 MPIRUN.node-i24: 256 out of 256 ranks showed no MPI send or receive progress.
 MPIRUN.node-i24: Per-rank details are the following:
 MPIRUN.node-i24: Rank    0 (node-i24        ) caused MPI progress Quiescence.
 MPIRUN.node-i24: Rank    1 (node-i24        ) caused MPI progress Quiescence.
</code>
</div>


==== Why does 'qsub -V' break? ====

SGE chokes on environment variables that contain % characters. To use the <code>-V</code> argument to <code>qsub</code> to import all environment variables, you'll need to unset any variables that do. Usually on Legion this is <code>LESSPIPE</code> and <code>NLSPATH</code>.

