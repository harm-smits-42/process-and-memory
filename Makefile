LOGIN=hsmits
TSRC= test.c
CC= gcc
#Implement the "else" since we prob don't have same kernel name in /boot. When it's done I'll move out the shutdown -r now to common part.

all:
	cp syscall_64.tbl /usr/src/linux-5.19.2/arch/x86/entry/syscalls/syscall_64.tbl
	cp sys.c /usr/src/linux-5.19.2/kernel/sys.c
	cp pid_info.h /usr/src/linux-5.19.2/include/uapi/linux/pid_info.h
	make -C /usr/src/linux-5.19.2/ -j6
	cp /usr/src/linux-5.19.2/.config /boot/config-pm-5.19.2
	cp /usr/src/linux-5.19.2/System.map /boot/System.map-pm-5.19.2
	cp /usr/src/linux-5.19.2/arch/x86/boot/bzImage /boot/vmlinuz-5.19.2-lfs-11.2-pm-hsmits

push:
	cp syscall_64.tbl /usr/src/linux-5.19.2/arch/x86/entry/syscalls/syscall_64.tbl
	cp sys.c /usr/src/linux-5.19.2/kernel/sys.c
	cp pid_info.h /usr/src/linux-5.19.2/include/uapi/linux/pid_info.h

test:
	$(CC) test.c -o test
	$(CC) sample.c -o sample

clean:
	rm -rf test sample
	pidof sample | xargs kill -9 2>/dev/null || true
