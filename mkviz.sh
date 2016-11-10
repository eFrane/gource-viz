#!/usr/bin/env sh
repos='spec dev-website brand liboparl validator resources'

mkdir -p build
cd build
for repo in $repos
do
    if [ -d $repo ]
    then
        git -C $repo pull --rebase --autostash
    else
        git clone https://github.com/OParl/$repo.git $repo
    fi

    gource --output-custom-log $repo.log $repo/
done

cd ..

cat build/*.log | sort -n > combined.log
gource -c 4.0 -s 5 --hide-root -f combined.log
