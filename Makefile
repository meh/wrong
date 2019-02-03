BUILD    := $(shell mktemp -u)
CXX      ?= clang++
CXXFLAGS ?= -Wall -fpermissive

example:
	@$(CXX) -g3 -xc++ -std=c++2a -Wall -fpermissive -Iinclude ${CXXFLAGS} -o ${BUILD} example/Mistake -lstdc++fs
	@${BUILD}
	@rm -f ${BUILD}

.PHONY: example
