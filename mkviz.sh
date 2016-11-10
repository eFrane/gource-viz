#!/usr/bin/env sh
set -o

repos='spec dev-website brand liboparl validator resources'

mkdir -p build
cd build
for $repo in $repos
do
    echo $repo
    #if [ -d $repo ]
    #then
    #    git -C $repo pull --rebase --autostash
    #else
    #    git clone https://github.com/OParl/$repo.git $repo
    #fi

    #gource --output-custom-log $repo.log $repo/
done

cat *.log | sort -n > ../combined.log

