
If you wish to submit a job that combines MPI and OpenMP parallelisation then you have a number of challenges you need to think about. First of all, you may need to use an MPI library that is thread safe. You should use IntelMPI which is loaded by default and not OpenMPI.

This guide will give you are short walk-through of the process of writing, building and running a simple hybrid code on Legion.

==Set up modules==

The default modules are correct - in case you have others loaded, these are what you need:

<code>
 module unload compilers mpi
 module load compilers/intel/2015/update2
 module load mpi/intel/2015/update3/intel
</code>


You can check the MPI you have loaded by running <code>mpif90 -v</code>  
You should see something similar to the output below:

 mpif90 for the Intel(R) MPI Library 5.0 Update 3 for Linux*
 Copyright(C) 2003-2015, Intel Corporation.  All rights reserved.
 ifort version 15.0.2


[[#top | back to top]]

[[Category:Pages with bash scripts]]
==Write code==
Shown below is a simple Fortran hello world that causes each thread to print its thread id and the MPI rank of its parent process.
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 <nowiki>
! This program demonstrates hybrid programming.

      program madhybrid
      use omp_lib
      implicit none

      include 'mpif.h'

      integer :: rank, nproc, ierr, i, id
      integer, dimension(MPI_STATUS_SIZE) :: status

! Initialise MPI.

      call MPI_INIT(ierr)

! Get the topology of the communicator.
      call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
      call MPI_COMM_SIZE(MPI_COMM_WORLD, nproc, ierr)

!$OMP PARALLEL PRIVATE(id)
      id = OMP_GET_THREAD_NUM()

      print *, 'I am process ', rank, ', thread ', id

!$OMP END PARALLEL

! Shut down MPI.
      call MPI_FINALIZE(ierr)

      end program madhybrid
</nowiki>
</code>
</div>

Save this program as hybrid.f90.

 

[[#top | back to top]]

==Compile the code==

To compile the code, you need to use the mpif90 compiler wrapper (or the C equivalent for your own C code) and pass it the -openmp option to enable the processing of OpenMP directives.  Run:

 mpif90 -o hybrid -openmp hybrid.f90

This should produce a binary called "hybrid" in your current working directory.

[[#top | back to top]]


[[Category:Pages with bash scripts]]
==Write job script and submit==
Amend the script below with the appropriate paths and save it as a shell script (hybrid.sh).  
You will request the total number of cores you wish to use, and either set $OMP_NUM_THREADS for the number of OpenMP threads yourself, or allow it to be worked out automatically by setting it to <code>OMP_NUM_THREADS=$(ppn)</code>. That will set $OMP_NUM_THREADS to $NSLOTS/$NHOSTS, so you will use threads within a node and MPI between nodes and don't need to know in advance what size of node you are running on. Gerun will then run $NSLOTS/$OMP_NUM_THREADS processes, round-robin allocated (if supported by the MPI). 

Therefore, if you want to use 24 cores on the type X nodes, with one MPI process per node and 12 threads per process you would request the example below.

Note that if you are using multiple nodes and ppn, you get exclusive access to those nodes, so if you ask for 2.5 nodes-worth of cores you will end up with more threads on the last node than you thought you had.
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 #!/bin/bash -l

 # Batch script to run a hybrid parallel job on Legion with the upgraded software
 # stack under SGE with Intel MPI.

 #$ -S /bin/bash

 # 1. Request ten minutes of wallclock time (format hours:minutes:seconds).
 #$ -l h_rt=0:10:0

 # 2. Request 1 gigabyte of RAM.
 #$ -l mem=1G

 # 3. Request 15 gigabyte of TMPDIR space per node (default is 10 GB)
 #$ -l tmpfs=15G

 # 4. Set the name of the job.
 #$ -N MadIntelHybrid

 # 5. Select the MPI parallel environment and 24 cores.
 #$ -pe mpi 24

 # 6. Set the working directory to somewhere in your scratch space.  This is
 # a necessary step with the upgraded software stack as compute nodes cannot
 # write to $HOME.
 #$ -wd /home/<your_UCL_id/scratch/output/

 # 7. Automatically set threads to processes per node: if on X nodes = 12 OMP threads
 export OMP_NUM_THREADS=$(ppn)

 # 7. Run our MPI job with the default modules. Gerun is a wrapper script for mpirun. 

 gerun $HOME/src/madscience/madhybrid
</code>
</div>

Submit this job using qsub as usual, and when it has run should should get output of the form:
<code>
 I am process            1 , thread            0
 I am process            0 , thread            0
 I am process            1 , thread            1
 I am process            0 , thread            1
 I am process            1 , thread            4
 I am process            1 , thread            3
 I am process            1 , thread            6
 I am process            0 , thread            4
 I am process            0 , thread            3
 I am process            0 , thread            5
 I am process            0 , thread            8
 I am process            0 , thread           11
 I am process            0 , thread            6
 I am process            1 , thread            2
 I am process            1 , thread            5
 I am process            0 , thread            2
 I am process            1 , thread            7
 I am process            1 , thread            8
 I am process            0 , thread            9
 I am process            0 , thread            7
 I am process            1 , thread           11
 I am process            0 , thread           10
 I am process            1 , thread            9
 I am process            1 , thread           10
</code>
Notice the random order of the output.  It's important to realise that the order of operations is not defined when they are run in parallel!

 
[[#top | back to top]]
