# PGI Compiler Suite Installation at UCL

UCL has two floating licences for PGI Fortran/C/C++ Server for Linux, purchased primarily for building Gaussian 03 and Gaussian 09 on UCL computers. To install follow the procedure below. 

These compilers require access to a license server which is not accessible from outside the UCL network. If you are installing or using them on a system outside the Institutional Firewall, please connect to the [UCL VPN service](http://www.ucl.ac.uk/isd/services/get-connected/remote-working/vpn) first.

## Steps

-   Download the version you need from the [UCL Software Database](http://swdb.ucl.ac.uk/) on your Linux system in a empty directory. You will need to login with your UCL userid and password.

-   Untar the installer files using:
```
tar -xzf pgilinux-2013-139.tar.gz
```

-   Run the installer as root and follow the instructions:
```
./install
```

-   During the installation you will be asked: *Do you wish to generate license keys? (y/n)* - Enter *n* as you will need to use the central UCL licence server.
-   Add the PGI Suite bin directory to your PATH. The default location used by the installer is */opt/pgi/linux86-64/13.9/bin*.
-   Open access to TCP ports 27000 and 27055 in your local firewall and any departmental firewall.
-   Setup access to the licence server by setting the `$LM_LICENSE_FILE` environment variable. Use this line:
```
export LM_LICENSE_FILE="${LM_LICENSE_FILE:-}${LM_LICENSE_FILE:+:}27000@lic-pgi.ucl.ac.uk"
```

The PGI compilers should now be installed and working.

