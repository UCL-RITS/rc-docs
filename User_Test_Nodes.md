
The user test nodes are compute nodes in which you can work interactively. For example, these can be used to test whether your program will actually run on the cluster within the scheduled environment, or to estimate what the runtime of your program will be. 

You can access these nodes by making a request to the scheduler using the "qrsh" command and the usual scheduler options, e.g., the number of processes/threads you wish to use, wall clock time, memory per process, etc. You can also do visualisation and data analysis using an interactive X session.

 You can  request up to 48 cores for up to 2 hours. 

===Requesting Access===

You will be granted an interactive shell after running a command that checks with the scheduler whether the resources you wish to use in your tests/analysis are available. It typically takes the form.
<code>
 qrsh -pe mpi 8 -l mem=512M,h_rt=2:0:0
</code>
In this example you are asking to run eight parallel processes within an MPI environment, 512MB RAM per process, for a period of two hours (the maximum allowed). 

All other job types we support on the system are supported on the user test nodes (see our [[Legion Scripts | examples section]]). Likewise, all qsub options are supported like regular job submission with the difference that with qrsh they must be given at the command line, and not with any job script (or via -@). 

In addition the -now option is useful. By default qrsh and qlogin jobs will run on the next scheduling cycle or give up. At the moment this is varying from about 1 to 3 minutes and will hopefully decline as we work to optimise the scheduling cycle. You can opt to wait until nodes are available by adding a "-now no" option. 

===Interactive X sessions===

You can get an interactive X session from the head node of the job back to the login   node. The way to do this is to run the qrsh command in the following generic fashion:
<code>
 qrsh <options> <command> <arguments to <command>>
</code>
Where <code><command></code> is either a command to launch an X terminal like Xterm or Mrxvt or a GUI application like XMGrace or GaussView.

To make effective use of the X forwarding you will need to have logged in to the login node with ssh -X or some equivalent method.   Here is an example of how you can get a X terminal session with the qrsh command: 
<code>
 qrsh -l mem=512M,h_rt=0:30:0 \

    /shared/ucl/apps/mrxvt/0.5.4/bin/mrxvt -title 'User Test Node'
</code>

===Working on the nodes===

 If you want to run a command on one of your usertest nodes which is not the headnode, you can use this:
<code>
 ssh <hostname> <command> [args]
</code>
Where <code><hostname></code> can be obtained by inspecting the file $TMPDIR/machines.

===Profiling your processes===

We are currently working to provide a number of profiling tools that you can use to test your jobs.

One of the most important things to get right when submitting jobs is the amount of memory a job will require. A very good tool to determine the memory footprint of your processes over time is [http://code.google.com/p/memtop/ memtop]. It is a simple python script that you can download to your home directory and use to monitor the highest memory consuming processes whilst they are running. This, of course, can be used while in the user test nodes.

===GPU test nodes (experimental)===

You can also run GPU jobs interactively simply by adding the <code>-l gpu=1</code> or <code>-l gpu=2</code> options to the qrsh command. There are two user test nodes of this kind available at the moment but this number may vary depending on present needs of the community.

For more information, please contact us on [mailto:rc-support@ucl.ac.uk rc-support@ucl.ac.uk]

[[#top | back to top]]
