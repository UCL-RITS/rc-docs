
This is a quick start guide to Legion for users already familiar with operating in an HPC environment.

=Accessing the Legion cluster =

Before accessing the Legion cluster, it is necessary to [[Account Services | apply for an account]]. Once you have received notification that your account has been created, you may log in via SSH to:

<code>legion.rc.ucl.ac.uk</code>

Your username and password are the same as those for your central UCL user id. Legion is only accessible from within UCL’s network. If you need to access it from outside, you need to log in via Socrates, a departmental machine, or install the IS VPN service.

More details on connecting to Legion are provided on the [[Accessing RC Systems]] page.

[[#top | back to top]]

=Managing data on the Legion cluster=

Users on Legion have access to three pools of storage. They have a home directory (quota 50 gigabytes) which is mounted read only on the compute nodes and therefore cannot be written to by running jobs. They have a "scratch" area which does not have a hard quota, but does have the limitation that users may not store more than 200 gigabytes for a time period of over 14 days (or otherwise they will no longer be able to submit jobs to the queue). This limitation is in place to allow users to store very large amounts of data on scratch, but only for a short time. There is a link to this area called "Scratch" within the user’s home directory. Finally, users have access to temporary local storage on the nodes (environmental variable $TMPDIR) which is cleared at the end of the job.

There is a dedicated transfer node with 10 gigabit network links to and from Legion available at:

<code>login05.external.legion.ucl.ac.uk</code>

For more details on the fairly complicated data management structures within Legion, see the [[Managing Data on RC Systems]] page.

[[#top | back to top]]

=Legion user environment=

Legion runs an operating system based on Red Hat Enterprise Linux 7 with the Son of Grid Engine batch scheduler. UCL-supported and provided packages are made available to users through the use of the modules system.

<code>module avail</code> - lists available modules

<code>module load</code> - loads a module

<code>module remove</code> - removes a module

The module system handles dependency and conflict information.

You can find out more about the modules system on Legion on the [[RC Systems user environment]] page.

[[#top | back to top]]

=Compiling your code=

Legion provides Intel and GNU compilers, and OpenMPI and Intel MPI through the modules system, with the usual wrappers. For a full list of the development tools available see here or in the development tools/compilers sections of the modules system.

You can find out more about compiling code on Legion on the [[Legion Compiling | Legion Compiling]] page.

[[#top | back to top]]

=Job scheduling policy and projects=

A fair-share resource allocation model has been implemented on Legion. See resource allocation for more information and context.


[[#top | back to top]]

=Submission scripts=

Jobs submitted to the scheduler (with "qsub") are shell scripts with directives preceded by #$.

<code> #!/bin/bash -l</code>

1. Force bash as the executing shell.

<code>
 #$ -S /bin/bash
</code>

2. Request ten minutes of wallclock time (format hours:minutes:seconds).

<code>
 #$ -l h_rt=0:10:0
</code>

3. Request 1 gigabyte of RAM per process.

<code>
 #$ -l mem=1G
</code>

4. Set the name of the job.

<code>
 #$ -N MadScience_1_16
</code>

5. Select the MPI parallel environment and 16 processes.
<code>
 #$ -pe mpi 16
</code>

7. Select the project that this job will run under. (Only if you have access to paid resources).

<code>
 #$ -P <your_project_id>
</code>

8. Set the working directory to somewhere in your scratch space.  

<code>
 #$ -wd /home/<your_UCL_id>/Scratch/output
</code>

You can then follow these directives with the commands your script would execute. Legion supports a wide variety of job types and we would strongly recommend you study the [[Legion Scripts | example scripts]].

Jobs can be controlled with "qsub" (submit job), "qstat" (list jobs) and "qdel" (delete job). See the [[Legion Batch Processing | Introduction to batch processing]] page for more details.

[[#top | back to top]]

=Testing jobs using User Test Nodes=

As well as batch access to the system, a small number of nodes are available for interactive access through the scheduler. These can be requested though the "qrsh" command. You need to provide qrsh with the same options you would include in your job submission script, so

<code>qrsh -pe mpi 8 -l mem=512M,h_rt=2:0:0</code>

Is functionally equivalent to:
<code>
 #!/bin/bash
 #$ -S /bin/bash
 #$ -pe mpi 8
 #$ -l mem=512M
 #$ -l h_rt=2:0:0
</code>
Except, of course, that the result of qrsh is an interactive shell. For more details of how to access the user test nodes, see the [[Legion Test Nodes | Testing jobs using User Test Nodes]] page.

[[#top | back to top]]

=More information=

[[Legion Scheduler | How the scheduler works]]

[[Legion Scripts | Example submission scripts]]

[[Acknowledging Legion | Acknowledging the use of Legion in publications]]

[[Contact and Support | Contact and support]]

[[Legion FAQ | FAQ]]

[[Legion Known Issues | Known issues]]

[[Reporting problems | Reporting Problems]]

[[#top | back to top]]
