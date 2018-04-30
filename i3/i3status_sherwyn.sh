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
    current_line=$(($unix_time%$db_lines+1))

    dropbox="$(echo "$dropbox_status" | sed -n ${current_line}p)"

    # input method
    im="$(~/.config/i3/get_input_method.sh)"

    # memory usage
    free_kb="$(cat /proc/meminfo | grep MemFree | awk -F ' ' '{print $2}')"
    total_kb="$(cat /proc/meminfo | grep MemTotal | awk -F ' ' '{print $2}')"
    used_kb="$(expr $total_kb - $free_kb)"
    
    float_divide $used_kb 1000000
    used_gb=$return
    float_divide $total_kb 1000000
    total_gb=$return

    # final output
    echo "箱: $dropbox | 入力: $im | メモリー: $used_gb GiB/$total_gb GiB | $line"
done
