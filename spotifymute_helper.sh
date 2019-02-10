#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
MUTED='no'

spotify_playing() {
    PLAYING=$(tasklist /fi "imagename eq Spotify.exe" /fo csv /v  | sed -n '2,2p' | cut -d , -f 9)
    PLAYING=$(echo -e $PLAYING | tr -d '\"\n\r' )
}

main() {
    #set -x
    while true; do
        spotify_playing
        #PLAYING="Unspotify"
        echo -e "=> Playing $PLAYING"
        detect_ad
        sleep 2
    done
}

detect_ad() {

    grep "$PLAYING" $DIR/blacklist.txt
    GREP_RETCODE=$?
    #echo -e "grep return code: $GREP_RETCODE"
    if [[ $GREP_RETCODE == 0 ]] ; then
    	echo "An ad is playing!"
    	mute_div yes
    else
        mute_div no
    fi

}

mute_div(){
    echo Muting... "$@"
    if [[ "$@" == yes ]] &&  [[ $MUTED == no ]]
    then
        nircmd muteappvolume spotify.exe 1
        MUTED='yes'
        echo "MUTED!"
    elif [[ "$@" == no ]] && [[ $MUTED == yes ]]
    then
        nircmd muteappvolume spotify.exe 0
        MUTED='no'
        echo "UNMUTED!"
    fi
}


if [[ ${BASH_SOURCE[0]} = $0 ]]; then
    main
fi
