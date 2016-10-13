
Below is the list of planned outages, partial or otherwise, which Research Computing Platforms will have to undergo for service improvements or due to external dependencies, such as data centre infrastructural works.

;Date: specifies the period of time during which the outage is expected to take place.

;Outage: details the Service and specific hardware affected by the outage.

;Comments: provides additional information such as details about how the service will be affected and advice.

{|style="width:100%;background-color:#F9F9F9;"
|-
!Date
!Outage
!Comments
|-
|Mon 26 Sept - Weds 28 Sept
|Legion outage
|This is to update Lustre firmware. The system should be considered at risk on the 29th and 30th after this. Legion login nodes will be unavailable from the morning of Monday 26th. If you are going to need any of your data during this time, please remember to copy it elsewhere before the outage, as there will be no access during this time. This will also mean a service interruption for the Research Software Development "Jenkins" service, which depends on Legion.
|-
|Mon 11 July - Tues 30 August
|Grace expansion outage
|Grace will taken out of service for this period in order to be undertake an expansion and upgrade of the compute, storage and interconnect fabric of the machine. These works will provide an additional 324 nodes (5,184 cores), a doubling in storage (scratch and home) and an InfiniBand network capable of scaling to circa 1000 nodes. This will effectively double the capacity of Grace in the short term and provide a much easier pathway for future expansions of the system. We have discussed the length of the outage, and potential options for mitigating this, with the Computational Resource Allocation Group. However, both the CRAG and Research IT Services members agree that the need to take a single long outage is the right decision in this instance given the breadth and complexity of the work that needs to be undertaken. We will be providing additional information, progress updates and any actions required from users prior to and during the system outage via the grace-users mailing list.
|-
|Thurs 12 May
|Grace outage
|There will be an all-day network outage at Slough so Grace will be down all day and not running jobs.
|-
|Mon 9 May
|Legion outage
|We are draining jobs for Monday so we can install updates to fix a kernel bug.
|-
|Mon 18 - Thurs 21 April 2016
|Legion outage
|Legion will be unavailable while we do some updates, test Lustre and enable Scratch quotas. It should be considered at risk for the rest of the week.
Update: Work still ongoing on Thurs 21.
|-
|Fri 1 April 2016
|Login05 outage
|The dedicated transfer node login05 will be re-imaged with the new Legion OS so will not be available for data transfer for part of the day.
|-
|Thurs 11 Feb 2016, 8-9am
|Grace connectivity at risk
|Network routing tests to Slough are being done between 8-9am. There may be some issues connecting to Grace during that window.
|-
|Mon 29 - Tues 30 June 2015
|Legion outage
|Legion will be unavailable while we replace an NFS controller and re-enable Lustre quotas. Weds 1 July should be considered at risk.
|-
|Tues 5 - Thurs 7 May 2015
|Legion outage
|Legion will be unavailable while we carry out a necessary software update to the parallel file system. The service should also be considered at risk on Fri 8 May.
|-
|Mon 9 - Tues 10 Mar 2015
|login05 outage
|Legion's dedicated transfer node, login05, will be unavailable from 10am on March 10th so we can move it to a new datacentre. It won't allow new logins after 10am on March 9th. 
|-
|Mon 19th Jan to Weds 21st Jan 2015
|Legion outage
|Legion will be down while we update the Lustre firmware. The 22nd and 23rd should also be considered at risk.
|-
|Fri 29th Nov to Mon 1st Dec 2014
|Legion outage
|Wolfson House Data Centre shutdown for remedial work to be carried out by Estates.
|-
|Midday Fri 31st Oct to Mon 10th Nov 2014
|Complete outage of Legion while electrical testing is done at Torrington Place data centre.
|During this time we also intend to move the remaining core infrastructure for Legion to the Torrington Place datacentre so that we avoid being affected by planned outages at the other datacentre later this year. 
|}

[[#top | back to top]]
