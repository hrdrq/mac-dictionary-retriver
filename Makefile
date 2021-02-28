.PHONY: build

build: program.m
	gcc -framework Foundation program.m -o program.o -framework CoreServices -framework Foundation

start-server:
	python3 server.py