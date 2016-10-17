# Connecting to Research Data Services

The [Research Data Services](http://www.ucl.ac.uk/isd/services/research-it/research-data/) group (RDS) run a number of systems designed to help with data storage during and after a project. Several solutions for copying data between RDS and each of the central UCL research computing platforms are presented below. Sections of the example code surrounded by angle brackets (\<\>) should be replaced by the information indicated (do not keep the angle brackets in).

Between Legion and RDS
----------------------

If you already have an account with Research Data Services, you can transfer data directly between Legion and Research Data Storage using the Secure Copy (`scp`) command.

### From RDS to Legion

If you are on a research data login node, you can transfer data to Legion’s Scratch area at the highest rate currently possible by running the command: 

```
 scp data_file.tgz login05.external.legion.ucl.ac.uk:~/Scratch/
```

Or from somewhere within Legion (including compute nodes in running jobs) running the command: 

```
 scp ssh.rd.ucl.ac.uk:~/data_file.tgz ~/Scratch/
```

### From Legion to RDS

From Legion, send data to your project space on RDS by running the command: 

```
 scp data_file.tgz <user_name>@ssh.rd.ucl.ac.uk:<path_to_project_space>
```

The RDS support pages provide more information:

<http://www.ucl.ac.uk/isd/services/research-it/research-data/storage/access-guide>

Between RDS and Emerald
-----------------------

### From Emerald to RDS

Add the following to a file named *\~/.ssh/config* on Emerald:

```
ForwardAgent yes
ForwardX11 yes

Host rds
Hostname ssh.rd.ucl.ac.uk
User <user name>
ProxyCommand ssh <user name>@socrates.ucl.ac.uk -W %h:%p
```

Where *<user name>* is your UCL user name. Once this is done use scp in the usual way to copy files directly from Emerald to RDS; e.g.: 

```
 scp data_file.tgz rds:<path_to_project_space>
```

### From RDS to Emerald

Connections from RDS to Emerald do not have to go via a gateway, although access to Emerald is via ssh-key authentication only so it is necessary to set this up before copying data from RDS to Emerald. Once this is done, use scp in the usual way; e.g.: 
```
 scp data_file.tgz <user_name>@emerald.einfrastructuresouth.ac.uk:<target_path>
```

where `<user_name>` is your Emerald user name.


