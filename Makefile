SHELL=bash

%:
	(cd Rstudio; make "$@")

r_versions:
	@printf '      - ["default", ""]\n'
	@module purge; \
	module load CBI; \
	r_versions=($$(ls -1 "$$MODULE_ROOT_CBI"/r/ | grep -E "^([[:digit:]]+|[.])+[.]lua$$" | sed 's/.lua//' | sort -u | sort -h -r)); \
	printf '      - "%s"\n' "$${r_versions[@]}"



