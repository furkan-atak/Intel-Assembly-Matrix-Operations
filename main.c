#include <stdio.h>
#include <stdlib.h>

void add(int* matrix1, int* matrix2, int* result, int size) {
    for(int i = 0; i < size*size; i++) {
        *(result+i) = matrix1[i] + matrix2[i];
    }
}

int sum(int* matrix1, int size) {
    int total = 0;
    for(int i = 0; i < size; i++) {
        total += *(matrix1+i);
    }
    return total;
}
void addFunction(int* matrix1, int* matrix2, int* result, int size);

int sumFunc(int* matrix1, int size);

int main(int argc, char** argv) {
    
    FILE* ptr;
    int ch;

    char* firstFile = argv[1];
    char* secondFile = argv[2]; 

    ptr = fopen(firstFile, "r");
    
    int size;
    fscanf(ptr, "%d", &size);
    int* arr = (int*)malloc(sizeof(int) * size*size);
    int i = 0;
    while (i != (size*size)) {
        fscanf(ptr, "%d", (arr+i));
        i++;
    }
    printf("\n");
    fclose(ptr);

    ptr = fopen(secondFile, "r");
    
    int size2;
    fscanf(ptr, "%d", &size2);
    int* arr2 = (int*)malloc(sizeof(int) * size2*size2);
    int i2 = 0;
    while (i2 != (size2*size2)) {
        fscanf(ptr, "%d", (arr2+i2));
        i2++;
    }
    printf("\n");
    fclose(ptr);

    int* total = (int*)malloc(sizeof(int) * size*size);
    int a = sumFunc(arr, size*size);

    printf("a: %d", a);

    // for(int i = 0; i < size*size; i++) {
    //     printf("%d, ", *(total+i));
    // }

    return 0;
}

