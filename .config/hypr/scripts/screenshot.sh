#!/usr/bin/env bash

set -o pipefail

# Directory
_SCREENSHOT_DIR_=$HOME/Pictures/Screenshots
_LOG_FILE_="$_SCREENSHOT_DIR_/.screensht.log"

function check() {
    if [[ $? -eq 1 && ${PIPESTATUS[0]} -eq 1 ]]; then
        _end_job_=$(date +%s)
        summary $_start_job_ $_end_job_ 'failed' && notify-send -u critical -t 3000 -a "Screenshot Tool" "Screensht" >> $_LOG_FILE_ 2>&1
        exit 1
    fi
}

function check_dir() {
	if [[ ! -d "$_SCREENSHOT_DIR_" ]]; then
		mkdir -p "$_SCREENSHOT_DIR_"
	fi
}

function summary() {
    _runtime_job_=$(($2-$1))
    hours=$((_runtime_job_ / 3600)); minutes=$(( (_runtime_job_ % 3600) / 60 )); seconds=$(( (_runtime_job_ % 3600) % 60 ))

    if [[ $3 != "failed" ]]; then
        wl-copy < "$_target_file_" >> $_LOG_FILE_ 2>&1

        message="${_notif_message_} Runtime: $hours hours, $minutes minutes, $seconds seconds"
        notify-send -i "$_target_file_" -t 10000 "Screenshot Tool" "$message" -a "Screenshot Tool"
    fi
}

function main() {
    check_dir

    rm -f $_LOG_FILE_
    _start_job_=$(date +%s)

	_screenshot_command_="$1"
	_notif_message_="$2"

    $_screenshot_command_ $_SCREENSHOT_DIR_\/$_start_job_.png> /dev/null 2>&1
    check

    _end_job_=$(date +%s)
    summary $_start_job_ $_end_job_
}

# Check the args passed
if [ -z "$1" ] || ([ "$1" != 'full' ] && [ "$1" != 'area' ]);
then
	echo "
	Requires an argument:
	area 	- Area screenshot
	full 	- Fullscreen screenshot
	Example:
	./screensht area
	./screensht full
	"
elif [ "$1" = 'full' ];
then
	msg="Full screenshot saved and copied to clipboard!"
	main 'grimblast copysave output' "${msg}"
elif [ "$1" = 'area' ];
then
	msg='Area screenshot saved and copied to clipboard!'
	main 'grimblast copysave area' "${msg}"
fi
