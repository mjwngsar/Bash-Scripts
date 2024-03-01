patt="(https?:)\/\/(?:www\.)?[-a-zA-Z0-9@:%.\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%\+.~#?&\/=]*)\.(mp4|m4a|mkv|webm)"

if [[ -d tmp ]]; then
    rm -r tmp
fi
mkdir tmp

read -p "Enter link: " link
echo "Downloading '$link'"
wget $link -O tmp/out -q

grep -o -P $patt tmp/out > tmp/urls
mkdir videos
while read url
do
    echo "Downloading '$url' to 'videos'"
    wget $url -P videos -q
done < ./tmp/urls

rm -r tmp
