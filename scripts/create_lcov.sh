#!/bin/bash
set -e
rm -v -f libisar.so
flutter pub get
sh scripts/import_files_coverage.sh cloudwalk_test_mobile_1
flutter test --coverage
lcov --ignore-errors unused --remove coverage/lcov.info \
'lib/main.dart' \
'lib/*/widgets/*' \
'lib/*/screens/*' \
'lib/*/*_injection.dart' \
'lib/*/*_event.dart' \
'lib/*/*_state.dart' \
'lib/*/*_screen.dart' \
'lib/*/*.g.dart' \
'lib/*/*.gr.dart' \
-o coverage/lcov.info
if [ -n "$1" ]
then
    if [ "$1" = true ]
    then
        genhtml coverage/lcov.info -o coverage/html
        open coverage/html/index.html
    fi
fi