Folding@Home Desktop Client
=========

# NOTE issues are tracked in a separate repo at [fah-client-pub](https://github.com/FoldingAtHome/fah-client-pub/issues).

Folding@home is a distributed computing project -- people from
throughout the world download and run software to band together to
make one of the largest supercomputers in the world. Every computer
takes the project closer to our goals. Folding@home uses novel
computational methods coupled to distributed computing, to simulate
problems millions of times more challenging than previously achieved.

Protein folding is linked to disease, such as Alzheimer's, ALS,
Huntington's, Parkinson's disease, and many Cancers.

Moreover, when proteins do not fold correctly (i.e. "misfold"), there
can be serious consequences, including many well known diseases, such
as Alzheimer's, Mad Cow (BSE), CJD, ALS, Huntington's, Parkinson's
disease, and many Cancers and cancer-related syndromes.

# What is protein folding?
Proteins are biology's workhorses -- its "nanomachines." Before
proteins can carry out these important functions, they assemble
themselves, or "fold." The process of protein folding, while critical
and fundamental to virtually all of biology, in many ways remains a
mystery.

# Building from Source
FAHClient has several dependencies that must first be satisfied before
the client itself can be built.  This section outlines the recommended
procedure.

## Install Git & Scons
If you don't already have them install both Git and SCons:

 - http://git-scm.com/downloads
 - http://www.scons.org/download.php

Or in Debian Linux:

    sudo apt-get install scons git

## Get the Source
First create a build directory then get all the source repositories from GitHub:

    mkdir build
    cd build
    git clone https://github.com/CauldronDevelopmentLLC/cbang.git
    git clone https://github.com/FoldingAtHome/libfah.git
    git clone https://github.com/FoldingAtHome/fah-viewer.git
    git clone https://github.com/FoldingAtHome/fah-web-client.git
    git clone https://github.com/FoldingAtHome/fah-client.git

## Setup the Environment
In the *build* directory setup some environment variables which will allow
the build systems to find each other.

In Windows:

    set BUILD_ROOT=%HOMEPATH%\path\to\build
    set CBANG_HOME=%BUILD_ROOT%\cbang
    set LIBFAH_HOME=%BUILD_ROOT%\libfah
    set FAH_VIEWER_HOME=%BUILD_ROOT%\fah-viewer
    set FAH_WEB_CLIENT_HOME=%BUILD_ROOT%\fah-web-client
    set FAH_CLIENT_HOME=%BUILD_ROOT%\fah-client

Replace *%HOMEPATH%\path\to\build* with the correct path.

In Linux or OS-X:

    BUILD_ROOT=$HOME/path/to/build
    export CBANG_HOME=$BUILD_ROOT/cbang
    export LIBFAH_HOME=$BUILD_ROOT/libfah
    export FAH_VIEWER_HOME=$BUILD_ROOT/fah-viewer
    export FAH_WEB_CLIENT_HOME=$BUILD_ROOT/fah-web-client
    export FAH_CLIENT_HOME=$BUILD_ROOT/fah-client

Replace *$HOME/path/to/build* with the correct path.

It is often convenient to put these variables in a *env* file, or *env.bat* for
Windows.  Then you can reload the environment at any time with:

In Windows:

    env.bat

In Linux or OS-X:

    source ./env

## Build C!
See the link below for instructions:

  https://github.com/CauldronDevelopmentLLC/cbang#prerequisites

## Build FAHViewer
See the link below for instructions:

  https://github.com/FoldingAtHome/fah-viewer#prerequisites

## Build FAHClient
Once you've got the code, setup your environment and built both C! & FAHViewer:

    scons -C $LIBFAH_HOME
    scons -C $FAH_VIEWER_HOME
    scons -C $FAH_WEB_CLIENT_HOME
    scons -C $FAH_CLIENT_HOME

If all goes well this will produce *FAHClient* as well as a few other
executables in *$FAH_CLIENT_HOME*.

## Debug Build
To build in debug mode add `debug=1 optimze=0` to all of the *scons* commands.

## Troubleshooting
### Build Errors
If you encounter errors during the build process you can try bulding in
non-strict mode by adding `strict=0` to the *scons* commands.  This tells
the build system to not treat compile warnings as errors.

### SCons Configuration Errors
If a build fails, SCons will usually create a file called *config.log*.  If you
look towards the end of the file you can often see exactly what failed.  When
reporting build problems it is a good idea to include this file in the report.

### Resetting SCons
Sometimes SCons get's messed up.  This can happen if it is interrupted during
the configuration process.  You can delete SCons' data and start again with
the following commands:

In Windows:

    rd /S /Q .sconf_temp
    del .sconsign.dblite

In Linux or OS-X:

    rm -rf .scons*

Then try your build again.
