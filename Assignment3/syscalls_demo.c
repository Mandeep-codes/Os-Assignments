#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>

int main() {
    pid_t pid;

    printf("Before fork. My PID: %d\n", getpid());

    pid = fork();

    if (pid < 0) {
        perror("Fork failed");
        exit(1);
    }
    else if (pid == 0) {
        // Child process
        printf("Child process running. PID: %d, Parent PID: %d\n", getpid(), getppid());
        exit(0);
    }
    else {
        // Parent process
        wait(NULL);
        printf("Parent process resumed. PID: %d\n", getpid());
    }

    return 0;
}
