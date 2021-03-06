WRONG
=====
Every single build system for C/C++ is wrong, especially this one.

Example
=======
```cpp
#include <wrong/mistake>

using namespace wrong;
using namespace wrong::action;

int
main ()
{
	mistake my;

	// Build a C++ executable called "wrongest".
	auto wrongest = my.program("wrongest",
		sources("src/*.cpp") >>
		compile().flag("Os").language(compiler::language::cxx(17)) >>
		executable());

	return wrongest.build();
}
```

What grinds my gears
====================
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

It should not be a task runner
------------------------------
Most build sytems seem to conflate building things and running tasks, for
instance you don't want your build system to create packages for distributions,
or running tests, or doing whatever, you want your build system to build, and
that is it.

A typical setup could be using a `Mistake` to build a library or program or
whatever, and a `Makefile` to build the package or install the library, I don't
really care, I don't maintain distributions.

It must handle third-party dependencies
---------------------------------------
It doesn't need to be fancy, but if your build system can't download
third-party libraries and other dependencies and build them, then it's garbage.

No, I don't want to use git submodules, they're terrible, and no, I don't want
to just run `curl` in my `Makefile`, that's a terrible idea. And I seriously
hope you didn't just mutter the word _container_.

Building in different configurations or for entirely different targets is hell
------------------------------------------------------------------------------
A build system should handle different configurations depending on the target
and handle cross-compilation as easily as it handles building for the host.

This is especially important for embedded, but it's also important for desktops
and other garbage.

Modifying a dependency is practically impossible
----------------------------------------------
Ever needed to change a line in a dependency of a dependency, or add a file, or
do something before or after building?  Sucks to be you, you can't.

FAQ
===
Following are some questions (and answers) that I believe would be frequently
asked if anyone knew about this project.

Is it fast?
-----------
For some reason people seem to boast the speed of their build system as an
important perk, but yes, this is as fast as compiling a build system for your
specific use case.

So wait, am I supposed to build my build system, to then build my project?
--------------------------------------------------------------------------
Exactly, it sounds insane, but it's not!

As compilers and hardware got better doing this sort of thing is not
unreasonably slow anymore, and I mean, people are running **entire** JVM
instances to build their shit (looking at you `gradle`)

If you add a `Makefile` next to your `Mistake` you can then just run `make` to
build your stuff, and then add any other bullshit to your `Makefile` (like
package creation, running tests, whatever).

And you get free caching of the compiled output and recompilation only when the
`Mistake` actually changes!

```make
CXX       ?= g++
DEVICE    ?= EFR32MG12P433F1024GM48
COMMANDER ?= commander

build: Mistake.out
	@env DEVICE=$(DEVICE) ./Mistake.out

Mistake.out: Mistake
	@$(CXX) -O2 -g0 -xc++ -std=c++2a -Wall -fpermissive -o Mistake.out Mistake -lstdc++fs -lpthread

flash: build
	$(COMMANDER) flash --device $(DEVICE) firmware.bin
	
debug: flash
	$(COMMANDER) flash --device $(DEVICE) firmware.bin
	$(COMMANDER) swo read --device $(DEVICE)

.PHONY: build flash debug
```

Are you insane?
---------------
You tell me.
