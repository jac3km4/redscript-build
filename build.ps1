
# sample scripts for compiler instrumentation
$samples = @(
	'djkovrik-mods/src/Limited HUD/r6/scripts',
	'djkovrik-mods/src/Always First Equip/r6/scripts',
	'djkovrik-mods/src/Muted Markers/r6/scripts'
)

# script cache file used for compilation
if (!(Test-Path .\data\cache\final.redscripts)) {
	mkdir -p .\data\cache
	Invoke-WebRequest 'https://oshi.at/LUYQ/final.redscripts.bk' -OutFile './data/cache/final.redscripts'
}

Push-Location redscript

cargo pgo build -- --features mmap,popup
foreach ($sample in $samples) {
	cargo pgo run -- -p scc -- -compile "../samples/$sample" -customCacheDir '../data/cache'
}
cargo pgo optimize build -- -p scc-lib --features mmap,popup

Pop-Location
