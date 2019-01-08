BUILD    := $(shell mktemp -u)
CXX      ?= clang++
CXXFLAGS ?= -Wall -fpermissive

example:
	@$(CXX) -g3 -xc++ -std=c++17 -Wall -fpermissive -Iinclude ${CXXFLAGS} -o ${BUILD} example/Mistake -lstdc++fs
	@gdb ${BUILD}
	@rm -f ${BUILD}

.PHONY: example
