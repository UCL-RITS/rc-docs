---
---

# Aristotle

## Overview

Aristotle is a stop-gap interactive service for teaching running on a pair of U-like Legion login nodes, each with 64 gigabytes of RAM and 16 cores. The machines run RHEL 6.5 and have a subset of the Legion software stack available. Users should not expect all the packages on the system to work, because it is using the Legion application stack which was built for Scientific Linux 5.x. The main aim of this service is to allow specific teaching courses to run that need to run Unix applications and have outgrown the Socrates service.

## Access

Anyone with a UCL userid and within the UCL institutional firewall can access Aristotle by connecting via ssh to:

`aristotle.rc.ucl.ac.uk`

This is a DNS round-robin pointing to two identical machines, `aristotle01` and `aristotle02`.

The userid and password you need to connect with are those provided to you by [Information Services Division](http://ucl.ac.uk/isd).

If you experience difficulties with your login, please make sure that you are typing your UCL user ID and your password correctly. If you still cannot get access, please contact us on [rc-support@ucl.ac.uk](mailto:rc-support@ucl.ac.uk).

If you are outside the UCL firewall, you will need to connect to Socrates first, as with [Legion](Accessing Legion "wikilink")

## User Environment

Aristotle runs Red Hat Enterprise Linux 6.5 and NFS mounts the [Legion software stack](Legion Software "wikilink"). This means a large number of packages are theoretically available although many of them may not work as they were build for Legion's Scientific Linux 5.x operating system. As this machine is intended for teaching, work has focused on getting specific applications required for specific courses to work and these are:

-   SAC
-   Phon
-   GMT
-   Fortran compilers (of which there are a large variety)

Packages are available through modules and users should consult the relevant [Legion modules documentation](Legion user environment "wikilink").

### Tested and working Legion packages

The following packages have been tested and work on Aristotle. The information in brackets includes the module(s) to load. For example to use Matlab:

```
module load matlab/full/r2013a/8.1-aristotle
matlab
```

-   Glasgow Haskell compiler v 7.6.3 (compilers/ghc/7.6.3)
-   GMT (GMT/5.1.1-goolf-1.4.10)
-   GNU C/C++/Fortran compilers v 4.6.3 (compilers/gnu/4.6.3)
-   Intel C/C++/Fortran compilers v 13.0 (compilers/intel/13.0/028)
-   Matlab R2013a (matlab/full/r2013a/8.1-aristotle)
-   Mrxvt v0.5.4 multi-tabbed terminal emulator for X - Xterm replacement (mrxvt/0.5.4)
-   Nag Fortran compiler (compilers/nag/5.3.1.907)
-   NONMEM (atlas/3.8.3/gnu.4.6.3 nonmem/7.3.0/gfortran\_rh6.5)
-   Phon (phon/1.37/gcc-4.7.2)
-   Python 2.7.3 and 3.3.0 (python/2.7.3/gnu.4.6.3, python/3.3.0/gnu.4.6.3)
-   R 3.1.1 (recommended/r-aristotle)
-   SAC (sac/101.6a)
-   SAS (sas/9.4/64 - also need directory \~/Scratch to exist)
-   TauP (taup/2.1.2)

