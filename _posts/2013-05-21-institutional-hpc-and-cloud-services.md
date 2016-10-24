# Institutional HPC and Cloud services

publication-date: Tue, 21 May 2013 10:54:19 +0000
author: ccaabaa

There is a fundamental dissonance between how we do HPC today and how Cloud services are presented to their users.

In HPC users are directly exposed to the finiteness of resources by having to work with a scheduler, which more often than not wraps around their application - the computation happens implicitly and in a deferred manner, in a specific software stack - some work has to be done to port an application to a platform which in theory should be the same - linux and gnu running a scheduler and numerical libraries. Invariably the user has to wait for a near-non-deterministic amount of time to obtain their results.

With Cloud services, users are given resources nearly immediately and they have a very high degree of flexibility in terms of creating their own infrastructure to suit the needs of a particular workflow (or at least that is the promise), where infrastructure becomes software. There are performance bottlenecks for strong scaling applications mainly, but for other work loads networking is not much of an issue, with the exception of intense I/O on each machine (possibly). Researchers can prototype infrastructure at a fairly low cost. However the issues of financial and technological lock-in that were discussed earlier in the thread may kick in.

What we are finding is that the constraints to run workloads on the cloud are stemming from the following issues (apologies for poor wording beforehand):

1. cost (data transfer out of the public cloud seems to be the problem still)
2. institutional and research council accounting
3. software licensing (think Gaussian or Matlab)
4. data protection and privacy
5. put your favourite regulatory constraint here...

At UCL we had a number of conversations with researchers who use the cloud regularly and there is an interesting use case for institutional Research Computing resources, which is to schedule a "platform/application/database as a service" session at a given time and date via an advanced reservation to allow for unconstrained prototyping. This gives researchers some level of subsidy (or not) by the institution and data protection. We are therefore starting an R&D activity to explore this and other uses for "cloud", such as an actual private compute cloud service.

We are also looking at expanding our service first to cycle scavenging using VMs on UCL desktops, and possibly bursting to the cloud when that resource becomes contended. This is of course for pleasantly parallel work loads only - strong scaling work loads which depend on interconnect (with a few exceptions) will remain at the institution (or consortium), until there is a comparably good commercial proposition.

