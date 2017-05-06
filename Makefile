CC=g++
SOURCE_POSTFIX=cpp
ROOT_DIR=$(shell pwd)
OPTIONS=-O2 -std=c++11 -I$(ROOT_DIR)/include -L $(HOME)/usr/lib -L $(HOME)/usr/local/lib -I $(HOME)/usr/include -I $(HOME)/usr/local/include
BIN=zlong
OBJS_DIR=$(ROOT_DIR)/obj
BIN_DIR=$(ROOT_DIR)/bin
export CC SOURCE_POSTFIX OPTIONS ROOT_DIR BIN OBJS_DIR BIN_DIR 

SUBDIRS=$(wildcard src*) # source files
CUR_SOURCE=$(wildcard *.$(SOURCE_POSTFIX))
CUR_OBJS=$(patsubst %.$(SOURCE_POSTFIX),$(OBJS_DIR)/%.o,$(CUR_SOURCE)) # current objs

.PHONY:all OBJ LINK run 
all:OBJ LINK run
OBJ:$(SUBDIRS) $(CUR_OBJS)

$(SUBDIRS):ECHO
	make -C $@
ECHO:
	@echo $(SUBDIRS)
$(CUR_OBJS):$(OBJS_DIR)/%.o:%.$(SOURCE_POSTFIX)
	$(CC) -c $(OPTIONS) $< -o $@
LINK:OBJ
	make -C obj 
run:LINK
	$(BIN_DIR)/$(BIN)

.PHONY:clean cleanobj cleanbin edit
edit:
	vim -p *.cpp ./include/*.h
clean:cleanobj cleanbin
cleanobj:
	-rm -rf $(OBJS_DIR)/*.o
cleanbin:
	-rm -rf $(BIN_DIR)/$(BIN)
