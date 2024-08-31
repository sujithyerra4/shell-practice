#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3: -14}
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)


USAGE(){

echo -e  "$R USAGE $N: $0 <source> <destination> <days(optional)>"

}

if [ $# -lt 2 ]
then
USAGE
exit 1
fi

if [ ! -d $SOURCE_DIR ]
 then
   echo  $SOURCE_DIR doesnt exists
 fi

if [ ! -d $DESTINATION_DIR ]
then
 echo $DESTINATION_DIR doesnt exists
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime $DAYS)
echo Files:$FILES

if [ !-z FILES ]
    then
    echo files are found
    ZIP_FILE=$DESTINATION_DIR/app-logs-$TIME_STAMP.zip
    $FILES| zip $ZIP_FILE -@

        if [ -f $ZIP_FILE ]
        then 

        echo succesfully zipped files older than $DAYS
        while IFS= read -r file
        do
        echo "Deleting file:$file"
        rm -rf $FILES
        done <<< $FILES

    else
        echo -e "Failed  zipping files older than $DAYS"
        exit 1
        fi
else
  echo files are not found
fi
