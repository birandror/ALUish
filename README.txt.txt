THE 16-BIT ALU(-ish)
Biran Dror

This is a component with many of the functions of a 16-bit ALU, as well as a small memory component. The entire project is constructed hierarchically from a NAND gate. The main component is called choose_fxn_mem and it is in the file "choose_fxn.v". Please excuse the uninspiring variable names.

The functions which this ALU can perform are:
    0. bitwise AND
    1. bitwise OR
    2. bitwise XOR
    3. negation (one's complement of in_0)
    4. integer comparison (i.e. is in_0 < in_1?)
    5. addition (with carry)
    6. 16-to-4 encoder (on in_0)
    7. 4-to-16 decoder (on in_0[3:0])

It is also possible to choose whether the current computation is sent to storage or not. The output is the value in storage.
If the function has a multi-bit output, then it will appear in the variable "out". If the function has a single bit output, then it will appear in the variable "carry". The only function that has both is addition.

I briefly toyed with having multiplication as an available function, but chose to leave it out.

In order for the latches and flipflops to work as desired, a small delay had to be built in. Since everything is built from a single NAND design, this is the gate where the delay was implemented. This is an important consideration when designing testbenches, since many delays are stacked atop of one another in some of the more complicated components. In any case, each computation here has a delay equivalent to less than 100 NAND gates.

This project is licensed under the GNU General Public License, Version 3 (see license document).