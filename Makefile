all: respatcher.cpp
	# Kompiliere für Intel-Prozessoren (x86_64)
	g++ -arch x86_64 -s respatcher.cpp -o respatcher_intel
	# Kompiliere für Apple Silicon-Prozessoren (arm64)
	/usr/bin/clang++ -arch arm64 -Os respatcher.cpp -o respatcher_arm
	# Kombiniere die beiden ausführbaren Dateien zu einem Universal Binary
	lipo -create respatcher_intel respatcher_arm -output respatcher
	# Optional: Entferne die Zwischendateien
	rm respatcher_intel respatcher_arm
