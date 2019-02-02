#! /bin/bash

#Variables
dir="mock_data"
isDirectoryEmpty=false
amountOfFiles=10


# function to populate the new directory
generateFiles() {
#    for i in {1..19}
    for i in $( seq 1 $amountOfFiles ) 
    do  
        echo "This is file: $i" > $dir/File$i.txt
    done
}


#Check if directory exists
if test -d $dir 
then
    echo "Directory already exist"
    # Check if any files exist in this directory
    [ "$(ls -A $dir)" ] && isDirectoryEmpty=false || isDirectoryEmpty=true
    echo "Is the directory \"$dir\" empty: $isDirectoryEmpty"

    # Populate Data if directory is empty
    if $isDirectoryEmpty
    then
        echo "Directory is empty"
        echo "Populating \"$dir\" with mock files"
        generateFiles
    else
        echo "Files found in directory"
        echo "No action is needed"
    fi  
else
    echo "Directory doesn't exist"
    echo "Creating new directory: $dir"
    mkdir $dir 
    generateFiles
fi
