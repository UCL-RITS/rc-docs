# Resource Allocation

For information about requesting additional resources see [Additional Resource Requests](Additional Resource Requests "wikilink").

Governance
==========

Resource allocation policy for Research Computing services is determined by the [CRAG](http://www.ucl.ac.uk/isd/about/governance/research-it/crag), informed by the user community.

The CRAG reports to the [Research Computing Governance Group](http://www.ucl.ac.uk/isd/staff/research_services/governance/research-computing-group).

Resource Allocation on Legion
=============================

Allocation of computational resources on the Legion cluster is based on a combination of job class, wait time and fairshare.

Resource allocation is based on four features of job:

-   Memory size
-   Core count
-   Licenses
-   Wall clock time

Legion has nodes of several different types, listed below. The tmpfs is the maximum size of \$TMPDIR that can be requested.

|Type|Cores per node|RAM per node|Connectivity|Nodes|Total Cores|tmpfs|
|----|--------------|------------|------------|-----|-----------|-----|
|T|32|1511GB|Ethernet|6|192|1536G|
|U|16|64GB|Infiniband|160|2560|792G|
|V|12 + 2 GPU|48GB|Ethernet|8|96 + 16GPU|358G|
|X|12|24GB|Infiniband|144|1728|173G|
|Y|12|24GB|Ethernet|99|1188|406G|
|Z|12|48GB|Ethernet|4|48|173G|
|S|16 + 2 MIC|64GB|Infiniband|10|160 + 20 MIC|1536G|
|O|16|64GB|Infiniband|36|576|792G|
|P|12 + 1 K40c GPU|8GB|Ethernet|1|12 + 1 K40c GPU|112G|
|Q|32|512GB|Ethernet|1|32|1024G|
||

Nodes of type W are the original nodes (now retired), whilst X, Y and Z are the new nodes added during the Legion III upgrade. Nodes of type X are for running parallel jobs, nodes of type Y are used for running jobs which can be run within one node (less than 12 cores) and nodes of type Z are used for jobs which require more memory. Types T, U and V were added later. Type T are for jobs with a high memory requirement. Type V are only for jobs which request a GPU. Type S are only for jobs which request a mic. The largest job that the general population of users can run on nodes of types U, S, O and Q will vary as they are mostly paid for by specific research groups.

When a job is submitted it is evaluated and automatically assigned to one of several classes, based on information in the job submission script:

In addition, as before, scheduling is based on the job type of the job. There are three job types:

-   Multi-node jobs: These jobs require more than one node of the type they have been assigned to.
-   Short, single-node jobs: These have a wall-clock time less than or equal to X minutes and fit within a single node of the type they have been assigned to.
-   Long, single-node jobs: These have a wall-clock time greater than X and fit within a single node of the type they have been assigned to.
-   X is under constant evaluation: Assumptions should not be made as to the value of X at any given time.

### Assignment rules

The policy defined by the CRAG for scheduling jobs is based on the eight rules below:

1.  Resource requests that cannot be satisfied will cause the job to be rejected at submit time.
2.  The number of nodes a job will use will be determined independently for each node class. When this is combined with run time requirements, may cause the jobs to not be eligible to run on a particular node class.
3.  Single node jobs will share the node they run on with other single node jobs to the limit of available resources.
4.  Long Single Node jobs are banned from node classes X and U.
5.  Multi node jobs are banned from node classes Y and Z.
6.  Only jobs that request a GPU can use nodes of type V.
7.  Only jobs that request a MIC can use nodes of type S.
8.  Nodes of type T have a scheduling policy like Y/Z for jobs that use \> 64GB RAM. Other jobs are limited to 1hr. (There is a complication that smp jobs of 3-32 cores need to request at least 24G per core).
9.  Jobs requiring Licenses will run on those nodes where they consume the fewest licenses.
10. Users can specify which node classes their jobs will run on, provided that they do not contradict the policy set above.
11. Any other resource matching will be done automatically by the scheduler to soonest available resource.

Wallclock times
---------------

Specific information related to wall-clock times and where jobs will run is summarised in the table below.

|Wall clock time|X|Y|Z|T|U|V|S|
|---------------|---|---|---|---|---|---|---|
|\<=15 mins|\<=1 node|\<=1 node|\<=1 node|\<=1 node|\<=1 node\*|\<=1 node\*|\<=10 nodes\*|
|\<=12 hours|2-72 nodes|\<=1 node|\<=1 node|\<=1 node\*|\<=1-36 nodes\*|\<=1 node\*|\<=10 nodes\*|
|\<=1 day|2-42 nodes|\<=1 node|\<=1 node|\<=1 node\*|2-25 nodes\*|\<=1 node\*|\<=1 node\*|
|\<=2 days|2-21 nodes|\<=1 node|\<=1 node|\<=1 node\*|2-16 nodes\*|\<=1 node\*|\<=1 node\*|
|\<=3 days|0|1 core|1 core|1 core\*|0\*|1 core\*|0|

*\* marks combinations that have other restrictions as described in the rules above.*

The priority of jobs is set as follows:

1.  \<=15 min and \<=1 node and eligible for X are set the lowest priority because it is expected that these jobs will obtain resources via backfill.
2.  All other jobs have priority set inversely proportional to the wall-clock time.
3.  With the exception of the jobs in point 1, there is no relationship between priority and job size.
4.  Fair-share and wait times are weighted in the priority calculation.

In addition to the priority assigned based on job classes, jobs will also derive priority from fair share; jobs that have been waiting a long time, or have been submitted by a user and/or project that has not otherwise consumed many resources recently, will also acquire a higher priority.

Note that despite these priority assignments it may take longer to assign resources for large jobs than for small ones. However, the higher priority assigned to large jobs should prevent smaller jobs from delaying them. Jobs that request 64 nodes or a little less may be delayed by the requirement to run within a computational unit.

[ back to top](#top "wikilink")

Resource Allocation on Grace
============================

Grace is intended for parallel multi-node jobs requesting a minimum of 32 cores.

All nodes on Grace have 16 cores and 64G RAM. The maximum tmpfs that can be requested is 100G.

Jobs of less than 32 cores
--------------------------

Jobs of less than 32 cores will only run on two of the compute nodes and the maximum wallclock for those is 12hrs, intended for testing purposes. If people submit many jobs of that size, the queue for those two nodes will be long. These workloads should be run on Legion.

Wallclock times
---------------

|Cores|Max wallclock|
|-----|-------------|
|32-256|48hrs|
|257-512|24hrs|
|513-10912|12hrs|
||

You may have a very long queue time if you try to use the maximum job size...

[ back to top](#top "wikilink")

Priority access requests
========================

Requests to run jobs outside the above limits should be addressed to <rc-support@ucl.ac.uk> for review (see [ Priority Access](Legion Priority Access "wikilink")). A clear justification for the request must be included; where requests are made to run jobs for longer than 3 days, it is expected:

-   the code to be run has been optimised for Legion or Grace
-   the code to be run cannot do checkpoint/restart without major modifications.

[ back to top](#top "wikilink")

