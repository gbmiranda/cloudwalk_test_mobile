#!/bin/bash
set -e
PATH_COVERAGE=$1
MIN_COVERAGE_PERC=95

percentageRate=$(lcov --summary "$PATH_COVERAGE" | grep "lines......" | cut -d ' ' -f 4 | cut -d '%' -f 1)

RED='\033[0;31m'
GREEN='\033[0;32m'

if [ "$(echo "${percentageRate} < $MIN_COVERAGE_PERC" | bc)" -eq 1 ]; then
    printf "${RED}Error: Test coverage rate is too low, expected ${MIN_COVERAGE_PERC}% but have ${percentageRate}%.\n"
    printf "${RED}Please add more tests to cover the code.\n"
    printf "${RED}To see in local the current coverage rate use:\n"
    printf "${RED}    make coverage\n"
    exit 1
else
    printf "${GREEN}Coverage rate is fine 👍. Build continue...\n"
fi