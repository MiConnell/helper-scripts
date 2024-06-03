#!/bin/bash
git diff --name-only --cached --diff-filter=AMRT HEAD..main | egrep '\.sql' | { while read -r file; do sqlfluff fix --config ./.sqlfluff --dialect redshift --templater jinja --ignore templating "$file"; done; }
