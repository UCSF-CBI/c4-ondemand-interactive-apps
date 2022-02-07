check: shellcheck

shellcheck:
	shellcheck template/bin/auth
	shellcheck --shell=bash --exclude=SC2034,SC2154 template/*.sh.erb

