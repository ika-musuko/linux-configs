#!/bin/sh

return=''

float_divide() {
    return="$(echo "scale=1;$1/$2" | bc)"
}

i3status | while :
do
    # i3status
    read line
   
    # dropbox status
    dropbox_status="$(dropbox status)"
    db_lines=$(echo "$dropbox_status" | wc -l)
    unix_time="$(date +'%s')"
    current_line=$(($unix_time/2%$db_lines+1))

    dropbox="$(echo "$dropbox_status" | sed -n ${current_line}p)"

    # input method
    im="$(~/.config/i3/get_input_method.sh)"

    # memory usage (linux memory works differently than windows so this actually isn't very useful)
    #free_kb="$(cat /proc/meminfo | grep MemFree | awk -F ' ' '{print $2}')"
    #total_kb="$(cat /proc/meminfo | grep MemTotal | awk -F ' ' '{print $2}')"
    #used_kb="$(expr $total_kb - $free_kb)"
    
    #float_divide $used_kb 1000000
    #used_gb=$return
    #float_divide $total_kb 1000000
    #total_gb=$return

    # weather
    #weather=$(ansiweather -l Hayward,US -s true -a false -w false -h false -p false -d true | awk -F '=> ' ' { print $NF } ')
    weather=$(ansiweather -l Hayward,US -s true -a false -w false -h false -p false -d true)

    # final output
    #echo "箱: $dropbox | 入力: $im | メモリー: $used_gb GiB/$total_gb GiB | $line"
    #echo "箱: $dropbox | 天気 $weather | 入力: $im | $line"
    echo "天気 $weather | 入力: $im | $line"
done
