WRONG
=====
Every single build system for C/C++ is wrong, especially this one.

Concepts
========
Why do all build systems suck for me? Let's find out!

You need to learn some weird (and usually awful) DSL
----------------------------------------------------
Why the hell do I need to learn some godawful DSL some high or drunk programmer
came up with in an afternoon when I already know C++?

You need external tools, that you have to install
-------------------------------------------------
Why should I have to install external dependencies for building a C++ program?

Oh, your fancy build system doesn't need a stupid DSL? What do you say? It uses
Python/Groovy/node.js/Ruby/COBOL as a scripting language? Why, that's
wonderful, let me install _ANOTHER_ toolchain to build my C/C++ project. Oh
wait, the toolchain for the scripting language needs Perl and Python and a
shell to be built? And also a C compiler I guess. Why are you doing this to me?

Do you know what tool every C/C++ programmer has always installed aside from a
text editor? A fucking C/C++ compiler, because, and this might come as news to
you, they're going to build a C/C++ project.

It's not a task runner
----------------------
Most build sytems seem to conflate building and running tasks, for instance you
don't want your build system to create packages for distributions, or running
tests, or doing whatever, you want your build system to build, and that is it.

A typical setup could be using a `Mistake` to build a library or binary or
whatever, and a `Makefile` to build the package or install the library, I don't
really care, I don't maintain distributions.

It needs to handle third-party dependencies
-------------------------------------------
It doesn't need to be fancy, but if your build system can't download
third-party libraries and other dependencies and build them, then it's garbage.

No, I don't want to use git submodules, they're terrible, and no, I don't want
to just run `curl` in my `Makefile`, that's a terrible idea. And I seriously
hope you didn't just mutter the word _container_.

Building in different configurations or for entirely different targets
----------------------------------------------------------------------
A build system should handle different configurations depending on the target
and handle cross-compilation as easily as it handles building for the host.

This is especially important for embedded, but it's also important for desktops
and other garbage.

What do you mean with C/C++? Don't you know they're nothing alike?
------------------------------------------------------------------
I'm extremely aware saying C/C++ doesn't make sense as C and C++ are two
completely different programming languages, but in this case it makes sense as
they share the same build systems and compilation architecture.
