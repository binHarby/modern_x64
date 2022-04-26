# Compiling x86_64 (On Linux)
```bash
# Compiling asm to an object file
nasm -elf64 -o [created object file name] [.asm file to compile]

# Linking the object file 
ld -o [output executable name] [object file name]
```

# Explaining program 1 (the hello world)

1. `db` stands for "defined bytes", means we're going to define some raw bytes
2. 10 means new line character or '\n'

3. text is name of the variable , a label in memory

# Main x86_64 regesiters:
1. rax includes(eax 32, ax 16, al 8)
2. rbx includes(ebx 32, bx 16, bl 8)
3. rcx includes(ecx 32, cx 16, cl 8)
4. rdx includes(edx 32, dx 16, dl 8)
5. rsi includes(esi 32,si 16, sil 8)
6. rdi includes(edi 32, di 16, dil 8)
7. rbp includes(ebp 32, bp 16, bpl 8)
8. rsp includes(esp 32, sp 16, spl 8)
9. rN, where N is 8-15 (total of 8 registers) include(rNd 32, rNw 16, rNb 8)

# System calls
`syscall` is when the program requests a service from the kernel

Syscalls differ by OS, becuz OSs have different kernals

all syscalls have an *ID* associated with them

a syscall takes a list of inputs (its a function)


| Argument| Register |
|---|---|
| ID |	rax |
| 1 | rdi |
| 2 | rsi |
| 3 | rdx |
| 4 | r10 |
| 5 | r8 |
| 6 | r9 |

So to use a syscall, load id of the syscall to rax,
then load arguments (1-6) into the given registers

there are 328 syscall (linux) 
for example 
| syscall | ID | ARG1 | ARG2 | ARG3 |
|---|---|---|---|---|
| sys_write | 1 | #filedescriptor (stdin 0, stdout 1,stderror 2) | $buffer (address to data/ the string) | count (length of string) |

there is also sys_exit to exit program

sys_exit id is 60, takes 1 arg which is the error code, if no error it should be 0 

so we would 
```asm
mv rax, 60 
mv rdi, 0
syscall 
```

to exit an x86_64 program

# Sections 
there is 3 sections in x86_64
1. `.data` section where all defined data before compilation
2. `.bss` section data allocated for future use ? 
3. `.text` section where the acutal code goes

# labels
A label is used to label a part of code, any time the label is used the name is replaced by the location in memory by compiler
