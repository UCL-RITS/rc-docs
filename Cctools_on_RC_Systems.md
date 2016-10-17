# cctools on RC Systems

**Current Version: 5.4.1**

Provides the Parrot connector to CVMFS, the CernVM File System.

The CernVM File System provides a scalable, reliable and low-maintenance software distribution service. It was developed to assist High Energy Physics (HEP) collaborations to deploy software on the worldwide-distributed computing infrastructure used to run data processing applications.

## Useful Links:

-   [CernVM website](https://cernvm.cern.ch)
-   [Parrot Connector for CernVM](https://cernvm.cern.ch/portal/filesystem/parrot)

## Setup

The following changes need to be made to the standard modules before running this software:

```
module load cctools/5.4.1/gnu-4.9.2
```

By default, the module sets the following: 
```
 export PARROT_CVMFS_REPO=<default-repositories> 
 export PARROT_ALLOW_SWITCHING_CVMFS_REPOSITORIES=yes 
 export HTTP_PROXY=DIRECT;
```

## Use

Example usage - will list the contents of the repository then exit:

```
 module load cctools/5.4.1/gnu-4.9.2
 parrot-run bash
 ls /cvmfs/alice.cern.ch
 exit
```

That will create the cache in `/tmp/parrot.xxxxx` on the login nodes when run interactively. To use in a job, you will want to put it somewhere in your space that the compute nodes can access. You can set the cache to be in your Scratch, or to `$TMPDIR` on the nodes if it just needs to exist for the duration of that job.

```
 export PARROT_CVMFS_ALIEN_CACHE=</path/to/cache>
```

