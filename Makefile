# Makefile for simplix

BOOT    =boot/
KERNEL  =kernel/

ARCH    =i586-elf-

AS	=$(ARCH)as
CC	=$(ARCH)gcc
LDFLAGS	=-lgcc
CFLAGS	=-std=gnu99 -ffreestanding -O2 -Wall -Wextra

DEPS    =
OBJS    =$(BOOT)boot.o $(KERNEL)kernel.o
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

 
