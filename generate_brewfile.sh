#! /bin/bash

echo '# FORMULAE' > Brewfile

brew leaves | sed "s/^/brew '/;s/$/'/" >> Brewfile

echo >> Brewfile
echo '# CASKS' >> Brewfile

brew deps --installed --cask | \
    awk -F'[: ]+' \
    '{
        packages[$1]++
        for (i = 2; i <= NF; i++)
            dependencies[$i]++
    }
    END {
        for (package in packages)
            if (!(package in dependencies))
                print package
    }' | sed "s/^/cask '/;s/$/'/" >> Brewfile
