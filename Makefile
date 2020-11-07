UNAME := $(shell uname -s)

ifeq ($(UNAME),Darwin)
	include .config/macos/Makefile
endif
