// main.c
#include <stdio.h>
#include <my_functions.h>

int main() {
    hello_world();
    int result = add(5, 3);
    printf("5 + 3 = %d\n", result);
    return 0;
}

