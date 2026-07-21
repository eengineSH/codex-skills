#!/bin/sh
# Install canonical profiles without replacing local customizations.
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
source_dir="$script_dir/../assets/agents"
destination="${CODEX_HOME:-$HOME/.codex}/agents"
profiles='challenger.toml worker-light.toml worker-standard.toml reviewer.toml'

for profile in $profiles; do
  [ -f "$source_dir/$profile" ] && [ -r "$source_dir/$profile" ] || {
    echo "missing canonical profile: $profile" >&2
    exit 1
  }
done

[ ! -e "$destination" ] || [ -d "$destination" ] || {
  echo "agent destination is not a directory: $destination" >&2
  exit 1
}

for profile in $profiles; do
  target="$destination/$profile"
  [ ! -e "$target" ] || cmp -s "$source_dir/$profile" "$target" || {
    echo "refusing to replace differing profile: $target" >&2
    exit 1
  }
done

mkdir -p "$destination"
for profile in $profiles; do
  target="$destination/$profile"
  [ -e "$target" ] || cp "$source_dir/$profile" "$target"
done
