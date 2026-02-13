#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

void* thread_function(void* arg) {
    printf("Thread running. Thread ID: %lu\n", pthread_self());
    sleep(2);
    printf("Thread finished.\n");
    return NULL;
}

int main() {
    pthread_t thread;

    printf("Main process ID: %d\n", getpid());

    pthread_create(&thread, NULL, thread_function, NULL);
    pthread_join(thread, NULL);

    printf("Main finished.\n");

    return 0;
}
