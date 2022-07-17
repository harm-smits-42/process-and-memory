LOGIN=sel-melc
TSRC= test.c
CC= gcc
#Implement the "else" since we prob don't have same kernel name in /boot. When it's done I'll move out the shutdown -r now to common part.

all:
	cp syscall_64.tbl /usr/src/linux-5.16.9/arch/x86/entry/syscalls/syscall_64.tbl
	cp sys.c /usr/src/linux-5.16.9/kernel/sys.c
	cp pid_info.h /usr/src/linux-5.16.9/include/uapi/linux/pid_info.h
	make -C /usr/src/linux-5.16.9/ -j2
	cp /usr/src/linux-5.16.9/.config /boot/config-5.16.9
	cp /usr/src/linux-5.16.9/System.map /boot/System.map-5.16.9
ifeq ($(LOGIN),sel-melc)
	cp /usr/src/linux-5.16.9/arch/x86/boot/bzImage /boot/vmlinuz-5.16.9-lfs-11.1-sel-melc
	shutdown -r now
else
	echo "Hsmits"
endif

push:
	cp syscall_64.tbl /usr/src/linux-5.16.9/arch/x86/entry/syscalls/syscall_64.tbl
	cp sys.c /usr/src/linux-5.16.9/kernel/sys.c
	cp pid_info.h /usr/src/linux-5.16.9/include/uapi/linux/pid_info.h

test: $(TSRC)
	$(CC) $? -o test
	$(CC) sample.c -o sample

clean:
	rm -rf test sample
