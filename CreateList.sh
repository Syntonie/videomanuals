#!/bin/bash

# argument $1 = output filename
# argument $2 = add an URL root

urlencode() {
    # urlencode <string>
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C
    
    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done
    
    LC_COLLATE=$old_lc_collate
}

index = 1
echo -e "## Archive\n" > $1
for f in *
do
	if [ -d "$f" ]; then
		echo "Listing $f ..." $index;
		# index=$((index + 1))
		# mv $f $1/$index.jpg
		echo -e "### $f\n" >> $1
		# echo "![$index]($1/$index.jpg)" >> $1.md
		# echo >> $1.md
		cd $f
		for ff in *
		do
			echo "Adding $ff..."
			prepend=$2
			append=""
			if [ -d "$f/$ff" ]; then append="/"; fi
			echo -e "[$ff]($prepend$( echo "$f/$ff" | sed 's/ /%20/g' )$append)\n" >> ../$1
		done
		cd ../
		echo -e "\n" >> $1
	fi
done