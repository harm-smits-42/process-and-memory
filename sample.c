#include <stdlib.h>
#include <unistd.h>
int main()
{
	int pid =	fork();
	if (pid){
		fork();
	}

while (1)
	;
}
