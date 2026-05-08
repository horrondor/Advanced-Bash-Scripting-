#!/bin/bash
# escaped.sh: escaped characters

#############################################################
### First, let's show some basic escaped-character usage. ###
#############################################################

# Escaping a newline.
# ------------------

echo ""
echo "This will print
as two lines."
# This will print
# as two lines.
echo "This will print \
as one line."
# This will print as one line.
echo; 
echo "================="

echo "\v\v\v\v"   #print \v\v\v\v literally.
# Use the -e option with echo to print escaped characters.
echo "=================="
echo "VERTICAL TABS"
echo -e "\v\v\v\v"  # Prints 4 vertical tabs.
echo "==================="

echo "QUOTATION MARK"
echo -e "\042"       # Prints " (quote, octal ASCII character 42)
echo "====================="

# The $'\X' construct makes the -e option unnecessary.

echo; echo "NEWLINE and (maybe) BEEP"
echo $'\n'   # Newline.
echo $'\a'   # Alert (beep).
             # May only flash, not beep, depending on terminal


             # We have seen $'\nnn' string expansion, and now . . .


# =================================================================== #
# Version 2 of Bash introduced the $'\nnn' string expansion construct.
# =================================================================== #

echo "Introducing the \$\' ... \' string-expansion construct . . . "
echo ". . . featuring more quotation marks."

