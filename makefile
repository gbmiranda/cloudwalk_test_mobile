# Flutter

flutter_setup:
	flutter clean; flutter pub get;

run_debug:
	flutter run;

run_release:
	flutter run --release;

# Test
	
app_coverage:
	@rm -rf coverage & sh scripts/create_lcov.sh true

# Build Generator

build_runner: 
	@flutter pub run build_runner build --delete-conflicting-outputs