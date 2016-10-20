# Quick Start Guide

This is a guide to Legion for users already familiar with operating in an HPC environment.

## Accessing the Legion cluster

Before accessing the Legion cluster, it is necessary to [ apply for an account](Account Services "wikilink"). Once you have received notification that your account has been created, you may log in via SSH to:

```
legion.rc.ucl.ac.uk
```

Your username and password are the same as those for your central UCL user id. Legion is only accessible from within UCL’s network. If you need to access it from outside, you need to log in via Socrates, a departmental machine, or install the IS VPN service.

More details on connecting to Legion are provided on the [Accessing RC Systems](Accessing RC Systems "wikilink") page.


## Managing data on the Legion cluster

Users on Legion have access to three pools of storage. They have a home directory (quota 50 gigabytes) which is mounted read only on the compute nodes and therefore cannot be written to by running jobs. They have a "scratch" area which does not have a hard quota, but does have the limitation that users may not store more than 200 gigabytes for a time period of over 14 days (or otherwise they will no longer be able to submit jobs to the queue). This limitation is in place to allow users to store very large amounts of data on scratch, but only for a short time. There is a link to this area called "Scratch" within the user’s home directory. Finally, users have access to temporary local storage on the nodes (environmental variable \$TMPDIR) which is cleared at the end of the job.

There is a dedicated transfer node with 10 gigabit network links to and from Legion available at:

```
login05.external.legion.ucl.ac.uk
```

For more details on the fairly complicated data management structures within Legion, see the [Managing Data on RC Systems](Managing Data on RC Systems "wikilink") page.


## Legion user environment

Legion runs an operating system based on Red Hat Enterprise Linux 7 with the Son of Grid Engine batch scheduler. UCL-supported and provided packages are made available to users through the use of the modules system.

| Command         | Use                     |
| ----            | ----                    |
| `module avail`  | lists available modules |
| `module load`   | loads a module          |
| `module remove` | removes a module        |

The module system handles dependency and conflict information.

You can find out more about the modules system on Legion on the [RC Systems user environment](RC Systems user environment "wikilink") page.


## Compiling your code

Legion provides Intel and GNU compilers, and OpenMPI and Intel MPI through the modules system, with the usual wrappers. For a full list of the development tools available see here or in the development tools/compilers sections of the modules system.

You can find out more about compiling code on Legion on the [ Legion Compiling](Legion Compiling "wikilink") page.


## Job scheduling policy and projects

A fair-share resource allocation model has been implemented on Legion. See resource allocation for more information and context.


## Submission scripts

Jobs submitted to the scheduler (with `qsub`) are shell scripts with directives preceded by `#$`. These directives are equivalent to command-line arguments passed to the `qsub` command, except that in the event of a conflict between the directives in the script and the arguments passed to `qsub`, command-line arguments take precedence.

A typical submission script is shown below. There is an additional [page with more examples of submission scripts](Example_Submission_Scripts.md), for more complex types.

```bash
#!/bin/bash -l
# ^-- makes the job run as a login shell, which means that it gets
#  all the same environment setup as if you'd logged in normally

# request ten minutes of wallclock time (format hours:minutes:seconds).
#$ -l h_rt=0:10:0

# request 1 gigabyte of RAM per process.
#$ -l mem=1G

# set the name of the job (used as default output file name and in the queue status display)
#$ -N MadScience_1_16

# select the MPI parallel environment and 16 processes.
#$ -pe mpi 16

# select the project that this job will run under. (Only used for special access to paid resources).
#$ -P <your_project_id>

# set the working directory to somewhere in your scratch space.
#$ -wd /home/<your_UCL_id>/Scratch/output

# The normal script section is below.
# This just prints out the date and time.

/bin/date
```

Jobs can be controlled with `qsub` (submit job), `qstat` (list jobs) and `qdel` (delete job). See the [ Introduction to batch processing](Legion Batch Processing "wikilink") page for more details.


## Testing Jobs using Interactive Submission

As well as batch (non-interactive) access to the system, you can request short interactive sessions on a small number of nodes at a time, to run interactive programs, experiment with methods, or debug awkward processes. These can be requested though the "qrsh" command. You need to provide qrsh with the same options you would include in your job submission script, so

```
qrsh -pe mpi 8 -l mem=512M,h_rt=2:0:0
```

is functionally equivalent to: 

```
 #!/bin/bash
 #$ -S /bin/bash
 #$ -pe mpi 8
 #$ -l mem=512M
 #$ -l h_rt=2:0:0
```

Except that the result of qrsh is an interactive shell. Note that these interactive sessions have to be scheduled just like ordinary jobs, so at times of high load on the cluster it may be difficult to fit one in in a reasonable amount of time. If the scheduler cannot allocate your interactive job in the next scheduling cycle (usually around 30 seconds), your request will be rejected with this message:

```
Your "qrsh" request could not be scheduled, try again later.
```


## More information

[ How the scheduler works](Legion Scheduler "wikilink")

[ Example submission scripts](Legion Scripts "wikilink")

[ Acknowledging the use of Legion in publications](Acknowledging Legion "wikilink")

[ Contact and support](Contact and Support "wikilink")

[ FAQ](Legion FAQ "wikilink")

[ Known issues](Legion Known Issues "wikilink")

[ Reporting Problems](Reporting problems "wikilink")

[ back to top](#top "wikilink")

