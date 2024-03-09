if [ $# -lt 1 ]; then
    echo "Error: Insufficient arguments. Usage: twitch.sh [channel_name] [options]"
    exit 1
fi

pipOption="--pip"
if [ $2 == "-nopip" ]; then
    pipOption=""
fi

if [ $1 == "-h" ]; then
    echo "Usage: twitch.sh [channel_name] [options]"
    echo "  options:"
    echo "    -h        print this message"
    echo "    -nopip    don't use PIP mode"
    exit 1
fi

streamlink --stdout https://www.twitch.tv/$1 best --twitch-low-latency --twitch-disable-ads | iina --stdin $pipOption