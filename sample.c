#include <stdlib.h>
int main()
{
	int pid =	fork();
	if (pid){
		fork();
	}

while (1)
	;
}
