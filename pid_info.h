/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
#ifndef _UAPI_LINUX_PID_INFO_H
#define _UAPI_LINUX_PID_INFO_H

struct pid_info {
	int			pid;
	unsigned int		state;
	void			*stack;
	unsigned long long	age;
	int			child[10873];
	int			parent;
	char			root[4097];
	char			pwd[4097];
};

#endif /* _UAPI_LINUX_PID_INFO_H */
