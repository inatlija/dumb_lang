text = input("enter text to convert to dumblang -> ")

for c in text:
    plus_line = "+" * ord(c)
    minus_line = "-" * ord(c)
    print(plus_line + ".")
    print(minus_line)
