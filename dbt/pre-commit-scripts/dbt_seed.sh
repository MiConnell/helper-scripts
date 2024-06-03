#!/bin/bash
dbt seed --target dev -s `git diff --name-only --cached | sed "s/$/+/g" | egrep '\.csv$' | sed 's/dbt\///' | tee >([ $(wc -m) -gt 0 ] || echo 'Nothing_to_do')`
