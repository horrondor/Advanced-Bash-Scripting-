#!/bin/bash

# Colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
BOLD="\e[1m"
RESET="\e[0m"

# Banner
echo -e "${CYAN}${BOLD}🚀 OverTheWire : Bandit : Wargame${RESET}"
echo -e "${YELLOW}------------------------------------${RESET}"

# Take filename from user
read -p "Enter filename: " filename

# Take number limits from user
read -p "Enter how many bandits: " n

# Create/clear file
> "$filename"

# Write header to file (NO colors in file)
cat << EOF >> "$filename"
OverTheWire : Bandit : wargame
EOF

echo "" >> "$filename"

# Generate content
for ((i=0; i<=n; i++))
do
  echo "bandit$i =>" >> "$filename"
  echo -e "${GREEN}✔ bandit$i added${RESET}"
done

echo ""
echo -e "${GREEN}🎉 File '$filename' created successfully with bandit0 to bandit$n${RESET}"
echo -e "${CYAN}📁 OverTheWire : Bandit : wargame${RESET}"