
On this page we describe some basic example scripts to submit jobs to Legion or Grace.

For a full description of data management policies, please refer to the [[Managing Data on RC Systems | data management section]] of the user guide.

After creating your script, submit it to the scheduler with <code>qsub yourscriptname</code>.

==Grace==

These scripts all also apply to Grace, but note that you should typically only be submitting multi-node MPI or hybrid MPI/OpenMP jobs there (smaller jobs should only be run for testing purposes).

==Note about projects==
Users who registered or re-registered after 23 July 2014 do not need to fill in a project name. Everyone is now part of the AllUsers project by default. Older job script examples will mention your project ID - you can delete that line.

Projects with access to paid or specialised resources should still use their project name when utilising those resources - add this to your job scripts.
<code>
 # Find <your_project_id> by running the command "groups"
 #$ -P <your_project_id>
</code>


[[Category:Pages with bash scripts]]
==Serial job script example==
The most basic type of job a user can submit to the Legion cluster is a serial job. These jobs run on a single processor with a single thread. 

Shown below is a simple job script that runs /bin/date (which prints the current date) on the compute nodes in Legion.

# This section sets the shell which runs the jobs on the compute nodes.
# This line sets the hard wall-clock time limit to ten minutes.
# This line requests 1 gigabyte of RAM.
# This line requests 15 gigabytes of TMPDIR space.
# This line sets the job name.
# This line sets the working directory. This must be set to a directory in scratch space because compute nodes cannot write to your home directory.
# This line moves makes $TMPDIR the current working directory.  This is necessary with serial jobs (but not for parallel jobs) because of the rate of data output caused by large numbers of serial jobs all writing to the one file-system.
# This line writes the output of /bin/date to the file "I_was_in_TMPDIR".
# This line archives files onto your scratch area with the "tar" utility.
<br />
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 #!/bin/bash -l

 # Batch script to run a serial job on Legion with the upgraded
 # software stack under SGE.

 # 1. Force bash as the executing shell.
 #$ -S /bin/bash

 # 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
 #$ -l h_rt=0:10:0

 # 3. Request 1 gigabyte of RAM 
 #$ -l mem=1G

 # 4. Request 15 gigabyte of TMPDIR space (default is 10 GB)
 #$ -l tmpfs=15G

 # 5. Set the name of the job.
 #$ -N MadScience_3

 # 6. Set the working directory to somewhere in your scratch space.  This is
 # a necessary step with the upgraded software stack as compute nodes cannot
 # write to $HOME.
 # Replace "<your_UCL_id>" with your UCL user ID :)
 #$ -wd /home/<your_UCL_id>/Scratch/output

 # 7. Your work *must* be done in $TMPDIR 
 cd $TMPDIR

 # 8. Run the application.
 echo $(/bin/date) > I_was_in_TMPDIR

 # 9. Preferably, tar-up (archive) all output files onto the shared scratch area
 tar zcvf $HOME/Scratch/files_from_job_$JOB_ID.tar.gz $TMPDIR

 # Make sure you have given enough time for the copy to complete!
</code>
</div>



 


[[Category:Pages with bash scripts]]
==OpenMP job script example==
The first type of parallel job that might be run is an OpenMP job. OpenMP uses a threaded shared memory (all processors share an address space). On Legion, these jobs may use up to twelve processors on type X, Y and Z nodes, the maximum that are available on one node of these types. The primary differences between this job script and the serial job script are in 6. where in our example twelve threads are selected. The $OMP_NUM_THREADS variable is set automatically to the number of threads.
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 #!/bin/bash -l

 # Batch script to run an OpenMP threaded job on Legion with the upgraded
 # software stack under SGE.

 # 1. Force bash as the executing shell.
 #$ -S /bin/bash

 # 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
 #$ -l h_rt=0:10:0

 # 3. Request 1 gigabyte of RAM for each core/thread
 #$ -l mem=1G

 # 4. Request 15 gigabyte of TMPDIR space (default is 10 GB)
 #$ -l tmpfs=15G

 # 5. Set the name of the job.
 #$ -N MadScience_2

 # 6. Select 12 threads (the most possible on Legion).
 #$ -pe smp 12

 # 7. Set the working directory to somewhere in your scratch space.  This is
 # a necessary step with the upgraded software stack as compute nodes cannot
 # write to $HOME.
 # Replace "<your_UCL_id>" with your UCL user ID :)
 #$ -wd /home/<your_UCL_id>/Scratch/output

 # 8. Run the application.
 $HOME/src/madscience/madpi
</code>
</div>



 

[[Category:Pages with bash scripts]]
==MPI job script example==
The default MPI implementation on our clusters is the Intel MPI stack. MPI programs don’t use a shared memory model so they can be run across multiple nodes.
This script differs considerably from the serial and OpenMP jobs in that MPI programs need to be invoked by a program called gerun. This is a wrapper for mpirun and takes care of passing the number of processors and a file called a machine file.

'''Important''': If you wish to pass a file to the stdin of an MPI program, you need to use the "-stdin filename" option (for some input file called "filename") rather than using redirections (<).  You can control which processes within your MPI job this file using the "-stdin-target" option.  By default, files passed with -stdin are passed to all process - see man page for mpirun for more details.

Note for older scripts: <code>-pe qlc</code> and <code>-pe mpi</code> are equivalent and will both work.

If you use OpenMPI, you need to make sure the Intel mpi modules are removed and the OpenMPI modules are loaded, either in your .bashrc, or else in the script itself.
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 #!/bin/bash -l

 # Batch script to run an MPI parallel job with the upgraded software
 # stack under SGE with Intel MPI.

 # 1. Force bash as the executing shell.
 #$ -S /bin/bash

 # 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
 #$ -l h_rt=0:10:0

 # 3. Request 1 gigabyte of RAM per process.
 #$ -l mem=1G

 # 4. Request 15 gigabyte of TMPDIR space per node (default is 10 GB)
 #$ -l tmpfs=15G

 # 5. Set the name of the job.
 #$ -N MadScience_1_16

 # 6. Select the MPI parallel environment and 16 processes.
 #$ -pe mpi 16

 # 7. Set the working directory to somewhere in your scratch space.  This is
 # a necessary step with the upgraded software stack as compute nodes cannot
 # write to $HOME.
 # Replace "<your_UCL_id>" with your UCL user ID :
 #$ -wd /home/<your_UCL_id>/Scratch/output

 # 8. Run our MPI job.  GERun is a wrapper that launches MPI jobs on our clusters.
 gerun $HOME/src/madscience/mad
</code>
</div>



 


[[Category:Pages with bash scripts]]
==Hybrid MPI/OpenMP (Intel MPI) job script example==
If you wish to submit a job that combines MPI and OpenMP parallelisation then you have a number of challenges you need to think about. First of all, you may need to use an MPI library that is thread safe. You should use IntelMPI which is loaded by default and not OpenMPI. See our [[Running Hybrid OpenMP/MPI Code]] page for a complete walkthrough of a hybrid code example.

You will request the total number of cores you wish to use, and either set $OMP_NUM_THREADS for the number of OpenMP threads yourself, or allow it to be worked out automatically by setting it to <code>OMP_NUM_THREADS=$(ppn)</code>. That will set $OMP_NUM_THREADS to $NSLOTS/$NHOSTS, so you will use threads within a node and MPI between nodes and don't need to know in advance what size of node you are running on. Gerun will then run $NSLOTS/$OMP_NUM_THREADS processes, round-robin allocated (if supported by the MPI). 

Therefore, if you want to use 24 cores on the type X nodes, with one MPI process per node and 12 threads per process you would request the example below.

Note that if you are using multiple nodes and ppn, you get exclusive access to those nodes, so if you ask for 2.5 nodes-worth of cores you will end up with more threads on the last node than you thought you had.
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 #!/bin/bash -l

 # Batch script to run a hybrid parallel job with the upgraded software
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

If you want to specify a specific number of OMP threads, you would alter the relevant lines above to this:

<code>
 # Run 12 MPI processes, each spawning 2 threads
 #$ -pe mpi 24
 export OMP_NUM_THREADS=2
 gerun your_binary
</code>

 

[[Category:Pages with bash scripts]]
==Array job script example (also for parallel)==
If you want to submit a large number of similar serial jobs then it may be easier to submit them as an array job. Array jobs are similar to serial jobs except that in line 5. we have told Sun Grid Engine to run 10,000 copies of this job numbered 1 to 10,000. Each job in this array will have the same JobID but a different task ID. The task ID is stored in the $SGE_TASK_ID environment variable in each task. All the usual SGE output files have the task ID appended. MPI jobs and parallel shared memory jobs can also be submitted as arrays.
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 #!/bin/bash -l

 # Batch script to run a serial array job with the upgraded
 # software stack under SGE.

 # 1. Force bash
 #$ -S /bin/bash

 # 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
 #$ -l h_rt=0:10:0

 # 3. Request 1 gigabyte of RAM.
 #$ -l mem=1G

 # 4. Request 15 gigabyte of TMPDIR space (default is 10 GB)
 #$ -l tmpfs=15G

 # 5. Set up the job array.  In this instance we have requested 10000 tasks
 # numbered 1 to 10000.
 #$ -t 1-10000

 # 6. Set the name of the job.
 #$ -N array

 # 7. Set the working directory to somewhere in your scratch space.  This is
 # a necessary step with the upgraded software stack as compute nodes cannot
 # write to $HOME.
 # Replace "<your_UCL_id>" with your UCL user ID :)
 #$ -wd /home/<your_UCL_id>/Scratch/output

 # 8. Run the application.

 echo "$JOB_NAME $SGE_TASK_ID"
</code>
</div>



 

[[Category:Pages with bash scripts]]
==Array job script with a stride==
If each task for your array job is very small, you will get better use of the cluster if you can combine a number of these so each has a couple of hours' worth of work to do. There is a startup cost associated with the amount of time it takes to set up a new job. If your job's runtime is very small, this cost is proportionately high, and you incur it with every array task.

Using a stride will allow you to leave your input files numbered as before, and each array task will run N inputs.

For example, a stride of 10 will give you these task IDs: 1, 11, 21...

Your script can then have a loop that runs task IDs from $SGE_TASK_ID to $SGE_TASK_ID + 9, so each task is doing ten times as many runs as it was before.
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 <nowiki>
 #!/bin/bash -l

 # Batch script to run an array job with the upgraded
 # software stack under SGE.

 # 1. Force bash
 #$ -S /bin/bash

 # 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
 #$ -l h_rt=0:10:0

 # 3. Request 1 gigabyte of RAM.
 #$ -l mem=1G

 # 4. Request 15 gigabyte of TMPDIR space (default is 10 GB)
 #$ -l tmpfs=15G

 # 5. Set up the job array.  In this instance we have requested task IDs
 # numbered 1 to 10000 with a stride of 10.
 #$ -t 1-10000:10

 # 6. Set the name of the job.
 #$ -N arraystride

 # 7. Set the working directory to somewhere in your scratch space.  This is
 # a necessary step with the upgraded software stack as compute nodes cannot
 # write to $HOME.
 # Replace "<your_UCL_id>" with your UCL user ID :)
 #$ -wd /home/<your_UCL_id>/Scratch/output

 # 8. Automate transfer of output to Scratch from $TMPDIR.
 #Local2Scratch

 # 9. Do your work in $TMPDIR 
 cd $TMPDIR

 # 10. Loop through the IDs covered by this stride and run the application if 
 # the input file exists. (This is because the last stride may not have that
 # many inputs available). Or you can leave out the check and get an error.
 for (( i=$SGE_TASK_ID; i<$SGE_TASK_ID+10; i++ ))
 do
   if [ -f "input.$i" ]
   then
     echo "$JOB_NAME $SGE_TASK_ID input.$i"
   fi
 done
</nowiki>
</code>
</div>





[[Category:Pages with bash scripts]]
==Array job script with parameters file example==
Often a user will want to submit a large number of similar jobs but their input parameters don't match easily on to an index from 1 to n. In these cases it's possible to use a parameter file. To use this script a user needs to construct a file with a line for each element in the job array, with parameters separated by spaces.

E.g.
<code>
 0001 1.5 3 aardvark
 0002 1.1 13 guppy
 0003 1.23 5 elephant
 0004 1.112 23 panda
 0005 ...
</code>
Assuming that this file is stored in "~/Scratch/input/params.txt" (you can call this file anything you want) then the user can use awk/sed to get the appropriate variables out of the file as with the script below which stores them in $index, $variable1, $variable2 and $variable3.  So for example in task 4, $index = 0004, $variable1 = 1.112, $variable2 = 23 and $variable3 = panda.

Since the parameter file can be generated automatically from the user's datasets, this approach allows the simple automation, submission and management of thousands or tens of thousands of tasks.
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 <nowiki>
#!/bin/bash -l

# Batch script to run an array job with the upgraded
# software stack under SGE.

# 1. Force bash
#$ -S /bin/bash

# 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
#$ -l h_rt=0:10:0

# 3. Request 1 gigabyte of RAM.
#$ -l mem=1G

# 4. Request 15 gigabyte of TMPDIR space (default is 10 GB)
#$ -l tmpfs=15G

# 5. Set up the job array.  In this instance we have requested 1000 tasks
# numbered 1 to 1000.
#$ -t 1-1000

# 6. Set the name of the job.
#$ -N array-params

# 7. Set the working directory to somewhere in your scratch space.  This is
# a necessary step with the upgraded software stack as compute nodes cannot
# write to $HOME.
# Replace "<your_UCL_id>" with your UCL user ID :)
#$ -wd /home/<your_UCL_id>/Scratch/output

# 8. Parse parameter file to get variables.
number=$SGE_TASK_ID
paramfile=/home/<your_UCL_id>/Scratch/input/params.txt
 
index=`sed -n ${number}p $paramfile | awk '{print $1}'`
variable1=`sed -n ${number}p $paramfile | awk '{print $2}'`
variable2=`sed -n ${number}p $paramfile | awk '{print $3}'`
variable3=`sed -n ${number}p $paramfile | awk '{print $4}'`

# 9. Run the program (replace echo with your binary and options).
 
echo $index $variable1 $variable2 $variable3
</nowiki>
</code>
</div>



 

[[Category:Pages with bash scripts]]
==Automating data transfer with #Local2Scratch==
Users can automate the transfer of data from $TMPDIR to their scratch space by adding the directive #Local2Scratch to their script. At the end of the job, files are transferred from $TMPDIR to a directory in scratch with the structure <job id>/<job id>.<task id>.<queue>/.

The example below does this for a job array, but this works for any job type.
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 #!/bin/bash -l

 # Batch script to run an array job on with the upgraded
 # software stack under SGE and transfer the output to Scratch from local.

 # 1. Force bash
 #$ -S /bin/bash

 # 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
 #$ -l h_rt=0:10:0

 # 3. Request 1 gigabyte of RAM.
 #$ -l mem=1G

 # 4. Request 15 gigabyte of TMPDIR space (default is 10 GB)
 #$ -l tmpfs=15G

 # 5. Set up the job array.  In this instance we have requested 10000 tasks
 # numbered 1 to 10000.
 #$ -t 1-10000

 # 6. Set the name of the job.
 #$ -N local2scratcharray

 # 7. Set the working directory to somewhere in your scratch space.  This is
 # a necessary step with the upgraded software stack as compute nodes cannot
 # write to $HOME.
 # Replace "<your_UCL_id>" with your UCL user ID :)
 #$ -wd /home/<your_UCL_id>/Scratch/output

 # 8. Automate transfer of output to Scratch from $TMPDIR.
 #Local2Scratch

 # 9. Run the application in TMPDIR.
 cd $TMPDIR
 hostname > hostname.txt
</code>
</div>



 

[[Category:Pages with bash scripts]]
==GPU job script example (experimental)==
As described in the Legion Overview, we have eight GPU nodes, each with two NVIDIA  M2070 GPU cards.
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 #!/bin/bash -l

 # Batch script to run a GPU job on Legion under SGE.

 # 0. Force bash as the executing shell.
 #$ -S /bin/bash

 # 1. Request a number of GPU cards, in this case 2 (the maximum)
 #$ -l gpu=2

 # 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
 #$ -l h_rt=0:10:0

 # 3. Request 1 gigabyte of RAM 
 #$ -l mem=1G

 # 4. Request 15 gigabyte of TMPDIR space (default is 10 GB)
 #$ -l tmpfs=15G

 # 5. Set the name of the job.
 #$ -N GPUJob

 # 6. Set the working directory to somewhere in your scratch space.  This is
 # a necessary step with the upgraded software stack as compute nodes cannot
 # write to $HOME.
 # Replace "<your_UCL_id>" with your UCL user ID :)
 #$ -wd /home/<your_UCL_id>/Scratch/output

 # 7. Your work *must* be done in $TMPDIR 
 cd $TMPDIR

 # 8. load the cuda module (in case you are running a CUDA program
 module unload compilers mpi
 module load compilers/gnu/4.9.2
 module load cuda/7.5.18/gnu-4.9.2

 # 9. Run the application - the line below is just a random example.
 mygpucode

 # 10. Preferably, tar-up (archive) all output files onto the shared scratch area
 tar zcvf $HOME/Scratch/files_from_job_$JOB_ID.tar.gz $TMPDIR

 # Make sure you have given enough time for the copy to complete!
</code>
</div>



 


[[Category:Pages with bash scripts]]

It is possible to run MPI programs that use GPUs but only within a single node. The script below exemplifies how to run a program using 2 gpus and 12 cpus.
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 #!/bin/bash -l

 # 1. Force bash as the executing shell.
 #$ -S /bin/bash

 # 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
 #$ -l h_rt=0:10:0

 # 3. Request 12 cores, 2 GPUs, 1 gigabyte of RAM per CPU, 15 gigabyte of TMPDIR space
 #$ -l mem=1G
 #$ -l gpu=2
 #$ -pe mpi 12
 #$ -l tmpfs=15G

 # 4. Set the name of the job.
 #$ -N GPUMPIrun

 # 5. Set the working directory to somewhere in your scratch space.  This is
 # a necessary step with the upgraded software stack as compute nodes cannot
 # write to $HOME.
 #$ -wd /home/<your user id>/Scratch/output/

 # 6. Run our MPI job. You can choose OpenMPI or IntelMPI for GCC.
 module unload compilers mpi
 module load compilers/gnu/4.9.2
 module load mpi/openmpi/1.10.1/gnu-4.9.2
 module load cuda/7.5.18/gnu-4.9.2

 gerun myGPUapp
</code>
</div>

This will change once we have solved all the problems around the scheduler configuration.

 

[[Category:Pages with bash scripts]]
==Serial example checkpointed with BLCR (experimental)==
The BLCR library allows serial jobs to use automatic checkpointing, even if the program does not have its own checkpointing mechanism. Please consult the page on [https://wiki.rc.ucl.ac.uk/wiki/Legion_Checkpointing Checkpointing with BLCR] for more information.
<div style="background-color:#F9F9F9;width=100%;padding:5px 10px 5px 10px;"><code>
 <nowiki>
#!/bin/bash -l

# Batch script to run a serial job on Legion with BLCR.

# 1. Force bash as the executing shell.
#$ -S /bin/bash

# 2. Request ten hours of wallclock time (format hours:minutes:seconds).
#$ -l h_rt=10:00:0

# 3. Request 1 gigabyte of RAM 
#$ -l mem=1G

# 4. Request 15 gigabyte of TMPDIR space (default is 10 GB)
#$ -l tmpfs=15G

# 5. Set the name of the job.
#$ -N Baconate

# 6. Set the working directory to somewhere in your scratch space.  This is
# a necessary step with the upgraded software stack as compute nodes cannot
# write to $HOME.
# Replace "<your_UCL_id>" with your UCL user ID :)
#$ -wd /home/<your_UCL_id>/Scratch

# 7. Set the checkpointing mechanism as BLCR
#$ -ckpt BLCR 

# 8. Make SGE send a signal to your job when it's almost out of time to run
#$ -notify

# 9. Trap (catch) that signal and make it quit the job with a code that
#     makes SGE put it back in the queue.
trap 'exit 99' SIGUSR2

# 10. Only the state of files in $TMPDIR/saveme will be saved and restored,
#     so put any output files you're writing to there.
mkdir $TMPDIR/saveme
cd $TMPDIR/saveme
$HOME/myfiles/do_a_thing 

# 11. Preferably, tar-up (archive) all output files onto the shared scratch area
tar zcvf $HOME/Scratch/files_from_job_$JOB_ID.tar.gz $TMPDIR

# 12. Clean up saved checkpoints for this job and exit cleanly.
/usr/local/bin/onterminate clean
exit 0
</nowiki>
</code>
</div>




