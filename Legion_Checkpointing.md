
The Berkeley Lab Checkpoint/Restart (BLCR) library is available on Legion to be used with serial jobs, allowing them to be automatically resubmitted to the queue and restarted from a saved checkpoint, even if the software being run doesn't support checkpointing itself.

'''BLCR is not currently available on new Legion.'''

===Useful Information===

* Jobs running with BLCR will save a checkpoint every 175 minutes.
* This means your job must have a wallclock time greater than 2hrs 55mins, and for safety's sake should be much greater.
* Each checkpoint overwrites any previous checkpoints for the same job.
* Checkpoints are saved in your home directory under ~/Scratch/.ckpt
* Jobs will automatically restart from their checkpoints.
* Positions in all open files are saved (this may lead to overwriting data created after a checkpoint).
* The state of any files in any directory in the $TMPDIR directory called "saveme" is also saved and restored, so put output files or other files that are being written to here.
* A job that has been resubmitted (for any reason, not just with BLCR) will have the additional state letter "R" in the output of "qstat".

If you already have an existing serial job script you would like to use BLCR with, simply make the changes listed below, or for an example, check our [https://wiki.rc.ucl.ac.uk/wiki/Example_Submission_Scripts_for_Legion#Serial_example_checkpointed_with_BLCR_.28experimental.29 Example Submission Scripts] page.

===Necessary Job Script Changes===

Add the following to the SGE options to enable BLCR, reload a checkpoint if one already exists, and make sure that the job is sent a signal shortly before it would be killed by the scheduler:
<code>
 #$ -ckpt BLCR 
 #$ -notify
</code>
Add this line before any long-running executable is run, to receive the signal and make sure the job gets put back in the queue:
<code>
 trap 'exit 99' SIGUSR2
</code>
Only the exact states of files in $TMPDIR/saveme are restored, so you may also want to create and move to the $TMPDIR/saveme directory:
<code>
 mkdir -p $TMPDIR/saveme
 cd $TMPDIR/saveme
 # run your command after here
</code>
Add this at the end of the job script to remove any left-over checkpoint files and exit cleanly:
<code>
 /usr/local/bin/onterminate clean
 exit 0
</code>

===Using BLCR with Java===

To checkpoint Java programs, you will also need to add this to your jobscript:
<code>
 export _JAVA_OPTIONS=-XX:-UsePerfData $_JAVA_OPTIONS
</code>

This is because by default Java also creates an hsperfdata file in /tmp, which will not be restored and will cause your job to fail when you try to restart it. This option tells the JVM not to do this.

If you get an error that looks like
<code>
 - open('/var/db/nscd/passwd', 0x0) failed: -13
 - mmap failed: /var/db/nscd/passwd
 - thaw_threads returned error, aborting. -13
 Restart failed: Permission denied
</code>

then you should also set this environment variable
<code>
 export LIBCR_DISABLE_NSCD=true
</code>
