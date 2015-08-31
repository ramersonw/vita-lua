#!/bin/bash

f=$1
out=${f/%lua/c}
name=${f%.lua}
name=${name#lua/}

echo "// This file was generated by a terrible bash script." > $out
echo -n "const char *${name}_data = \"" >> $out
hexdump -ve '1/1 "_x%02X"' $f | sed 's/_/\\/g' >> $out
echo '";' >> $out
# echo "unsigned int ${name}_len = `wc -c $f | grep -o '^[0-9]*'`;" >> $out