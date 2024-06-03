#!/bin/bash
dbt run --target dev --full-refresh -s `git diff --name-only --cached | sed "s/$/+/g" | egrep '(\.sql\+$|\.py\+$)' | sed 's/dbt\///' | tee >([ $(wc -m) -gt 0 ] || echo 'Nothing_to_do')`
