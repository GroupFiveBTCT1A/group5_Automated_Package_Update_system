#!/bin/bash

LOG_FILE=~/myproject/logs/update.log
DATE=$(date '+%Y-%m-%d %H:%M:%S')

mkdir -p /home/herbert-adjei/myproject/logs

echo "[$DATE] Starting system update...">>$LOG_FILE

if  sudo apt update -y >> $LOG_FILE 2>&1;then
	echo "[$DATE] apt update successful">> $LOG_FILE
 else
	echo "[$DATE] apt update FAILED" >> $LOG_FILE
       exit 1
fi

if  sudo apt upgrade -y >> $LOG_FILE 2>&1;then
	echo "[$DATE] apt upgrade Successful">>$LOG_FILE
else
	echo "[$DATE] apt upgrade FAILED">>$LOG_FILE
	exit 1
fi

echo "[$DATE] System update completed Successfully" >> $LOG_FILE
echo "System update failed " | mail -s "Update Failure Alert" adjeiherbertbombz@gmail.com
