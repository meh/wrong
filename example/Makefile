CXX ?= g++

build: Mistake.out
	@./Mistake.out

Mistake.out: Mistake
	@$(CXX) -O2 -g0 -xc++ -std=c++2a -Wall -fpermissive -o Mistake.out Mistake -lstdc++fs -lpthread -I..

.PHONY: build

