# Compile and run one testbench with Icarus Verilog.
# Usage:  .\sim.ps1 mux4x1        (runs mux/mux4x1_tb.v)
#         .\sim.ps1 -All          (runs every testbench)
param([string]$Name, [switch]$All)
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$dirs = 'gates', 'arithmetic', 'mux', 'decoder', 'alu'
$inc  = $dirs | ForEach-Object { '-I'; Join-Path $root $_ }
$build = Join-Path $root 'build'
New-Item -ItemType Directory -Force $build | Out-Null

if ($All) { $tbs = Get-ChildItem $root -Recurse -Filter '*_tb.v' | Where-Object { $_.FullName -notlike "$build*" } }
elseif ($Name) {
    $tbs = Get-ChildItem $root -Recurse -Filter "$($Name)_tb.v"
    if (-not $tbs) { $tbs = Get-ChildItem $root -Recurse -Filter "$($Name)s_tb.v" }
    if (-not $tbs) { throw "No testbench named $($Name)_tb.v" }
}
else { throw 'Give a testbench name (e.g. .\sim.ps1 alu4) or -All' }

foreach ($tb in $tbs) {
    $out = Join-Path $build ($tb.BaseName + '.vvp')
    Write-Host "== $($tb.BaseName)" -ForegroundColor Cyan
    & iverilog @inc -o $out $tb.FullName
    if ($LASTEXITCODE -ne 0) { throw "Compile failed: $($tb.Name)" }
    Push-Location $build
    try { & vvp -n $out } finally { Pop-Location }   # .vcd waveforms land in build/
}
