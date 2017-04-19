SUBDIRS=$(shell ls -l | grep ^d | awk '{print $$9}')
CUR_SOURCE=$(wildcard *.$(SOURCE_POSTFIX))
CUR_OBJS=$(patsubst %.$(SOURCE_POSTFIX),$(OBJS_DIR)/%.o,$(CUR_SOURCE))

all:$(SUBDIRS) $(CUR_OBJS)
$(SUBDIRS):ECHO
	make -C $@
$(CUR_OBJS):$(OBJS_DIR)/%.o:%.$(SOURCE_POSTFIX)
	$(CC) -c $(OPTIONS) $< -o $@
ECHO:
	@echo $(SUBDIRS)
