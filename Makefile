
TSRC= test.c
CC= gcc
all:
	cp syscall_64.tbl /usr/src/linux-5.16.9/arch/x86/entry/syscalls/syscall_64.tbl
	cp sys.c /usr/src/linux-5.16.9/kernel/sys.c

test: $(TSRC)
	$(CC) $? -o test

clean:
	rm -rf test
