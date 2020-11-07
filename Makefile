UNAME := $(shell uname -s)

ifeq ($(UNAME),Darwin)
	include .config/macos/Makefile
endif

ifeq ($(UNAME),Linux)
	include .config/linux/Makefile
endif
