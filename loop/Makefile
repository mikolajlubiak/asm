AS=nasm
ASFLAGS=-f elf64 -g
LD=gcc
LDFLAGS=-m64 -no-pie
SOURCES=$(wildcard *.asm)
OBJECTS=$(SOURCES:.asm=.o)
EXEC=main

all: $(SOURCES) $(EXEC)

$(EXEC): $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) -o $@

$(OBJECTS): $(SOURCES)
	$(AS) $(ASFLAGS) $(SOURCES)

clean:
	rm -rf *.o $(EXEC)
