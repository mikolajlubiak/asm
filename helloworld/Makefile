AS=nasm
ASFLAGS=-f elf64
LD=ld
LDFLAGS=
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
