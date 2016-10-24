
These are tools developed by either the Research Computing group or users of the services, which may be useful to others. If you have a tool which you think might be useful to others, please feel free to send it to [mailto:rc-support@ucl.ac.uk rc-support@ucl.ac.uk]. If we think it's appropriate, we'll give it a look over and possibly some polish, and add it to the list.

These tools tend to be created for Legion in the first instance, so they may not all be appropriate on other systems.

These are located in:
<code>
 /shared/ucl/apps/userscripts
</code>
or can be used by loading the userscripts module:
<code>
 module load userscripts
</code>
You should be able to obtain more information about most of these scripts by typing the name of the script followed by "--help", for example:
<code>
qexplain --help
</code>

{| style="background-color:#F9F9F9;"
|- style="vertical-align:top;"
|qexplain
|
Prints the full error associated with a job in an error state.

Example use:
<code>
 qexplain 295381
</code>

|- style="vertical-align:top;"
|jobhist
|
Shows recently finished jobs, along with when they finished and, optionally, other information about them. Displays the last 24 hours by default.

Example use:
<code>
 jobhist --hours=100
</code>

|- style="vertical-align:top;"
|nodesforjob
|
Shows all the nodes that a currently-running job is running on, along with information on load, memory and swap being used.

Example use:
<code>
 nodesforjob 14281
</code>

|- style="vertical-align:top;"
|nodetypes
|
Show a list of currently-available node types, including the number of cores and amount of RAM they have. (Nodes that are down will not be counted, so the numbers will fluctuate).

Example use:
<code>
 nodetypes
</code>

|- style="vertical-align:top;"
|to-grace, to-legion
|
Copy files from Legion to Grace or vice versa. Uses login05 as the destination if copying to Legion. It will tar up the file/directory you give it, copy it to your home on the other machine and untar it again.

Example use:
<code>
 to-grace ~/Scratch/output/yrr
</code>

|}
