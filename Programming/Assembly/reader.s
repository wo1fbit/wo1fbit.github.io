.section .bss
.lcomm BUFFER, 40 ## BUFFER TO WRITE ABD READ FROM, 500 bytes in size

.section .text
.globl _start
_start:

## OPEN FILE WITH READ ONLY PERMISSIONS.
movl $666, %edx #file permision 666
movl $0, %ecx # read only
movl 8(%esp), %ebx # input file name into ebx
movl $5, %eax # 5 is the system call for open
int $0x80 # system interrupt

#######
####### after system call, the file descriptor is stored in the eax register
#######

# READ THE FILE
movl $500, %edx # size of our buffer specified by .lcomm. should be the length of the contents we want to write
movl $BUFFER, %ecx # move location of buffer into ecx for writing into from file descriptor
movl %eax, %ebx # when reading from, the file descriptor to read from
pushl %eax # save file descriptor onto the stack for later use
movl $3, %eax # load system call for reading from file descriptor into eax
int $0x80 # system interrupt

# WRITE TO STDOUT
movl $500, %edx # size of buffer/size of contents
movl $BUFFER, %ecx # where to read from
movl $1, %ebx # when writing to, the file descriptor of where to write
movl $4, %eax # system call for writing
int $0x80 # system interrupt

# CLOSE FILE
popl %ebx # remember we saved the file descriptor onto the stack, now we're popping it into ebx
movl $6, %ebx # system call for closing whatever is inside ebx
int $0x80 # system interrupt

## EXIT
movl $0, %ebx
movl $1, %eax
int $0x80
