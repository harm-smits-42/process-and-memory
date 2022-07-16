#include <sys/syscall.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

struct pid_info {
	int		pid;
	unsigned int	state;
	void		*stack;
	unsigned long	age;
	int		childs[10873];
	int		parent;
	const char	*root;
	const char	*pwd;
};

int main(int argc, char **argv)
{
	if (argc != 2)
		return 2;
	struct pid_info in;
	syscall(450, &in, atoi(argv[1]));

	printf("pid=%d\n", in.pid);
	printf("state=%d\n", in.state);
	printf("stack=%p\n", in.stack);
	printf("age=%lu\n", in.age);
	for (int i = 0; in.childs[i] != 0; i++)
		printf("child(%d) pid=[%d]\n", i, in.childs[i]);
	printf("parent pid=%d\n", in.parent);
	printf("root=%s\n", in.root);
	printf("pwd=%s\n", in.pwd);
}
