# Makefile for simplix

BOOT    =boot/
KERNEL  =kernel/
LIB     =lib/
INCLUDE =include/ 

ARCH    =i586-elf-

AS	=$(ARCH)as
CC	=$(ARCH)gcc
LDFLAGS	=-lgcc
CFLAGS	=-std=gnu99 -ffreestanding -O2 -Wall -Wextra -I$(INCLUDE)

DEPS    =
OBJS    =$(BOOT)boot.o $(KERNEL)kernel.o $(LIB)string.o
IMAGE   =simplix.bin
LDFILE  =linker.ld

%.o : %.c $(DEPS) 
	$(CC) -c $< -o $@ $(CFLAGS) 

%.o : %.s $(DEPS) 
	$(AS) -o $@ $<


$(IMAGE) : $(OBJS)
	$(CC) -T $(LDFILE) -o $@ $(CFLAGS) -nostdlib $(OBJS) $(LDFLAGS)

.PHONY: $(IMAGE)

clean:
	rm -rf $(IMAGE)
	rm -rf $(BOOT)*.o
	rm -rf $(KERNEL)*.o
	rm -rf $(LIB)*.o

 
