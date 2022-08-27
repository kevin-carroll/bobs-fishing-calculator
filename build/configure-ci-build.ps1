
# Copy the strict linting file in place of the regular one
# this will enforce build errors on any applicable warnings during development

Remove-Item "./src/styles.ruleset"
Copy-Item "./build/strict-linting.ruleset"  -Destination "./src/styles.ruleset"