#include <stdio.h>
#include <stdlib.h>

void addFunction(int* matrix1, int* matrix2, int* result, int size);

int sumFunc(int* matrix1, int size);

int main(int argc, char** argv) {
    
    FILE* ptr;
    int ch;

    char* firstFile = argv[1];  // first command line argumant
    char* secondFile = argv[2]; // second command line argumant

    ptr = fopen(firstFile, "r");  // opening file in read mode
    
    int size;
    fscanf(ptr, "%d", &size);   // first int of file is the size
    int* arr = (int*)malloc(sizeof(int) * size*size);   // allocate memory for first matrix (matrices stored as array too so no need to identify **)
    int i = 0;  // feof(ptr) throws error in -m32 (x86) so i is counter to read indices until size 
    while (i != (size*size)) {
        fscanf(ptr, "%d", (arr+i));  // iterate arr using pointer arithmetic 
        i++;
    }
    fclose(ptr);

    int selection;  
    printf("To Use Add Function Press 1\n");
    printf("To Use Sum Function Press 2\n");
    scanf("%d",&selection);

    if(selection == 1){
        ptr = fopen(secondFile, "r");   // same file reading operations
        
        int size2;
        fscanf(ptr, "%d", &size2);
        int* arr2 = (int*)malloc(sizeof(int) * size2*size2);
        int i2 = 0;
        while (i2 != (size2*size2)) {
            fscanf(ptr, "%d", (arr2+i2));
            i2++;
        }
        fclose(ptr);

        int* total = (int*)calloc(sizeof(int),size*size); // allocate with calloc (allocate then set 0)
        addFunction(arr, arr2, total, size*size);   // call assembly func (define addFunction as global in the asm file)

        printf("The Result Matrix Is: \n");
        for(int i = 0; i < size; i++) {
            for(int j = 0; j < size; j++){
                printf("%d, ", *(total+(i*size)+j));    // column indexed matrix iteration with pointer arithmetic
            }
            printf("\n");
        }
        printf("\n");
    }else if(selection == 2) {
        int a = sumFunc(arr, size*size);    // calling assembly func (define sumFunc as global in the asm file)
        printf("Sum of the Matrix is: %d", a);
        printf("\n");
    }

    return 0;
}

