# Skeleton Tree

Skeleton repository to quickly create kernel modules that integrate with the [Out-of-Tree](https://github.com/jollheef/out-of-tree) development tool.

## Project Structure

* /src - C source code (*.c) files
* /include - C header (*.h) files
* /out-of-tree - Out-of-Tree configuration and testing files
* Makefile - Standard kernel module makefile
* .travis.yml - Default Travis CI config file

## Necessary Changes for a New Project

`Makefile`
* Change the `TARGET` from `blank_module` to the name of your project.

`out-of-tree/.out-of-tree.toml`
* Change the `name` from `blank_module` to the name of your project.

## Makefile Additions

### Changing the Project Name

To change the project name (the name of the finished kernel module), edit the `TARGET` line.

For example, if we were to change the project name from `blank_module` to `hello_world`, we would change the following from

```
TARGET := blank_module
```

to

```
TARGET := hello_world
```

### Add C source files

To add C source files to your makefile, all you need to do is add an additional line specifying a new resultant object file.

For example, if we were to add a new file called `new_file.c`, we would change the following from

```
obj-m := $(TARGET).o
$(TARGET)-y += $(SRCDIR)/core.o
```

to

```
obj-m := $(TARGET).o
$(TARGET)-y += $(SRCDIR)/core.o
$(TARGET)-y += $(SRCDIR)/new_file.o
```

### Add Compilation Flags (CCFLAGS)

To add compilation flags to the build process of your kernel module, append the desired flags to the `ccflags-y +=` line.

For example, to append the pedantic flag to our build process, we can change the default line from

```
ccflags-y += -Wall
```

to

```
ccflags-y += -Wall -Wpedantic
```

## Project Recommendations

1. Add all of your C source code into the /src directory making additional subdirectories where necessary.
2. Do **not** edit the Travis CI configuration file unless you are very confident you can fix it if it breaks.
