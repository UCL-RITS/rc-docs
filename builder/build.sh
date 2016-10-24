#!/usr/bin/env bash

set -o errexit \
    -o nounset \
    -o pipefail

template_repo="https://github.com/UCL-RITS/indigo-jekyll.git"
template_dir="indigo"

unpack_dir="$(mktemp -d)"
build_dir="$(mktemp -d)"
echo "Downloading and unpacking deps in: $unpack_dir" >&2
echo "Building in: $build_dir" >&2

owd="$(pwd)"
mkdir -p "$build_dir/jekyll"
cp -r ./* "$build_dir/jekyll/"
cd "$unpack_dir"

echo "Cloning jekyll template..." >&2
git clone "$template_repo" template

echo "Merging into build dir...">&2
rsync -r "template/$template_dir/"* "$build_dir/jekyll/"

echo "Using bundler to obtain local Jekyll install..." >&2
cd "$build_dir/jekyll"
bundle install --gemfile="$owd/builder/Gemfile" --path="$build_dir"

echo "Building site..." >&2
BUNDLE_GEMFILE="$owd/builder/Gemfile" bundle exec jekyll build --destination "$owd/out"

rm -Rf -- "$unpack_dir" "$build_dir"

echo "Finished." >&2
