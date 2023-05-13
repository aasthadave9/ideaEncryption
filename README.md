# ideaEncryption
This repository contains a VHDL based Hardware implementation of the International Data Encryption Algorithm (IDEA) on the Spartan 3E FPGA

## Implementations & Module Requirements
1. Direct Implementation

Module | Spec
------------ | -------------
XOR | 48 XOR modules with 16-bit wide word input & output
Adder | 34 modules of 16-bit addition modulo 2^16  
Multiplier | 34 modules of 16-bit multiplication modulo (2^16 + 1) using Low-High Algorithm
Round Module | 8 rounds of Encryption and Decryption using XOR, adder and multiplier
Output Tranformation Module | Transforming round module output for encryption
Encryption Module | Implementation of encryption process for a fixed key


