# List all changes files, ignore deletions, find only ruby files
# Then run rubocop for them all
alias rubocopc='git diff --cached --name-only | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop -a'
