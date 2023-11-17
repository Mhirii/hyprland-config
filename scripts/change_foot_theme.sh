#!/bin/bash

foot=~/tmp/foot.ini
colors=~/tmp/colors.ini

start_line=$(($(grep -n '# colors start here' "$foot" | cut -d':' -f1) + 1))
end_line=$(($(grep -n '# colors end here' "$foot" | cut -d':' -f1) - 1))

# Remove the existing section between markers in foot.ini
sed -i "${start_line},${end_line}d" "$foot"

start_line=$((start_line - 1))
# Insert the content of colors.ini at the adjusted line position
sed -i "${start_line}r $colors" "$foot"
