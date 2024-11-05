# using -fPIC to create Position Independent Code so that it would library can be loaded dynamically, it generates .o which is position-independent
# This enables, multiple processes to use the same memory space where the code is stored
# If -fPIC flag is not used, an absolute copy of the shared library will be used by each process independently which can be memory intensive. 
# -shared flag tells gcc to create a shared library using .so extension, it tells the linker to not look for the main function, as it may not be present in it.

gcc -fPIC -c my_functions.c
gcc -shared -o libmy_functions.so my_functions.o

rm -rf *.o


# Now the next step is
# - Either copy the .h and .so file and copy it them as follows
# - ^ .so -> /usr/lib
# - ^ .h -> /usr/include
#
# - add the directory where .so and .h are present via LD_LIBRARY_PATH
# - LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)
#
#
gcc -o main main.c -L$(pwd) -lmy_functions -I$(pwd)
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd) ./main

