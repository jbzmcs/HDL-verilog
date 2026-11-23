#!/usr/bin/env sh
# Compile and run one testbench with Icarus Verilog.
# Usage:  ./sim.sh mux4x1     (runs mux/mux4x1_tb.v)
#         ./sim.sh --all      (runs every testbench)
set -e
root=$(cd "$(dirname "$0")" && pwd)
inc="-I $root/gates -I $root/arithmetic -I $root/mux -I $root/decoder -I $root/alu"
mkdir -p "$root/build"
if [ "$1" = "--all" ]; then tbs=$(find "$root" -name '*_tb.v' -not -path "$root/build/*" | sort)
elif [ -n "$1" ]; then tbs=$(find "$root" -name "$1_tb.v" -o -name "$1s_tb.v" | head -1)
else echo "usage: $0 <name> | --all" >&2; exit 1; fi
[ -n "$tbs" ] || { echo "No testbench named $1_tb.v" >&2; exit 1; }
for tb in $tbs; do
  name=$(basename "$tb" .v)
  echo "== $name"
  iverilog $inc -o "$root/build/$name.vvp" "$tb"
  (cd "$root/build" && vvp -n "$name.vvp")   # .vcd waveforms land in build/
done
