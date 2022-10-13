.ONESHELL:

SHELL=bash
TMPDIR:=$(shell mktemp -d)

## Colored strings?
ifdef TERM
	TPUT:=true
	OK  :=$(shell tput setaf 2; printf "%s" " OK "; tput sgr0)
	FAIL:=$(shell tput setaf 1; printf "%s" "FAIL"; tput sgr0)
	YAMLLINT_OPTS:=-f colored
else
	TPUT:=false
	OK  :=$(shell printf "%s" " OK ")
	FAIL:=$(shell printf "%s" "FAIL")
	YAMLLINT_OPTS:=
endif

all: shellcheck yamllint
	true

version:
	@echo "*** ShellCheck:"
	@shellcheck --version
	@echo

	@echo "*** yamllint:"
	@yamllint --version
	@echo

r_versions:
	@printf '      - ["default", ""]\n'
	@module purge; \
	module load CBI; \
	r_versions=($$(ls -1 "$$MODULE_ROOT_CBI"/r/ | grep -E "^([[:digit:]]+|[.])+[.]lua$$" | sed 's/.lua//' | sort -u | sort -h -r)); \
	printf '      - "%s"\n' "$${r_versions[@]}"

shellcheck:
	@stdout=$(TMPDIR)/stdout

	ok_count=0
	error_count=0

	echo "*** ShellCheck:"
	files=$$(find . -type f -name "*.sh" -o  -name "*.sh.erb")
	for file in $$files; do
	   $(TPUT) && printf "[    ] checking %s" "$$file"
	   if shellcheck --color=always --external-sources --exclude=SC2034,SC2148,SC2154 "$$file" >> "$$stdout" ; then
	     ok_count=$$((ok_count+1))
	     $(TPUT) && printf "\r"
	     printf "[$(OK)] checking %s\\n" "$$file"
	   else
	     error_count=$$((error_count+1))
	     $(TPUT) && printf "\r"
	     printf "[$(FAIL)] checking %s\\n" "$$file"
	   fi
	done

	echo "RESULT: $$ok_count OK, $$error_count ERROR"
	if (( error_count > 0 )); then
	  cat "$$stdout"
	  exit 1
	fi


yamllint:
	@stdout=$(TMPDIR)/stdout

	ok_count=0
	error_count=0
	config=.yamllint.yml

	echo "*** yamllint:"
	if [[ ! -f "$$config" ]]; then
	   echo "File not found: $$config (PWD=$$PWD)"
	   ls -la
	   exit 1
	fi
	files=$$(find . -type f -name "*.yml")
	for file in $$files; do
	   $(TPUT) && printf "[    ] checking %s" "$$file"
	   if yamllint $(YAMLLINT_OPTS) -c "$$config" "$$file" >> "$$stdout" ; then
	     ok_count=$$((ok_count+1))
	     $(TPUT) && printf '\r'
	     printf '[$(OK)] checking %s\n' "$$file"
	   else
	     error_count=$$((error_count+1))
	     $(TPUT) && printf '\r'
	     printf '[$(FAIL)] checking %s\n' "$$file"
	     if (( error_count > 10 )); then
	       echo "Too many errors. Terminating early."
	       cat "$$stdout"
	       exit 1
	     fi
	   fi
	done

	echo "RESULT: $$ok_count OK, $$error_count ERROR"
	if (( error_count > 0 )); then
	  cat "$$stdout"
	  exit 1
	fi
