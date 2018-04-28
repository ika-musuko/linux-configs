#!/bin/sh

return=''

float_divide() {
    return="$(echo "scale=1;$1/$2" | bc)"
}

i3status | while :
do
    # i3status
    read line
    
    # input method
    im="$(qdbus org.fcitx.Fcitx /inputmethod GetCurrentIM)"
    
    # memory usage
    free_kb="$(cat /proc/meminfo | grep MemFree | awk -F ' ' '{print $2}')"
    total_kb="$(cat /proc/meminfo | grep MemTotal | awk -F ' ' '{print $2}')"
    used_kb="$(expr $total_kb - $free_kb)"
    
    float_divide $used_kb 1000000
    used_gb=$return
    float_divide $total_kb 1000000
    total_gb=$return

    # final output
    echo "入力: $im | メモリー: $used_gb GiB/$total_gb GiB | $line"
done
