UNAME := $(shell uname -s)

ifeq ($(UNAME),Darwin)
	include macos/Makefile
endif
