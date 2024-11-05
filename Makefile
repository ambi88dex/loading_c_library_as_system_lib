# Makefile to compile shared library and main program using LD_LIBRARY_PATH

# Compiler
CC = gcc

# Compiler Flags
CFLAGS = -fPIC -Wall

# Shared Library Name
LIB_NAME = libmy_functions.so

# Source and Object Files
LIB_SRC = my_functions.c
LIB_OBJ = my_functions.o
MAIN_SRC = main.c
MAIN_OBJ = main.o

# Include Paths
INCLUDE = -I$(CURDIR)

# Output Executable
OUTPUT = main

# Default Target
all: $(OUTPUT)

# Create Shared Library
$(LIB_NAME): $(LIB_OBJ)
	$(CC) -shared -o $(LIB_NAME) $(LIB_OBJ)

# Compile my_functions.c to object file
$(LIB_OBJ): $(LIB_SRC)
	$(CC) $(CFLAGS) -c $(LIB_SRC) -o $(LIB_OBJ)

# Compile main.c and link with the shared library
$(OUTPUT): $(MAIN_SRC) $(LIB_NAME)
	$(CC) $(MAIN_SRC) -o $(OUTPUT) -L$(CURDIR) -lmy_functions $(INCLUDE)

# Clean target to remove generated files
clean:
	rm -f $(LIB_OBJ) $(LIB_NAME) $(OUTPUT)

# Run the program
run: $(OUTPUT)
	LD_LIBRARY_PATH=$(CURDIR) ./$(OUTPUT)

