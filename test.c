#include <sys/syscall.h>
#include <unistd.h>

struct pid_info {
	int		pid;
	char		state;
	void		*stack;
	unsigned long	age;
	int		*childs;
	int		parent;
	char		*root;
	char		*pwd;
};

int main()
{	struct pid_info in;
	syscall(450, &in, 42);
}
