# DumbLang - BrainFuck Clone

A tiny Zig interpreter that reads a file and understands to `+`, `-`, or `.`.

## How It Works
It has one number (`cell`) that starts at 0.  
The program looks at each character in the file:  

- `+` → add 1 (wraps after 255)  
- `-` → subtract 1 (wraps below 0)  
- `.` → print the number as a character  

It **does not** reset the number after output — so if you want to start fresh, you have to manually subtract back to 0 using `-`.

## Example
File:
```
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.
-----------------------------------------------------------------
```
Output:
```
A
```
(The second line of `-` clears the cell back to 0.)

## Helper File
There’s also a helper python script (`helper.py`) that turns normal human 100 IQ text into dumblang code for you:

```python
text = input("enter text to convert to dumblang -> ")

for c in text:
    plus_line = "+" * ord(c)
    minus_line = "-" * ord(c)
    print(plus_line + ".")
    print(minus_line)
```

**How it works:**  
- For each character in your text:
  - Use`+` repeated by that character’s ASCII value, then prints it.
  - Use a `.` to prints the character.
  - Use `-` to the same length of `+` to clear the cell back to 0.


## ANSI Character Reference to 0–255
https://www.gaijin.at/en/infos/ascii-ansi-character-table

## Running It
1. Make dumblang code:
```sh
python3 helper.py
```
2. Run the Zig interpreter:
```sh
zig run main.zig -- program.txt
```

## Why?
Because like I got bored