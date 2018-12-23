BUILD    := $(shell mktemp -u)
CXX      ?= clang++
CXXFLAGS ?= -Wall -fpermissive

example:
	@$(CXX) -xc++ -std=c++17 -Wall -fpermissive -Iinclude ${CXXFLAGS} -o ${BUILD} example/Mistake -lstdc++fs
	@${BUILD}
	@rm -f ${BUILD}

.PHONY: example
