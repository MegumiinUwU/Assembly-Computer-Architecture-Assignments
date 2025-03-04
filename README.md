# Assembly Computer Architecture Assignments

## Repository Overview
This repository contains simple assembly programs for basic computational problems and a number system converter project.

---

## 1. Number System Converter Project
### Description
The Number System Converter project is designed to convert numbers between different numbering systems, such as binary, octal, decimal, and hexadecimal. The program will allow users to input a number, specify its current numbering system, and convert it to a desired numbering system.

### Requirements
1. The program receives three inputs:
   - The number to be converted
   - The system it belongs to
   - The desired system to convert to
2. Implementation of the following assembly functions:
   - `OtherToDecimal`: Converts a number from a given system to decimal.
   - `DecimalToOther`: Converts a decimal number to another specified system.
3. The output is the converted number in the desired system.
4. The program must be capable of converting between any two systems (binary, octal, decimal, hexadecimal and others like Base 11 etc... ).
5. **Input validation** to ensure the number belongs to the specified system before conversion. If an invalid number is detected, display an error message and exit.




---

## 2: Find the Minimum Element in an Array
### Description
A program that finds the minimum element in an integer array of size 10 and prints the result.
### Test Cases
**Input:** `{10, 31, 5, 7, 11, 3, 8, 40, 12, 4}`  
**Output:** `Min element is: 3`

**Input:** `{11, 2, 3, 7, 5, 10, 9, 22, 6, 1}`  
**Output:** `Min element is: 1`

---

## 3: Count Even Numbers in an Array
### Description
A program that counts the number of even elements in an integer array of size 10 and prints the result.

### Test Cases
**Input:** `{10, 31, 5, 7, 11, 3, 8, 40, 12, 4}`  
**Output:** `Count of even numbers is: 5`

**Input:** `{19, 2, 3, 7, 5, 10, 9, 0, 6, 1}`  
**Output:** `Count of even numbers is: 4`

---

## 4: Calculate the Average of an Array
### Description
A program that calculates the average of elements in an integer array of size 10 and prints the result.

### Test Cases
**Input:** `{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}`  
**Output:** `Average is: 5.5`

**Input:** `{7, 2, 5, 11, 4, 6, 1, 1, 8, 3}`  
**Output:** `Average is: 4.8`
