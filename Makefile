TARGET := blank_module
SRCDIR := src
KERNEL := /lib/modules/$(shell uname -r)/build

obj-m := $(TARGET).o
$(TARGET)-y += $(SRCDIR)/core.o

HEADERS := $(PWD)/include
ccflags-y := -I$(HEADERS)
ccflags-y += -Wall

all: module

module:
	make -C $(KERNEL) M=$(PWD) modules
	@if [ -f "module_test.sh" ]; then\
		mv "module_test.sh" $(TARGET).ko_test;\
	fi

clean:
	make -C $(KERNEL) M=$(PWD) clean
