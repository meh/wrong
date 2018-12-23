WRONG
=====
Every single build system for C/C++ is wrong, especially this one.

Concepts
========
Why do all build systems suck for me? Let's find out!

It's not a task runner
----------------------
Most build sytems seem to conflate building and running tasks, for instance you
don't want your build system to create packages for distributions, or running
tests, or doing whatever, you want your build system to build, and that is it.

A typical setup could be using a `Mistake` to build a library or binary or
whatever, and a `Makefile` to build the package or install the library.

It needs to handle third-party dependencies
-------------------------------------------
It doesn't need to be fancy, but if your build system can't download
third-party libraries and other dependencies, then it's garbage.

Building in different configurations or for entirely different targets
----------------------------------------------------------------------
A build system should handle different configurations depending on the target
and handle cross-compilation as easily as it handles building for the host.

This is especially important for embedded, but it's also important for desktops
and other garbage.
