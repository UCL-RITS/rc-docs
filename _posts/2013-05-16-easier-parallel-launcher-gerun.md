# Easier parallel launcher for MPI jobs: gerun

publication-date: Thu, 16 May 2013 15:58:23 +0000
author: uccaoke
In our efforts to make Legion more user-friendly, we have implemented a set of wrapper scripts we call `gerun` (Grid Engine Run) which you can invoke instead of `mpirun` to launch MPI jobs.

The advantage of `gerun` is that you don't need to pass machine files, numbers of processors or RSH replacement programs to it - this is all worked out for you from your job.

This means that (for example) that whereas before for different MPI implementations (QLogic, OpenMPI, Intel MPI etc.) you had to pass a bunch of different options in your job scripts depending on the MPI used (so if your program was called `$HOME/src/madscience/mad`:

```
mpirun -m $TMPDIR/machines -np $NSLOTS $HOME/src/madscience/mad</code>
```

or

```
mpirun -machinefile $TMPDIR/machines -np $NSLOTS $HOME/src/madscience/mad
```

or

```
mpirun --rsh=ssh -machinefile $TMPDIR/machines -np $NSLOTS $HOME/src/madscience/mad
```

depending on the MPI you used), you can now use the following, regardless of which MPI implementation you are using (as long as you have the right modules loaded):

```
gerun $HOME/src/madscience/mad
```

If we add new MPIs to the system, we will also add support for them in gerun so you won't need to learn new options.

We are updating our documentation on the web-site to use this method for launching jobs.

You can still use `mpirun` to launch applications if you prefer.

