# Installing GHC on Scientific Linux 5.x
publication-date: Tue, 20 May 2014 11:13:06 +0000
author: uccaoke
One of the packages we had requested a while back was the Glasgow Haskell Compiler, "GHC".  Unfortunately, we were unable to fulfill this request at the time because:

1. GHC doesn't provide current binaries that work on Scientific Linux 5.x
2. GHC is self-hosting (written in Haskell) which means you need GHC to build GHC.  It used to support installation from intermediate C files but sadly no more.

It is generally recommended that you install GHC with the [Haskell Platform](http://www.haskell.org/platform/) because that provides some
libraries and a package management tool called cabal.

Recently I started learning Haskell in my spare time and I decided to pull this package off the list of things that are pretty difficult and take a pass at it  while in a fairly long, boring meeting.

The current source release of the Haskell Platform is 2013.2.0.0, and looking at the documentation for it, it wants you to install GHC 7.6.3.  This then gets us into the aforementioned chicken and egg self-hosting problem.

Undeterred (I was in a really boring meeting) I started poking about on the web to find out what version of GHC *does* support RHEL 5 derivatives (of which Scientific Linux is one) and discovered that there are GHC binaries available from the developers for version 6.8.3 of GHC.  

Unfortunately, version 6.8.3 is not new enough to build version 7.6.3 of GHC.  This means we need to build some intermediary versions.

In the end I had to:

1. Install binaries of GHC 6.8.3
2. Build 6.10.4 from source with GHC 6.8.3
3. Build 7.0.3 from source with GHC 6.10.4
4. Build 7.6.3 from source with GHC 7.0.3
5. Build the Haskell Platform 2013.2.0.0 with GHC 7.6.3

And then I wrote some module files and did some tests.

And it seems to work (as much as you can test a package that complicated).

In order to use it on Legion, you need to have:

```
compilers/gnu/4.6.3
binutils/2.22/gnu-4.6.3
compilers/ghc/7.6.3
```

modules loaded, and then optionally (if you want to use the Haskell Platform stuff):

```
haskellplatform/2013.2.0.0
```

If you want to use Cabal to install packages, you'll need to create a directory for it to keep its settings on Scratch so you should do:

```
mkdir ~/Scratch/.cabal
ln -s ~/Scratch/.cabal ~/.cabal
cabal update
```

Before attempting to install packages.

