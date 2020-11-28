# Set colours to human named-variables
# Regular
fg_black="$(tput setaf 0 2>/dev/null || echo '\e[0;30m')"
fg_red="$(tput setaf 1 2>/dev/null || echo '\e[0;31m')"
fg_green="$(tput setaf 2 2>/dev/null || echo '\e[0;32m')" 
fg_yellow="$(tput setaf 3 2>/dev/null || echo '\e[0;33m')" 
fg_blue="$(tput setaf 4 2>/dev/null || echo '\e[0;34m')" 
fg_magenta="$(tput setaf 5 2>/dev/null || echo '\e[0;35m')" 
fg_cyan="$(tput setaf 6 2>/dev/null || echo '\e[0;36m')" 
fg_white="$(tput setaf 7 2>/dev/null || echo '\e[0;37m')" 

# Bold
fg_b_black="$(tput setaf 0 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;30m')" 
fg_b_red="$(tput setaf 1 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;31m')" 
fg_b_green="$(tput setaf 2 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;32m')" 
fg_b_yellow="$(tput setaf 3 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;33m')" 
fg_b_blue="$(tput setaf 4 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;34m')" 
fg_b_magenta="$(tput setaf 5 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;35m')" 
fg_b_cyan="$(tput setaf 6 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;36m')" 
fg_b_white="$(tput setaf 7 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;37m')" 

# Underline
fg_u_black="$(tput setaf 0 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;30m')" 
fg_u_red="$(tput setaf 1 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;31m')" 
fg_u_green="$(tput setaf 2 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;32m')" 
fg_u_yellow="$(tput setaf 3 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;33m')" 
fg_u_blue="$(tput setaf 4 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;34m')" 
fg_u_magenta="$(tput setaf 5 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;35m')" 
fg_u_cyan="$(tput setaf 6 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;36m')" 
fg_u_white="$(tput setaf 7 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;37m')" 

# Background
bg_black="$(tput setab 0 2>/dev/null || echo '\e[40m')" 
bg_red="$(tput setab 1 2>/dev/null || echo '\e[41m')" 
bg_green="$(tput setab 2 2>/dev/null || echo '\e[42m')" 
bg_yellow="$(tput setab 3 2>/dev/null || echo '\e[43m')" 
bg_blue="$(tput setab 4 2>/dev/null || echo '\e[44m')" 
bg_magenta="$(tput setab 5 2>/dev/null || echo '\e[45m')" 
bg_cyan="$(tput setab 6 2>/dev/null || echo '\e[46m')" 
bg_white="$(tput setab 7 2>/dev/null || echo '\e[47m')" 

# Reset
reset_color="$(tput sgr 0 2>/dev/null || echo '\e[0m')" 
