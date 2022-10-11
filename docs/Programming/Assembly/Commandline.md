# Commandline Arguments
Normally, when we want to pass commandline arguments to a program we call the program followed by the argument(s).
To understand what is going on I have written a simple program that will take file name as an argument from the Commandline, read and display it's contents to stdout. I'll debug the program using strace and gdb to understand what's going on behind the scenes

The program is called reader and it's assembled as a 32 bit program while the file we are going to read is called flag.txt.

![reader](images/cmdline_args/read.png)

# Strace and GDB

**Strace**
![strace](images/cmdline_args/strace.png)

**GDB**

![reader gdb](images/cmdline_args/reader_gdb.png)

# Strace and GDB explained

Running the program with strace, execve() is being called with **"./reader"** and **["./reader","flag.txt"]** as its parameters.

**Structure of  [execve()](https://man7.org/linux/man-pages/man2/execve.2.html)**

![execve](images/cmdline_args/execve.png)

**execve**

1. is used to execute a program
2. takes three arguments where the first two are our main concern which are **pathname** and **argv[]**
3. pathname must be either a binary executable, or a script
4. argv is an array of pointers to strings passed to the new program as its command-line arguments.  By convention, the first of these strings (i.e., argv[0]) should contain the filename associated with the file being executed.

In the gdb output, I've set the breakpoint at **_start** where the program instructions are, so no instruction has run yet. Position 1 in the gdb output shows the current position of the stack pointer which is at **0x3**.

If you know how the stack works, you know that it grows downwards from a high memory address to a lower memory address. This is evident by position 2 and 3 in the gdb output.

Checking the contents of the stack at gdb output 3, the file we are reading is at position **0012** while the stack pointer is at **0000** meaning we have to do **stack pointer + 8** (0012-0004)to get the first parameter.

From above, it's safe to say that when a program with commandline arguments is executed, execve places the number of arguments, pathname of the program and the program's arguments onto the stack and if we're going to write a 32 bit assembly program with commandline arguments, you have to keep these in mind:

* stack pointer + 0 = path to program
* stack pointer + 4 = program being executed
* stack pointer + 8 = first parameter
* stack poineter + 12 + _ _ so on _ _ = other parameters

The **reader** program source code can be found at [reader](reader.s)

