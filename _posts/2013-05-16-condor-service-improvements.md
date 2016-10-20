# Condor Service Improvements

publication-date: Thu, 16 May 2013 15:41:38 +0000
author: uccaoke

Over the past year or so we have been working hard to make the Condor High Throughput service more attractive to users, with the aim that many of the "high throughput" (i.e. composed of many serial jobs) work-loads on Legion could be moved to this service which is relatively uncontended.

With this aim in mind, we now have a Research Computing managed software area, which is visible to all Condor jobs (and Condor jobs only) as drive `K:\`.  The software currently deployed in this area includes:
 
1. Enthought Python EPD 7.2-2 - This is a python distribution which comes with many of the useful modules pre-installed (e.g. Numpy/Scipy).  We have the deployed the same version as is available on Legion, so if your python scripts run with the version of EPD available from modules on Legion, then they should run on Condor!
2. MinGW + MSYS - This is a distribution of GNU compilers and some shell tools intended for building applications from source as native Windows binaries.
3. Cygwin - A fairly large install of Cygwin tools, including GNU compilers, various shell and archiving utilities, useful for porting/running ported UNIX applications on Windows, running shell scripts and so on.

We are currently working on having an R install, with the same packages as are available on Legion where possible which will be available later this year.  The availability of MinGW and Cygwin mean that it should no longer be necessary to have access to a 32 bit Windows machine to compile your code for Condor as the build process can be scripted and submitted as a job - if you have difficulty doing this, we are keen to help.

The Condor service consists of all the Windows Myriad desktops dotted about UCL and at last count was composed of around 2,200 cores which sit idle when they are not being used for desktop tasks.

Service Overview here:
<http://www.ucl.ac.uk/isd/staff/research_services/research-computing/services/condor/overview>

User Guide here:
<http://www.ucl.ac.uk/isd/staff/research_services/research-computing/services/condor/guide>
 
Application for Condor accounts for people with an existing UCL account is light-weight - simply drop an e-mail to <mailto:rc-support@ucl.ac.uk> saying you are interested and we will add you to the relevant UNIX group.

