# Flutter

flutter_cache_repair:
	flutter pub cache repair

flutter_pub_upgrade:
	flutter pub upgrade

flutter_packages_update:
	flutter update-packages --force-upgrade

dart_fix:
	dart fix --apply

dart_packages_clean:
	dart pub cache clean

# Helpers
	
app_coverage:
	@rm -rf coverage & sh scripts/create_lcov.sh true

# Build Generator

build_runner: 
	@flutter pub run build_runner build --delete-conflicting-outputs

build_watch: 
	@flutter pub run build_runner watch --delete-conflicting-outputs

build_localizations:
	@rm -rf .dart_tool/build/generated;make build_runner