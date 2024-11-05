# Loading C Library As A System Library:
During my exploration of C libraries like ffmpeg. it came to my notice that some of the dependencies like <libavcodec.h> instead of "libavcodec.h".
## Let's break down the components of the C compilation to understand this further.
- All the User defined libraries are defined in double quotes are found in the same directory
- All the system defined libraries are found in /usr/lib or /usr/local/lib
- All system defined header files are found in /usr/include

## Solution 1
- To copy .so / .c /.h files into the /usr/lib and /usr/include
- This is a bad idea as in this case, othe c/c++ programs will also have access to dynamic libraries which are not needed

## Solution 2
- Instead use LD_LIBRARY_PATH flag to the exact location where .h/.so files are stored

# Details about the usage of different flags

## fPIC
- using -fPIC to create Position Independent Code so that it would library can be loaded dynamically, it generates .o which is position-independent
- This enables, multiple processes to use the same memory space where the code is stored
- If -fPIC flag is not used, an absolute copy of the shared library will be used by each process independently which can be memory intensive.

## shared
- -shared flag tells gcc to create a shared library using .so extension, it tells the linker to not look for the main function, as it may not be present in it.
