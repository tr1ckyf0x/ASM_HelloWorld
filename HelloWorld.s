//
// Assembler program to print "Hello World!"
// to stdout.
//
// X0-X2 - parameters to linux function services
// X16 - linux function number
//
.global _start             // Provide program starting address to linker
.align 2

// Setup the parameters to print hello world
// and then call Linux to do it.

_start:
// Print equation
        mov X0, #1     // 1 = StdOut
        adr X1, equation_message // load address of the beginning of the string to be printed to register X1
        mov X2, #EQUATION_MESSAGE_LEN // move string length to register X2
        mov X16, #4     // MacOS write system call
        svc 0     // Call linux to output the string

// Print equation with arguments
        mov X0, #1     // 1 = StdOut
        adr X1, equation_formula_message // load address of the beginning of the string to be printed to register X1
        mov X2, #EQUATION_FORMULA_MESSAGE_LEN // move string length to register X2
        svc 0     // Call linux to output the string


// Setup the parameters to exit the program
// and then call Linux to do it.

        mov     X0, #0      // Use 0 return code
        mov     X16, #1     // Service command code 1 terminates this program
        svc     0           // Call MacOS to terminate the program

equation_message:
        .ascii "Equation: "

.equ EQUATION_MESSAGE_LEN, . - equation_message

equation_formula_message:
        .ascii "ax^2 + bx + c = 0\n"

.equ EQUATION_FORMULA_MESSAGE_LEN, . - equation_formula_message

//a:
//        .dword 