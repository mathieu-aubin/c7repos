#!/bin/bash
# This is nanorc files, a shell archive (produced by GNU sharutils 4.15.2)
# exclusively for c7repos available at https://c7repos.4ce.ca
# Made on 2018-03-28 by Mathieu Aubin <mathieu@zeroserieux.com>
# .--------.----------.-------------------------------------.
# | LENGTH |   MODE   |             FILE NAME               |
# '--------'----------'-------------------------------------'
#     884   -rw-r--r--   /usr/share/nano/asm.nanorc
#     557   -rw-r--r--   /usr/share/nano/autoconf.nanorc
#    1358   -rw-r--r--   /usr/share/nano/awk.nanorc
#     711   -rw-r--r--   /usr/share/nano/changelog.nanorc
#     837   -rw-r--r--   /usr/share/nano/cmake.nanorc
#    1687   -rw-r--r--   /usr/share/nano/c.nanorc
#     346   -rw-r--r--   /usr/share/nano/css.nanorc
#     790   -rw-r--r--   /usr/share/nano/debian.nanorc
#     408   -rw-r--r--   /usr/share/nano/default.nanorc
#    1083   -rw-r--r--   /usr/share/nano/elisp.nanorc
#    1969   -rw-r--r--   /usr/share/nano/fortran.nanorc
#    4273   -rw-r--r--   /usr/share/nano/gentoo.nanorc
#    1420   -rw-r--r--   /usr/share/nano/go.nanorc
#     713   -rw-r--r--   /usr/share/nano/groff.nanorc
#     604   -rw-r--r--   /usr/share/nano/guile.nanorc
#    1226   -rw-r--r--   /usr/share/nano/html.nanorc
#     655   -rw-r--r--   /usr/share/nano/java.nanorc
#     668   -rw-r--r--   /usr/share/nano/javascript.nanorc
#     881   -rw-r--r--   /usr/share/nano/json.nanorc
#    2326   -rw-r--r--   /usr/share/nano/lua.nanorc
#     314   -rw-r--r--   /usr/share/nano/makefile.nanorc
#     463   -rw-r--r--   /usr/share/nano/man.nanorc
#     231   -rw-r--r--   /usr/share/nano/mgp.nanorc
#     187   -rw-r--r--   /usr/share/nano/mutt.nanorc
#     387   -rw-r--r--   /usr/share/nano/nanohelp.nanorc
#    2531   -rw-r--r--   /usr/share/nano/nanorc.nanorc
#     794   -rw-r--r--   /usr/share/nano/nftables.nanorc
#    1777   -rw-r--r--   /usr/share/nano/objc.nanorc
#     847   -rw-r--r--   /usr/share/nano/ocaml.nanorc
#     597   -rw-r--r--   /usr/share/nano/patch.nanorc
#    1473   -rw-r--r--   /usr/share/nano/perl.nanorc
#    1053   -rw-r--r--   /usr/share/nano/php.nanorc
#     891   -rw-r--r--   /usr/share/nano/po.nanorc
#    3104   -rw-r--r--   /usr/share/nano/postgresql.nanorc
#     683   -rw-r--r--   /usr/share/nano/pov.nanorc
#     793   -rw-r--r--   /usr/share/nano/python.nanorc
#    1499   -rw-r--r--   /usr/share/nano/ruby.nanorc
#    1110   -rw-r--r--   /usr/share/nano/rust.nanorc
#    1189   -rw-r--r--   /usr/share/nano/sh.nanorc
#    1927   -rw-r--r--   /usr/share/nano/spec.nanorc
#    2158   -rw-r--r--   /usr/share/nano/tcl.nanorc
#     466   -rw-r--r--   /usr/share/nano/texinfo.nanorc
#     176   -rw-r--r--   /usr/share/nano/tex.nanorc
#     534   -rw-r--r--   /usr/share/nano/xml.nanorc
#
lock_dir='/tmp/_c7repos.tmp';rm -fr ${lock_dir};mkdir -p ${lock_dir};mkdir -p '/usr/share/nano';
# ============= /usr/share/nano/asm.nanorc ==============
if test -f '/usr/share/nano/asm.nanorc'
then
echo " - Skipping /usr/share/nano/asm.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/asm.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/asm.nanorc' &&
_C7REPOS__## Here is an example for assembler.
_C7REPOS__syntax "asm" "\.(S|s|asm)$"
_C7REPOS__magic "[Aa]ssembl(y|er)"
_C7REPOS__comment "//"
_C7REPOS__color red "\<[A-Z_]{2,}\>"
_C7REPOS__color brightgreen "\.(data|subsection|text)"
_C7REPOS__color green "\.(align|file|globl|global|hidden|section|size|type|weak)"
_C7REPOS__color brightyellow "\.(ascii|asciz|byte|double|float|hword|int|long|short|single|struct|word)"
_C7REPOS__icolor brightred "^[[:space:]]*[.0-9A-Z_]*:"
_C7REPOS__color brightcyan "^[[:space:]]*#[[:space:]]*(define|undef|include|ifn?def|endif|elif|else|if|warning|error)"
_C7REPOS__# Strings.
_C7REPOS__color brightyellow "<[^= 	]*>" ""(\\.|[^"])*""
_C7REPOS__# Multiline strings.  This regex is VERY resource intensive,
_C7REPOS__# and sometimes colours things that shouldn't be coloured.
_C7REPOS__###color brightyellow start=""(\\.|[^"])*\\[[:space:]]*$" end="^(\\.|[^"])*""
_C7REPOS__# Comments.
_C7REPOS__color brightblue "//.*"
_C7REPOS__color brightblue start="/\*" end="\*/"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/asm.nanorc failed";
fi
# ============= /usr/share/nano/autoconf.nanorc ==============
if test -f '/usr/share/nano/autoconf.nanorc'
then
echo " - Skipping /usr/share/nano/autoconf.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/autoconf.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/autoconf.nanorc' &&
_C7REPOS__## Here is an example for Autoconf.
_C7REPOS__syntax "autoconf" "\.(ac|m4)$"
_C7REPOS__comment "#"
_C7REPOS__# Keywords:
_C7REPOS__color yellow "\<(if|test|then|elif|else|fi|for|in|do|done)\>"
_C7REPOS__color yellow "(=|!=|&&|\|\|)"
_C7REPOS__# Macros:
_C7REPOS__color cyan "\<[[:upper:]_[:digit:]]+\>"
_C7REPOS__# Version numbers:
_C7REPOS__color red "\<[-_.0-9]+\>"
_C7REPOS__# Strings:
_C7REPOS__color red "\"[^"]*\""  "\'[^']*\'"
_C7REPOS__# Backticks:
_C7REPOS__color green "`[^`]*`"
_C7REPOS__# Error lines:
_C7REPOS__color brightred "^\*\*\*.*"
_C7REPOS__# Brackets:
_C7REPOS__color magenta "\[|\]|\(|\)"
_C7REPOS__# Comments:
_C7REPOS__color blue "^[[:blank:]]*#.*"  "\<dnl.*"
_C7REPOS__# Trailing whitespace:
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/autoconf.nanorc failed";
fi
# ============= /usr/share/nano/awk.nanorc ==============
if test -f '/usr/share/nano/awk.nanorc'
then
echo " - Skipping /usr/share/nano/awk.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/awk.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/awk.nanorc' &&
_C7REPOS__## Here is an example for awk.
_C7REPOS__syntax "awk" "\.awk$"
_C7REPOS__magic "awk.*script text"
_C7REPOS__comment "#"
_C7REPOS__# Records.
_C7REPOS__icolor brightred "\$[0-9A-Z_!@#$*?-]+"
_C7REPOS__# Awk-set variables.
_C7REPOS__color red "\<(ARGC|ARGIND|ARGV|BINMODE|CONVFMT|ENVIRON|ERRNO|FIELDWIDTHS)\>"
_C7REPOS__color red "\<(FILENAME|FNR|FS|IGNORECASE|LINT|NF|NR|OFMT|OFS|ORS)\>"
_C7REPOS__color red "\<(PROCINFO|RS|RT|RSTART|RLENGTH|SUBSEP|TEXTDOMAIN)\>"
_C7REPOS__# Function declarations and special patterns.
_C7REPOS__color brightgreen "\<(function|extension|BEGIN|END)\>"
_C7REPOS__# Operators.
_C7REPOS__color green "(\{|\}|\(|\)|\;|\]|\[|\\|<|>|!|=|&|\+|-|\*|%|/|\?:|\^|\|)"
_C7REPOS__# Flow control.
_C7REPOS__color brightyellow "\<(for|if|while|do|else|in|delete|exit)\>"
_C7REPOS__color brightyellow "\<(break|continue|return)\>"
_C7REPOS__# I/O statements.
_C7REPOS__color brightgreen "\<(close|getline|next|nextfile|print|printf)\>"
_C7REPOS__color brightgreen "\<(system|fflush)\>"
_C7REPOS__# Standard functions.
_C7REPOS__color magenta "\<(atan2|cos|exp|int|log|rand|sin|sqrt|srand)\>"
_C7REPOS__color magenta "\<(asort|asorti|gensub|gsub|index|length|match)\>"
_C7REPOS__color magenta "\<(split|sprintf|strtonum|sub|substr|tolower|toupper)\>"
_C7REPOS__color magenta "\<(mktime|strftime|systime)\>"
_C7REPOS__color magenta "\<(and|compl|lshift|or|rshift|xor)\>"
_C7REPOS__color magenta "\<(bindtextdomain|dcgettext|dcngettext)\>"
_C7REPOS__# Strings.
_C7REPOS__color brightyellow "<[^= 	]*>" ""(\\.|[^"])*""
_C7REPOS__# Comments.
_C7REPOS__color brightblue "(^|[[:space:]])#.*$"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/awk.nanorc failed";
fi
# ============= /usr/share/nano/changelog.nanorc ==============
if test -f '/usr/share/nano/changelog.nanorc'
then
echo " - Skipping /usr/share/nano/changelog.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/changelog.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/changelog.nanorc' &&
_C7REPOS__## Colouring for Changelogs.
_C7REPOS__syntax "changelog" "Change[Ll]og.*"
_C7REPOS__# Author lines.
_C7REPOS__color green "^(19|20).*$"
_C7REPOS__# Dates.
_C7REPOS__color red "^(19|20)[0-9-]{8}"
_C7REPOS__# Email addresses.
_C7REPOS__color yellow "<[^>]*@[^>]*>"
_C7REPOS__# Command-line options.
_C7REPOS__color cyan "[[:space:]]-[a-zA-Z\$]" "--[8a-z-]+"
_C7REPOS__# Bug and patch numbers.
_C7REPOS__color cyan "(BZ|bug|patch) #[0-9]+" "PR [[:alnum:]]+/[0-9]+"
_C7REPOS__# Probable constants, for variety.
_C7REPOS__color brightred "\<[A-Z_][0-9A-Z_]+\>"
_C7REPOS__# Key sequences.
_C7REPOS__color brightblue "\^[A-Z^\]" "\<M-." "\<F1?[0-9]" "(\^|M-)Space"
_C7REPOS__# Changed files.
_C7REPOS__color magenta start="^(	| {8})\* " end="(:( |$)|^$)"
_C7REPOS__# Release markers.
_C7REPOS__color brightblue "^(GNU )?nano[- ][0-9]\.[0-9]\.[^ ]+"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/changelog.nanorc failed";
fi
# ============= /usr/share/nano/cmake.nanorc ==============
if test -f '/usr/share/nano/cmake.nanorc'
then
echo " - Skipping /usr/share/nano/cmake.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/cmake.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/cmake.nanorc' &&
_C7REPOS__## Syntax highlighting for CMake files.
_C7REPOS__syntax "cmake" "(CMakeLists\.txt|\.cmake)$"
_C7REPOS__comment "#"
_C7REPOS__icolor green "^[[:space:]]*[A-Z0-9_]+"
_C7REPOS__icolor brightyellow "^[[:space:]]*(include|include_directories|include_external_msproject)\>"
_C7REPOS__icolor brightgreen "^[[:space:]]*\<((else|end)?if|else|(end)?while|(end)?foreach|break)\>"
_C7REPOS__color brightgreen "\<(NOT|COMMAND|POLICY|TARGET|EXISTS|IS_(DIRECTORY|ABSOLUTE)|DEFINED)\>[[:space:]]"
_C7REPOS__color brightgreen "[[:space:]]\<(OR|AND|IS_NEWER_THAN|MATCHES|(STR|VERSION_)?(LESS|GREATER|EQUAL))\>[[:space:]]"
_C7REPOS__icolor brightred "^[[:space:]]*\<((end)?(function|macro)|return)"
_C7REPOS__icolor cyan start="\$(\{|ENV\{)" end="\}"
_C7REPOS__color magenta "\<(APPLE|UNIX|WIN32|CYGWIN|BORLAND|MINGW|MSVC(_IDE|60|71|80|90)?)\>"
_C7REPOS__icolor brightblue "^([[:space:]]*)?#.*"
_C7REPOS__icolor brightblue "[[:space:]]#.*"
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/cmake.nanorc failed";
fi
# ============= /usr/share/nano/c.nanorc ==============
if test -f '/usr/share/nano/c.nanorc'
then
echo " - Skipping /usr/share/nano/c.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/c.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/c.nanorc' &&
_C7REPOS__## Here is an example for C/C++.
_C7REPOS__syntax "c" "\.(c(c|pp|xx|\+\+)?|C)$" "\.(h(h|pp|xx)?|H)$" "\.ii?$"
_C7REPOS__magic "(ASCII|UTF-8 Unicode) C(\+\+)? program text"
_C7REPOS__comment "//"
_C7REPOS__color brightred "\<[A-Z_][0-9A-Z_]+\>"
_C7REPOS__color green "\<(float|double|bool|char|int|short|long|sizeof|enum|void|auto|static|const|struct|union|typedef|extern|(un)?signed|inline)\>"
_C7REPOS__color green "\<((s?size)|((u_?)?int(8|16|32|64|ptr)))_t\>"
_C7REPOS__color green "\<(class|namespace|template|public|protected|private|typename|this|friend|virtual|override|using|mutable|volatile|register|explicit)\>"
_C7REPOS__color brightyellow "\<(for|if|while|do|else|case|default|switch)\>"
_C7REPOS__color brightyellow "\<(try|throw|catch|operator|new|delete)\>"
_C7REPOS__color magenta "\<(goto|continue|break|return)\>"
_C7REPOS__color brightcyan "^[[:space:]]*#[[:space:]]*(define|include(_next)?|(un|ifn?)def|endif|el(if|se)|if|warning|error|pragma)"
_C7REPOS__color brightmagenta "'([^'\]|(\\["'abfnrtv\\]))'" "'\\(([0-3]?[0-7]{1,2}))'" "'\\x[0-9A-Fa-f]{1,2}'"
_C7REPOS__# GCC builtins.
_C7REPOS__color cyan "__attribute__[[:space:]]*\(\([^)]*\)\)" "__(aligned|asm|builtin|hidden|inline|packed|restrict|section|typeof|weak)__"
_C7REPOS__# Strings.  In general you will want your strings and comments to come last,
_C7REPOS__# because highlighting rules are applied in the order they are read in.
_C7REPOS__color brightyellow ""([^"]|\\")*"" "<[^[:blank:]=]*>"
_C7REPOS__# Multiline strings.  This regex is VERY resource intensive,
_C7REPOS__# and sometimes colours things that shouldn't be coloured.
_C7REPOS__###color brightyellow start=""(\\.|[^"])*\\[[:space:]]*$" end="^(\\.|[^"])*""
_C7REPOS__# Comments.
_C7REPOS__color brightblue "//.*"
_C7REPOS__color brightblue start="/\*" end="\*/"
_C7REPOS__# Reminders.
_C7REPOS__color ,yellow "\<(FIXME|TODO|XXX)\>"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/c.nanorc failed";
fi
# ============= /usr/share/nano/css.nanorc ==============
if test -f '/usr/share/nano/css.nanorc'
then
echo " - Skipping /usr/share/nano/css.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/css.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/css.nanorc' &&
_C7REPOS__## Here is an example for CSS files.
_C7REPOS__syntax "css" "\.css$"
_C7REPOS__comment "/*|*/"
_C7REPOS__color brightred     "."
_C7REPOS__color brightyellow  start="\{" end="\}"
_C7REPOS__color brightwhite   start=":" end="([;^\{]|$)"
_C7REPOS__color brightblue    ":active|:focus|:hover|:link|:visited|:link|:after|:before|$"
_C7REPOS__color brightblue    start="\/\*" end="\\*/"
_C7REPOS__color green         ";|:|\{|\}"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/css.nanorc failed";
fi
# ============= /usr/share/nano/debian.nanorc ==============
if test -f '/usr/share/nano/debian.nanorc'
then
echo " - Skipping /usr/share/nano/debian.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/debian.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/debian.nanorc' &&
_C7REPOS__## Here is an example for apt's sources.list.
_C7REPOS__syntax "sources.list" "sources\.list(~|\.old|\.save)?$" "sources\.list\.d/.*\.list(~|\.old|\.save)?$"
_C7REPOS__comment "#"
_C7REPOS__# Coloring the deb lines, working from tail to head.  First the
_C7REPOS__# components -- well, everything, and thus also the components.
_C7REPOS__color brightmagenta "^deb.*"
_C7REPOS__# Distribution -- well, everything, except the components.
_C7REPOS__color brightred "^deb(-src)?\s+.*((ftp|https?|rsh|ssh|copy|file|spacewalk|tor):/\S+|cdrom:\[.+\]/)\s+\S+"
_C7REPOS__# URIs.
_C7REPOS__color brightgreen "^deb(-src)?\s+.*(ftp|https?|rsh|ssh|copy|file|spacewalk|tor):/\S+"
_C7REPOS__# CDroms.
_C7REPOS__color brightgreen "^deb(-src)?\s+.*cdrom:\[.+\]/"
_C7REPOS__# Options.
_C7REPOS__color brightcyan "^deb(-src)?\s+\[.+\]\s+"
_C7REPOS__# And finally the initial deb tag.
_C7REPOS__color yellow "^deb(-src)?"
_C7REPOS__# Comments.
_C7REPOS__color brightblue "#.*"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/debian.nanorc failed";
fi
# ============= /usr/share/nano/default.nanorc ==============
if test -f '/usr/share/nano/default.nanorc'
then
echo " - Skipping /usr/share/nano/default.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/default.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/default.nanorc' &&
_C7REPOS__## An example of a default syntax.  The default syntax is used for
_C7REPOS__## files that do not match any other syntax.
_C7REPOS__syntax "default"
_C7REPOS__comment "#"
_C7REPOS__# Comments.
_C7REPOS__color cyan "^#.*"
_C7REPOS__# Spaces in front of tabs.
_C7REPOS__color ,red " +	+"
_C7REPOS__# Nano's name, including version.
_C7REPOS__color brightred "(GNU )?nano [1-9]\.[0-9]\.[^[:space:][:punct:]]+"
_C7REPOS__# Email addresses.
_C7REPOS__color yellow "<[[:alnum:].%_+-]+@[[:alnum:].-]+\.[[:alpha:]]{2,}>"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/default.nanorc failed";
fi
# ============= /usr/share/nano/elisp.nanorc ==============
if test -f '/usr/share/nano/elisp.nanorc'
then
echo " - Skipping /usr/share/nano/elisp.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/elisp.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/elisp.nanorc' &&
_C7REPOS__## Here is an example for Emacs Lisp.
_C7REPOS__syntax "elisp" "\.el$"
_C7REPOS__comment ";"
_C7REPOS__# Basic functions/macros
_C7REPOS__color brightcyan "\<(if|when|unless|cond|and|or|lambda|let|progn|while|dolist|dotimes)\>"
_C7REPOS__color brightcyan "\<save-((window-)?excursion|restriction)\>"
_C7REPOS__color brightcyan "\<eval-(and|when)-compile\>"
_C7REPOS__# Defining functions
_C7REPOS__color brightcyan "\<def(un|macro|subst|generic|alias)\>"
_C7REPOS__color brightcyan "\<cl-def(un|macro|subst|generic|struct|type)\>"
_C7REPOS__color brightcyan "\<define-(derived|minor|generic)-mode\>"
_C7REPOS__# Defining variables
_C7REPOS__color brightcyan "\<def(class|const|var(-local|alias)?)\>"
_C7REPOS__# Customization functions
_C7REPOS__color brightcyan "\<def(custom|face|group|theme)\>"
_C7REPOS__# Setting values
_C7REPOS__color brightcyan "\<(setq(-default|-local)?|setf|push|pop|declare(-function)?)\>"
_C7REPOS__# Feature functions
_C7REPOS__color brightcyan "\<(require|provide)\>"
_C7REPOS__# Quoted symbols
_C7REPOS__color brightyellow "#?'\<(\w|-)+\>"
_C7REPOS__# Booleans
_C7REPOS__color brightred "\<(t|nil)\>"
_C7REPOS__# Keywords
_C7REPOS__color blue ":(\w|[?-])+"
_C7REPOS__# Strings
_C7REPOS__color yellow start="^[[:blank:]]+\"" end="[^\]\""
_C7REPOS__color yellow ""(\\.|[^"])*""
_C7REPOS__# Comments
_C7REPOS__color cyan "(^|[[:space:]]);.*$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/elisp.nanorc failed";
fi
# ============= /usr/share/nano/fortran.nanorc ==============
if test -f '/usr/share/nano/fortran.nanorc'
then
echo " - Skipping /usr/share/nano/fortran.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/fortran.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/fortran.nanorc' &&
_C7REPOS__## Here is an example for Fortran 90/95.
_C7REPOS__syntax "fortran" "\.(f|f90|f95)$"
_C7REPOS__comment "!"
_C7REPOS__color red "\<[0-9]+\>"
_C7REPOS__icolor green "\<(action|advance|all|allocatable|allocated|any|apostrophe)\>"
_C7REPOS__icolor green "\<(append|asis|assign|assignment|associated|character|common)\>"
_C7REPOS__icolor green "\<(complex|data|default|delim|dimension|double precision)\>"
_C7REPOS__icolor green "\<(elemental|epsilon|external|file|fmt|form|format|huge)\>"
_C7REPOS__icolor green "\<(implicit|include|index|inquire|integer|intent|interface)\>"
_C7REPOS__icolor green "\<(intrinsic|iostat|kind|logical|module|none|null|only)>"
_C7REPOS__icolor green "\<(operator|optional|pack|parameter|pointer|position|private)\>"
_C7REPOS__icolor green "\<(program|public|real|recl|recursive|selected_int_kind)\>"
_C7REPOS__icolor green "\<(selected_real_kind|subroutine|status)\>"
_C7REPOS__icolor cyan "\<(abs|achar|adjustl|adjustr|allocate|bit_size|call|char)\>"
_C7REPOS__icolor cyan "\<(close|contains|count|cpu_time|cshift|date_and_time)\>"
_C7REPOS__icolor cyan "\<(deallocate|digits|dot_product|eor|eoshift|function|iachar)\>"
_C7REPOS__icolor cyan "\<(iand|ibclr|ibits|ibset|ichar|ieor|iolength|ior|ishft|ishftc)\>"
_C7REPOS__icolor cyan "\<(lbound|len|len_trim|matmul|maxexponent|maxloc|maxval|merge)\>"
_C7REPOS__icolor cyan "\<(minexponent|minloc|minval|mvbits|namelist|nearest|nullify)\>"
_C7REPOS__icolor cyan "\<(open|pad|present|print|product|pure|quote|radix)\>"
_C7REPOS__icolor cyan "\<(random_number|random_seed|range|read|readwrite|replace)\>"
_C7REPOS__icolor cyan "\<(reshape|rewind|save|scan|sequence|shape|sign|size|spacing)\>"
_C7REPOS__icolor cyan "\<(spread|sum|system_clock|target|transfer|transpose|trim)\>"
_C7REPOS__icolor cyan "\<(ubound|unpack|verify|write|tiny|type|use|yes)\>"
_C7REPOS__icolor yellow "\<(.and.|case|do|else|else?if|else?where|end|end?do|end?if)\>"
_C7REPOS__icolor yellow "\<(end?select|.eqv.|forall|if|lge|lgt|lle|llt|.neqv.|.not.)\>"
_C7REPOS__icolor yellow "\<(.or.|repeat|select case|then|where|while)\>"
_C7REPOS__icolor magenta "\<(continue|cycle|exit|go?to|result|return)\>"
_C7REPOS__# Strings.
_C7REPOS__icolor yellow "<[^= 	]*>" ""(\\.|[^"])*""
_C7REPOS__# Comments.
_C7REPOS__icolor blue "!.*"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/fortran.nanorc failed";
fi
# ============= /usr/share/nano/gentoo.nanorc ==============
if test -f '/usr/share/nano/gentoo.nanorc'
then
echo " - Skipping /usr/share/nano/gentoo.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/gentoo.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/gentoo.nanorc' &&
_C7REPOS__## Here is an example for Gentoo ebuilds/eclasses.
_C7REPOS__syntax "ebuild" "\.e(build|class|blit)$"
_C7REPOS__comment "#"
_C7REPOS__## All the standard portage functions
_C7REPOS__color brightgreen "(^|\<default_)src_(unpack|prepare|configure|compile|install|test)\>"
_C7REPOS__color brightgreen "^pkg_(config|nofetch|info|pretend|setup|(pre|post)(inst|rm))\>"
_C7REPOS__color brightgreen "\<default(_pkg_nofetch|_src_(unpack|prepare|configure|compile|test))?\>"
_C7REPOS__## Highlight bash related syntax
_C7REPOS__color green "\<(break|case|continue|do|done|elif|else|esac|exit|fi|for|function|if|in|read|return|select|shift|then|time|until|while)\>"
_C7REPOS__color green "\<(declare|eval|exec|export|let|local)\>"
_C7REPOS__color green "[{}():;|`$<>!=&\\]" "(\]|\[)"
_C7REPOS__color green "-[defhnrsuwxzL]\>"
_C7REPOS__color green "-(eq|ne|gt|lt|ge|le)\>"
_C7REPOS__## Highlight variables ... official portage ones in red, all others in bright red
_C7REPOS__color brightred "\$[-0-9@*#?$!]" "\$[[:alpha:]_][[:alnum:]_]*"
_C7REPOS__color brightred "\$\{[#!]?([-@*#?$!]|[0-9]+|[[:alpha:]_][[:alnum:]_]*)(\[([[:digit:]]|@)+\])?(([#%/]|:?[-=?+])[^}]*\}|\[|\})"
_C7REPOS__color red "\<(EAPI|ARCH|HOMEPAGE|DESCRIPTION|IUSE|SRC_URI|LICENSE|SLOT|KEYWORDS|[HPR]?DEPEND|PROVIDE|PROPERTIES|REQUIRED_USE|RESTRICT|USERLAND)\>"
_C7REPOS__color red "\<(S|E?D|T|PV|PF|P|PN|PR|PVR|A|CATEGORY|DISTDIR|FILESDIR|EPREFIX|E?ROOT|WORKDIR)\>"
_C7REPOS__color red "\<(AS|C(PP|XX)?|LD)FLAGS\>" "\<C(HOST|TARGET|BUILD)\>" "\<(MERGE_TYPE|REPLACING_VERSIONS|REPLACED_BY_VERSION)\>"
_C7REPOS__color red "\<EBUILD_PHASE(_FUNC)?\>"
_C7REPOS__color red "\<QA_((TEXTRELS|EXECSTACK|WX_LOAD)(_[a-zA-Z_0-9]+)?|DT_HASH|PRESTRIPPED)\>"
_C7REPOS__color red "\<(PATCHES|(HTML_)?DOCS)\>" "\<WANT_(AUTO(CONF|MAKE)|LIBTOOL)\>" "\<AT_M4DIR\>"
_C7REPOS__## Highlight portage commands
_C7REPOS__color magenta "\<(use(_(with|enable|if_iuse)|x)?|in_iuse)\> [!a-zA-Z0-9_+ -]*" "inherit.*"
_C7REPOS__color brightblue "\<e(begin|end|conf|install|make|qmake4|ant|(qa)?warn|infon?|error|log|patch(_user)?|new(group|user))\>"
_C7REPOS__color brightblue "\<e(pause|beep|mktemp|(cvs|svn)_clean|punt_cxx)\>" "\<e(aclocal|auto(reconf|header|conf|make)|libtoolize)\>"
_C7REPOS__color brightblue "\<e(stack|shopts|umask)_(push|pop)\>" "\<version_is_at_least\>"
_C7REPOS__color brightblue "\<make_desktop_entry\>" "\<unpack(_(makeself|pdv))?\>"
_C7REPOS__color brightblue "\<(die|hasv?|inherit|nonfatal)\>" "\<(use(_(with|enable|if_iuse)|x)?|in_iuse)\>" "\<(has|best)_version\>"
_C7REPOS__color brightblue "\<(do|new)(ins|(games)?s?bin|doc|lib(\.so|\.a)?|man|info|exe|initd|confd|envd|pam|menu|icon)\>"
_C7REPOS__color brightblue "\<do(compress|header|python|sed|dir|hard|sym|html|jar|mo)\>" "\<keepdir\>"
_C7REPOS__color brightblue "\<prepall(docs|info|man|strip)?\>" "\<prep(info|lib|lib\.(so|a)|man|strip|gamesdirs)\>"
_C7REPOS__color brightblue "\<(doc|ins|exe)?into\>" "\<(f|games)(owners|perms)\>" "\<(exe|ins|dir)opts\>"
_C7REPOS__color brightblue "\<tc-get(BUILD_)?(AR|AS|CC|CPP|CXX|LD|NM|OBJCOPY|PKG_CONFIG|RANLIB)\>"
_C7REPOS__color brightblue "\<tc-(arch(-kernel)?|export|has-(tls|openmp))\>"
_C7REPOS__## Highlight common commands used in ebuilds
_C7REPOS__color blue "\<(awk|cat|cd|chmod|chown|cp|echo|env|find|e?grep|ln|make|mkdir|mv|popd|printf|pushd|rm|rmdir|sed|set|tar|touch|unset|xargs)\>"
_C7REPOS__## Highlight comments (doesnt work that well)
_C7REPOS__color yellow "(^|[[:space:]])#.*$"
_C7REPOS__## Highlight strings (doesnt work that well)
_C7REPOS__color brightyellow ""(\\.|[^\"])*"" "'(\\.|[^'])*'"
_C7REPOS__## Trailing space is bad!
_C7REPOS__color ,green "[[:space:]]+$"
_C7REPOS__## Mixed whitespace is also bad.
_C7REPOS__color ,green " 	"
_C7REPOS__## Here is an example for Portage control files.
_C7REPOS__##
_C7REPOS__syntax "/etc/portage" "\.(accept_keywords|env|keywords|mask|unmask|use)(/.+)?$"
_C7REPOS__## Base text:
_C7REPOS__color green "^.+$"
_C7REPOS__## Likely version and slot numbers:
_C7REPOS__color magenta "-[[:digit:].]+(_(alpha|beta|pre|rc|p)[[:digit:]]*)*(-r[[:digit:]]+)?([:[:space:]]|$)"
_C7REPOS__color magenta ":[^[:space:]]+([[:space:]]|$)"
_C7REPOS__## Use flags (must come after version/slot):
_C7REPOS__color brightred "[[:space:]]+\+?[A-Za-z0-9+_@-]+"
_C7REPOS__color brightblue "[[:space:]]+-[A-Za-z0-9+_@-]+"
_C7REPOS__## Accepted arches:
_C7REPOS__color white "[~-]?\<(alpha|amd64|arm(64)?|hppa|ia64|m68k|mips|nios2|ppc(64)?|riscv|s390|sh|sparc|x86)(-(aix|(f|free|net|open)bsd|cygwin|hpux|interix|linux|macos|mint|solaris|winnt))?\>"
_C7REPOS__color white "[[:space:]][*~-]?\*"
_C7REPOS__## Categories:
_C7REPOS__color cyan "^[[:space:]]*[^/]*/"
_C7REPOS__## Masking regulators:
_C7REPOS__color brightmagenta "^[[:space:]]*(=|~|<|<=|>|>=)"
_C7REPOS__## Comments:
_C7REPOS__color yellow "#.*$"
_C7REPOS__## Trailing space is bad!
_C7REPOS__color ,green "[[:space:]]+$"
_C7REPOS__## Mixed whitespace is also bad.
_C7REPOS__color ,green " 	"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/gentoo.nanorc failed";
fi
# ============= /usr/share/nano/go.nanorc ==============
if test -f '/usr/share/nano/go.nanorc'
then
echo " - Skipping /usr/share/nano/go.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/go.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/go.nanorc' &&
_C7REPOS__## Here is an example for Go.
_C7REPOS__syntax "go" "\.go$"
_C7REPOS__comment "//"
_C7REPOS__# Set up a formatter since spelling is probably useless...
_C7REPOS__formatter gofmt -w
_C7REPOS__# Types.
_C7REPOS__color green "\<(bool|u?int(8|16|32|64)?|float(32|64)|complex(64|128)|byte|rune|uintptr|string|error)\>"
_C7REPOS__color green "\<((<-[[:space:]]*)chan|chan[[:space:]]*<-|const|func|interface|map|struct|type|var)\>"
_C7REPOS__# Predefined functions.
_C7REPOS__color blue "\<(append|cap|close|complex|copy|delete|imag|len|make|new|panic|print|println|real|recover)\>"
_C7REPOS__# Control structures.
_C7REPOS__color brightyellow "\<(case|default|defer|else|for|go|if|range|select|switch)\>"
_C7REPOS__# Control flow.
_C7REPOS__color magenta "\<(break|continue|fallthrough|goto|return)\>"
_C7REPOS__# Declarations.
_C7REPOS__color brightcyan "\<(package|import)\>"
_C7REPOS__color brightcyan "//[[:space:]]*\+build[[:space:]]+(([a-zA-Z_0-9]+[[:space:]]*)+,[[:space:]]*)*[a-zA-Z_0-9]+"
_C7REPOS__# Literals.
_C7REPOS__color red "\<[0-9]+\.[0-9]*([Ee][+-][0-9]+)?i?\>"
_C7REPOS__color red "\<[0-9]+[Ee][+-][0-9]+i?\>"
_C7REPOS__color red "\<\.[0-9]+([Ee][+-][0-9]+)?i?\>"
_C7REPOS__color red "\<[0-9]+i\>"
_C7REPOS__color red "\<[1-9][0-9]*\>"
_C7REPOS__color red "\<0[0-7]*\>"
_C7REPOS__icolor red "\<0x[0-9a-f]+\>"
_C7REPOS__# Strings and characters; slightly fuzzy.
_C7REPOS__color red "\<(true|false|nil|iota|_)\>"
_C7REPOS__color red "'(\\.|[^'])+'"
_C7REPOS__color red ""(\\.|[^"])*""
_C7REPOS__color red start=""(\\.|[^"])*\\[[:space:]]*$" end="^(\\.|[^"])*""
_C7REPOS__# Comments.
_C7REPOS__color brightblue "//.*"
_C7REPOS__color brightblue start="/\*" end="\*/"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/go.nanorc failed";
fi
# ============= /usr/share/nano/groff.nanorc ==============
if test -f '/usr/share/nano/groff.nanorc'
then
echo " - Skipping /usr/share/nano/groff.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/groff.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/groff.nanorc' &&
_C7REPOS__## Here is an example for groff.
_C7REPOS__syntax "groff" "\.m[ems]$" "\.rof" "\.tmac$" "^tmac."
_C7REPOS__comment ".\""
_C7REPOS__# The argument of .ds or .nr
_C7REPOS__color cyan "^\.(ds|nr) [^[:space:]]*"
_C7REPOS__# Single-character escapes
_C7REPOS__color brightmagenta "\\."
_C7REPOS__# The argument of \f or \s in the same color
_C7REPOS__color brightmagenta "\\f." "\\f\(.." "\\s(\+|\-)?[0-9]"
_C7REPOS__# Newlines
_C7REPOS__color cyan "(\\|\\\\)n(.|\(..)"
_C7REPOS__color cyan start="(\\|\\\\)n\[" end="]"
_C7REPOS__# Requests
_C7REPOS__color brightgreen "^\.[[:space:]]*[^[:space:]]*"
_C7REPOS__# Comments
_C7REPOS__color yellow "^\.\\".*$"
_C7REPOS__# Strings
_C7REPOS__color green "(\\|\\\\)\*(.|\(..)"
_C7REPOS__color green start="(\\|\\\\)\*\[" end="]"
_C7REPOS__# Characters
_C7REPOS__color brightred "\\\(.."
_C7REPOS__color brightred start="\\\[" end="]"
_C7REPOS__# Macro arguments
_C7REPOS__color brightcyan "\\\\\$[1-9]"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/groff.nanorc failed";
fi
# ============= /usr/share/nano/guile.nanorc ==============
if test -f '/usr/share/nano/guile.nanorc'
then
echo " - Skipping /usr/share/nano/guile.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/guile.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/guile.nanorc' &&
_C7REPOS__## Here is an example for Guile Scheme.
_C7REPOS__syntax "guile" "\.scm$"
_C7REPOS__header "^#!.*guile"
_C7REPOS__magic "guile"
_C7REPOS__comment ";"
_C7REPOS__# Basic scheme functions
_C7REPOS__color green "\<(do|if|lambda|let(rec)?|map|unless|when)\>"
_C7REPOS__# Defining things
_C7REPOS__color brightcyan "\<define(-macro|-module|-public|-syntax)?\>"
_C7REPOS__# Quoted symbols
_C7REPOS__color brightyellow "'\<(\w|-)+\>"
_C7REPOS__# Chars
_C7REPOS__color brightmagenta "#\\."
_C7REPOS__color brightmagenta "#\\\w+\>"
_C7REPOS__# Booleans
_C7REPOS__color brightred "(#t|#f)\>"
_C7REPOS__# Keywords
_C7REPOS__color blue "#?:(\w|[?-])+"
_C7REPOS__# Strings
_C7REPOS__color yellow start="^[[:blank:]]+\"" end="[^\]\""
_C7REPOS__color yellow ""(\\.|[^"])*""
_C7REPOS__# Comments
_C7REPOS__color cyan "(^|[[:space:]]);.*$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/guile.nanorc failed";
fi
# ============= /usr/share/nano/html.nanorc ==============
if test -f '/usr/share/nano/html.nanorc'
then
echo " - Skipping /usr/share/nano/html.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/html.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/html.nanorc' &&
_C7REPOS__## Here is an example for HTML.
_C7REPOS__syntax "html" "\.html?$"
_C7REPOS__magic "HTML document text"
_C7REPOS__comment "<!--|-->"
_C7REPOS__# Tags:
_C7REPOS__color cyan start="<[[:alpha:]/!?]" end=">"
_C7REPOS__# Bold, italic, and underlined:
_C7REPOS__color brightmagenta "</?[biu]>"
_C7REPOS__# Named character references:
_C7REPOS__color red "&[^;[:space:]]*;"
_C7REPOS__# Strings:
_C7REPOS__color green ""(\\.|[^"])*""
_C7REPOS__# Attributes:
_C7REPOS__color red "(abbr|accept(-charset)?|accesskey|action|alink|align|alt|archive|axis|background|bgcolor|border)="
_C7REPOS__color red "(cell(padding|spacing)|char(off|set)?|checked|cite|class(id)?|compact|code(base|tag)?|cols(pan)?)="
_C7REPOS__color red "(content(editable)?|contextmenu|coords|data|datetime|declare|defer|dir|disabled|enctype)="
_C7REPOS__color red "(for|frame(border)?|headers|height|hidden|href(lang)?|hspace|http-equiv|id|ismap)="
_C7REPOS__color red "(label|lang|link|longdesc|margin(height|width)|maxlength|media|method|multiple)="
_C7REPOS__color red "(name|nohref|noresize|noshade|object|onclick|onfocus|onload|onmouseover|profile|readonly|rel|rev)="
_C7REPOS__color red "(rows(pan)?|rules|scheme|scope|scrolling|selected|shape|size|span|src|standby|start|style|summary)="
_C7REPOS__color red "(tabindex|target|text|title|type|usemap|valign|value(type)?|vlink|vspace|width|xmlns|xml:space)="
_C7REPOS__# Comments:
_C7REPOS__color yellow start="<!--" end="-->"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/html.nanorc failed";
fi
# ============= /usr/share/nano/java.nanorc ==============
if test -f '/usr/share/nano/java.nanorc'
then
echo " - Skipping /usr/share/nano/java.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/java.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/java.nanorc' &&
_C7REPOS__## Here is an example for Java.
_C7REPOS__syntax "java" "\.java$"
_C7REPOS__magic "Java "
_C7REPOS__comment "//"
_C7REPOS__color green "\<(boolean|byte|char|double|float|int|long|new|short|this|transient|void)\>"
_C7REPOS__color red "\<(break|case|catch|continue|default|do|else|finally|for|if|return|switch|throw|try|while)\>"
_C7REPOS__color cyan "\<(abstract|class|extends|final|implements|import|instanceof|interface|native)\>"
_C7REPOS__color cyan "\<(package|private|protected|public|static|strictfp|super|synchronized|throws|volatile)\>"
_C7REPOS__color red ""[^"]*""
_C7REPOS__color yellow "\<(true|false|null)\>"
_C7REPOS__color blue "//.*"
_C7REPOS__color blue start="/\*" end="\*/"
_C7REPOS__color brightblue start="/\*\*" end="\*/"
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/java.nanorc failed";
fi
# ============= /usr/share/nano/javascript.nanorc ==============
if test -f '/usr/share/nano/javascript.nanorc'
then
echo " - Skipping /usr/share/nano/javascript.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/javascript.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/javascript.nanorc' &&
_C7REPOS__## Here is an example for Javascript.
_C7REPOS__syntax "javascript" "\.js$"
_C7REPOS__comment "//"
_C7REPOS__color brightred "\<[A-Z_][0-9A-Z_]+\>"
_C7REPOS__color green "\<(const|function|let|this|typeof|var|void)\>"
_C7REPOS__color brightyellow "\<(for|if|while|with|do|else|case|default|switch)\>"
_C7REPOS__color brightyellow "\<(export|try|throw|catch|new|delete)\>"
_C7REPOS__color magenta "\<(continue|break|return|yield)\>"
_C7REPOS__color brightmagenta "'([^'\]|(\\["'abfnrtv\\]))'" "'\\(([0-3]?[0-7]{1,2}))'" "'\\x[0-9A-Fa-f]{1,2}'"
_C7REPOS__# Strings.
_C7REPOS__color brightyellow "<[^= 	]*>" ""(\\.|[^"])*"" "'(\\.|[^'])*'"
_C7REPOS__# Comments.
_C7REPOS__color brightblue "//.*"
_C7REPOS__color brightblue start="/\*" end="\*/"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/javascript.nanorc failed";
fi
# ============= /usr/share/nano/json.nanorc ==============
if test -f '/usr/share/nano/json.nanorc'
then
echo " - Skipping /usr/share/nano/json.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/json.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/json.nanorc' &&
_C7REPOS__## Syntax highlighting for JSON files.
_C7REPOS__# See:  http://www.json.org/
_C7REPOS__# Original author:  Aapo Rantalainen
_C7REPOS__# License:  GPLv3 or newer
_C7REPOS__syntax "json" "\.json$"
_C7REPOS__# No comments are permitted in JSON.
_C7REPOS__comment ""
_C7REPOS__# Numbers (used as value).
_C7REPOS__color green ":[[:space:]]*\-?(0|[1-9][0-9]*)(\.[0-9]+)?([Ee]?[-+]?[0-9]+)?"
_C7REPOS__# Values (well, any string).
_C7REPOS__color brightmagenta "\".+\""
_C7REPOS__# Hex numbers (used as value).
_C7REPOS__color green ":[[:space:]]*\"#[0-9abcdefABCDEF]+\""
_C7REPOS__# Escapes.
_C7REPOS__color green "\\\\" "\\\"" "\\[bfnrt]" "\\u[0-9abcdefABCDEF]{4})"
_C7REPOS__# Special words.
_C7REPOS__color green "(true|false|null)"
_C7REPOS__# Names (very unlikely to contain a quote).
_C7REPOS__color brightblue "\"[^"]+\"[[:space:]]*:"
_C7REPOS__# Brackets, braces, and separators.
_C7REPOS__color brightblue "\[" "\]"
_C7REPOS__color brightred "\{" "\}"
_C7REPOS__color brightred "," ":"
_C7REPOS__# Comments.
_C7REPOS__color cyan "(^|[[:space:]]+)(//|#).*$"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/json.nanorc failed";
fi
# ============= /usr/share/nano/lua.nanorc ==============
if test -f '/usr/share/nano/lua.nanorc'
then
echo " - Skipping /usr/share/nano/lua.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/lua.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/lua.nanorc' &&
_C7REPOS__## Syntax highlighting for Lua.
_C7REPOS__## Author:  Matthew Wild <mwild1 (at) gmail.com>
_C7REPOS__## License: GPL 3 or later
_C7REPOS__## Version: 2011-05-05
_C7REPOS__syntax "lua" "\.lua$"
_C7REPOS__comment "--"
_C7REPOS__color brightwhite "\[\[.*\]\]"
_C7REPOS__# Operators
_C7REPOS__color brightyellow ":|\*|/|%|\+|-|\^|>|>=|<|<=|~=|=|\.\.|\<(not|and|or)\>"
_C7REPOS__# Statements
_C7REPOS__color brightblue "\<(do|end|while|repeat|until|if|elseif|then|else|for|in|function|local|return|break)\>"
_C7REPOS__# Keywords
_C7REPOS__color brightyellow "\<(io|math|os|string|table|coroutine|debug)\>\."
_C7REPOS__color brightyellow "\<(_G|_VERSION|assert|collectgarbage|dofile|error|getfenv|getmetatable|ipairs|load|loadfile|module|next|pairs|pcall|print|rawequal|rawget|rawset|require|select|setfenv|setmetatable|tonumber|tostring|type|unpack|xpcall)\s*\("
_C7REPOS__# Standard library
_C7REPOS__color brightyellow "io\.\<(close|flush|input|lines|open|output|popen|read|tmpfile|type|write|stdin|stdout|stderr)\>"
_C7REPOS__color brightyellow "math\.\<(abs|acos|asin|atan2|atan|ceil|cosh|cos|deg|exp|floor|fmod|frexp|huge|ldexp|log10|log)\>"
_C7REPOS__color brightyellow "math\.\<(max|min|mod|modf|pi|pow|rad|random|randomseed|sinh|tan)\>"
_C7REPOS__color brightyellow "os\.\<(clock|date|difftime|execute|exit|getenv|remove|rename|setlocale|time|tmpname)\>"
_C7REPOS__color brightyellow "package\.\<(cpath|loaded|loadlib|path|preload|seeall)\>"
_C7REPOS__color brightyellow "string\.\<(byte|char|dump|find|format|gmatch|gsub|len|lower|match|rep|reverse|sub|upper)\>"
_C7REPOS__color brightyellow "table\.\<(concat|insert|maxn|remove|sort)\>"
_C7REPOS__color brightyellow "coroutine\.\<(create|resume|running|status|wrap|yield)\>"
_C7REPOS__color brightyellow "debug\.\<(debug|getfenv|gethook|getinfo|getlocal|getmetatable|getregistry|getupvalue)\>"
_C7REPOS__color brightyellow "debug\.\<(setfenv|sethook|setlocal|setmetatable|setupvalue|traceback)\>"
_C7REPOS__# File handle methods
_C7REPOS__color brightyellow "\:\<(close|flush|lines|read|seek|setvbuf|write)\>"
_C7REPOS__# false, nil, true
_C7REPOS__color brightmagenta "\<(false|nil|true)\>"
_C7REPOS__# External files
_C7REPOS__color brightgreen "\<(dofile|require)\>"
_C7REPOS__# Numbers
_C7REPOS__color red "\<([0-9]+)\>"
_C7REPOS__# Symbols
_C7REPOS__color brightmagenta "(\(|\)|\[|\]|\{|\})"
_C7REPOS__# Shebang
_C7REPOS__color brightcyan   "^#!.*"
_C7REPOS__# Simple comments
_C7REPOS__color green        "\-\-.*$"
_C7REPOS__# Multiline comments
_C7REPOS__color green         start="\-\-\[\[" end="\]\]"
_C7REPOS__# Strings
_C7REPOS__color red "\"(\\.|[^\\\"])*\"|'(\\.|[^\\'])*'"
_C7REPOS__##color red         start="\[\[" end="\]\]"
_C7REPOS__# Hex literals
_C7REPOS__color red "0x[0-9a-fA-F]*"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/lua.nanorc failed";
fi
# ============= /usr/share/nano/makefile.nanorc ==============
if test -f '/usr/share/nano/makefile.nanorc'
then
echo " - Skipping /usr/share/nano/makefile.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/makefile.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/makefile.nanorc' &&
_C7REPOS__## Here is an example for Makefiles.
_C7REPOS__syntax "makefile" "Makefile[^/]*$" "\.(make|mk)$"
_C7REPOS__comment "#"
_C7REPOS__color red "[:=]"
_C7REPOS__color magenta "\<(if|ifeq|else|endif)\>"
_C7REPOS__color blue "\$+[{(][a-zA-Z0-9_-]+[})]"
_C7REPOS__color brightblue "^[^ 	]+:"
_C7REPOS__color green "(^|[[:space:]]+)#.*"
_C7REPOS__## Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/makefile.nanorc failed";
fi
# ============= /usr/share/nano/man.nanorc ==============
if test -f '/usr/share/nano/man.nanorc'
then
echo " - Skipping /usr/share/nano/man.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/man.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/man.nanorc' &&
_C7REPOS__## Here is an example for manpages.
_C7REPOS__syntax "man" "\.[1-9]x?$"
_C7REPOS__magic "troff or preprocessor input text"
_C7REPOS__comment ".\""
_C7REPOS__color green "\.(SH|SS|TH) .*$"
_C7REPOS__color brightgreen "\.(SH|SS|TH) " "\.([HIT]P)"
_C7REPOS__color brightred "\.(B[IR]?|I[BR]?|R[BI]|S[BM]) .*$"
_C7REPOS__color brightblue "\.(B[IR]?|I[BR]?|R[BI]|S[BM]) " "\.([LP]?P)$"
_C7REPOS__color magenta "\\f[BIPR]"
_C7REPOS__color yellow "\.(br|DT|RS|RE|PD)"
_C7REPOS__# Comments.
_C7REPOS__color cyan "\.?\\\".*$"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/man.nanorc failed";
fi
# ============= /usr/share/nano/mgp.nanorc ==============
if test -f '/usr/share/nano/mgp.nanorc'
then
echo " - Skipping /usr/share/nano/mgp.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/mgp.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/mgp.nanorc' &&
_C7REPOS__## Here is an example for Magicpoint presentations.
_C7REPOS__syntax "mgp" "\.mgp$"
_C7REPOS__header "^%include.*"
_C7REPOS__comment "#"
_C7REPOS__icolor green "^%[a-z].*$"
_C7REPOS__color cyan "(^|[[:space:]])#.*$"
_C7REPOS__color cyan "(^|[[:space:]])%%.*$"
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/mgp.nanorc failed";
fi
# ============= /usr/share/nano/mutt.nanorc ==============
if test -f '/usr/share/nano/mutt.nanorc'
then
echo " - Skipping /usr/share/nano/mutt.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/mutt.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/mutt.nanorc' &&
_C7REPOS__## Here is an example for quoted emails (under e.g. mutt).
_C7REPOS__syntax "mutt"
_C7REPOS__# Quoted lines.
_C7REPOS__color green "^>.*"
_C7REPOS__# Signatures, even quoted ones.
_C7REPOS__color yellow start="^>* ?-- $" end="^>* ?$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/mutt.nanorc failed";
fi
# ============= /usr/share/nano/nanohelp.nanorc ==============
if test -f '/usr/share/nano/nanohelp.nanorc'
then
echo " - Skipping /usr/share/nano/nanohelp.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/nanohelp.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/nanohelp.nanorc' &&
_C7REPOS__## This is meant for highlighting key combos in a nano help text.
_C7REPOS__# It should not apply to any normal file, so no fileregex.
_C7REPOS__syntax "nanohelp"
_C7REPOS__# Key combos:
_C7REPOS__color cyan "\^([]4-8A-Z^\_←→↑↓]|Home|End)"  "[←→↑↓]"
_C7REPOS__color cyan "\<(Tab|Enter|Home|End|Ins|Del|Bsp|PgUp|PgDn)\>"
_C7REPOS__color cyan "\<M-."  "\<F1?[0-9]"  "(\^|M-)Space"
_C7REPOS__# Quoted indicators:
_C7REPOS__color brightred "'(\^|M-)'"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/nanohelp.nanorc failed";
fi
# ============= /usr/share/nano/nanorc.nanorc ==============
if test -f '/usr/share/nano/nanorc.nanorc'
then
echo " - Skipping /usr/share/nano/nanorc.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/nanorc.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/nanorc.nanorc' &&
_C7REPOS__## Here is an example for nanorc files.
_C7REPOS__syntax "nanorc" "\.?nanorc$"
_C7REPOS__comment "#"
_C7REPOS__# Possible errors and parameters
_C7REPOS__icolor brightred "^[[:space:]]*((un)?(bind|set)|include|syntax|header|comment|magic|linter|i?color|extendsyntax).*$"
_C7REPOS__# Keywords
_C7REPOS__icolor brightgreen "^[[:space:]]*(set|unset)[[:space:]]+(allow_insecure_backup|autoindent|backup|backwards|boldtext|casesensitive|constantshow|cut|fill[[:space:]]+[[:digit:]]+|historylog|justifytrim|linenumbers|locking|morespace|mouse|multibuffer|noconvert|nohelp|nopauses|nonewlines|nowrap|positionlog|preserve|quickblank|quiet|rebinddelete|rebindkeypad|regexp|showcursor|smarthome|smooth|softwrap|suspend|tabsize[[:space:]]+[[:digit:]]+|tabstospaces|tempfile|unix|view|wordbounds)\>"
_C7REPOS__icolor yellow "^[[:space:]]*set[[:space:]]+((function|key|number|status|title)color)[[:space:]]+(bright)?(white|black|red|blue|green|yellow|magenta|cyan)?(,(white|black|red|blue|green|yellow|magenta|cyan))?\>" "[[:space:]]+[[:digit:]]+$"
_C7REPOS__icolor brightgreen "^[[:space:]]*set[[:space:]]+(backupdir|brackets|functioncolor|keycolor|matchbrackets|numbercolor|operatingdir|punct|quotestr|speller|statuscolor|titlecolor|whitespace|wordchars)[[:space:]]+"
_C7REPOS__icolor brightgreen "^[[:space:]]*bind[[:space:]]+((\^([[:alpha:]]|[]0-9\^_]|Space)|M-([[:alpha:]]|[]!"#$%&'()*+,./0-9:;<=>?@\^_`{|}~-]|Space))|F([1-9]|1[0-6])|Ins|Del)[[:space:]]+[[:alpha:]]+[[:space:]]+(all|main|search|replace(with)?|gotoline|writeout|insert|ext(ernal)?cmd|help|spell|linter|browser|whereisfile|gotodir)([[:space:]]+#|[[:space:]]*$)"
_C7REPOS__icolor brightgreen "^[[:space:]]*unbind[[:space:]]+((\^([[:alpha:]]|[]0-9\^_]|Space)|M-([[:alpha:]]|[]!"#$%&'()*+,./0-9:;<=>?@\^_`{|}~-]|Space))|F([1-9]|1[0-6])|Ins|Del)[[:space:]]+(all|main|search|replace(with)?|gotoline|writeout|insert|ext(ernal)?cmd|help|spell|linter|browser|whereisfile|gotodir)([[:space:]]+#|[[:space:]]*$)"
_C7REPOS__icolor brightgreen "^[[:space:]]*extendsyntax[[:space:]]+[[:alpha:]]+[[:space:]]+(i?color|header|magic|comment|linter|formatter)[[:space:]]+.*$"
_C7REPOS__icolor green "^[[:space:]]*((un)?(bind|set)|include|syntax|header|magic|comment|linter|formatter|extendsyntax)\>"
_C7REPOS__# Colors
_C7REPOS__icolor yellow "^[[:space:]]*i?color[[:space:]]*(bright)?(white|black|red|blue|green|yellow|magenta|cyan)?(,(white|black|red|blue|green|yellow|magenta|cyan))?\>"
_C7REPOS__icolor magenta "^[[:space:]]*i?color\>" "\<(start|end)="
_C7REPOS__# Strings
_C7REPOS__color brightmagenta ""(\\.|[^"])*""
_C7REPOS__# Comments
_C7REPOS__color brightblue "(^|[[:space:]]+)#.*$"
_C7REPOS__color cyan "^[[:space:]]*##.*$"
_C7REPOS__# Trailing whitespace
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/nanorc.nanorc failed";
fi
# ============= /usr/share/nano/nftables.nanorc ==============
if test -f '/usr/share/nano/nftables.nanorc'
then
echo " - Skipping /usr/share/nano/nftables.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/nftables.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/nftables.nanorc' &&
_C7REPOS__## Here is an example for nftables.
_C7REPOS__syntax "nftables" "\.(nft|nftables)$"
_C7REPOS__header "^#!.*(nft|nftables)"
_C7REPOS__comment "#"
_C7REPOS__# Objects and operations
_C7REPOS__color green "\<(chain|hook|policy|priority|ruleset|set|table|type|v?map)\>"
_C7REPOS__color green "\<(define|include)\>"
_C7REPOS__color red "\<(add|delete|flush|insert|remove|replace)\>"
_C7REPOS__# Families
_C7REPOS__color yellow "\<(arp|bridge|inet|ingress|ip6?|netdev)\>"
_C7REPOS__# Terminal statements
_C7REPOS__color red "\<(drop|reject)\>"
_C7REPOS__color brightblue "\<(accept|continue|(d|s)nat|goto|jump|masquerade|return)\>"
_C7REPOS__# Comments
_C7REPOS__color cyan "(^|[[:space:]])#.*$"
_C7REPOS__# Trailing whitespace
_C7REPOS__color ,green "[[:space:]]+$"
_C7REPOS__# Strings and others
_C7REPOS__color yellow ""(\\.|[^"])*"" "'(\\.|[^'])*'"
_C7REPOS__color green "[{}():;|`$<>!=&\\]" "(\]|\[)"
_C7REPOS__# Basic variable names
_C7REPOS__color brightred "(\$|@)[[:alpha:]_-][[:alnum:]_.-]*"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/nftables.nanorc failed";
fi
# ============= /usr/share/nano/objc.nanorc ==============
if test -f '/usr/share/nano/objc.nanorc'
then
echo " - Skipping /usr/share/nano/objc.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/objc.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/objc.nanorc' &&
_C7REPOS__## Here is an example for C/C++/Obj-C.
_C7REPOS__syntax "m" "\.m$"
_C7REPOS__comment "//"
_C7REPOS__# Stuffs,
_C7REPOS__color brightwhite "\<[A-Z_][0-9A-Z_]+\>"
_C7REPOS__color green "\<(float|double|BOOL|bool|char|int|short|long|id|sizeof|enum|void|static|const|struct|union|typedef|extern|(un)?signed|inline)\>"
_C7REPOS__color green "\<[[:alpha:]_][[:alnum:]_]*_t\>"
_C7REPOS__color green "\<(class|namespace|template|public|protected|private|typename|this|friend|virtual|using|mutable|volatile|register|explicit)\>"
_C7REPOS__color brightgreen "\<(for|if|while|do|else|case|default|switch)\>"
_C7REPOS__color brightgreen "\<(try|throw|catch|operator|new|delete)\>"
_C7REPOS__color brightgreen "\<(goto|continue|break|return)\>"
_C7REPOS__color brightgreen "@\<(en(code|d)|i(mplementation|nterface)|selector)\>"
_C7REPOS__# GCC builtins.
_C7REPOS__color cyan "__attribute__[[:space:]]*\(\([^)]*\)\)" "__(aligned|asm|builtin|hidden|inline|packed|restrict|section|typeof|weak)__"
_C7REPOS__# Selector/method.
_C7REPOS__color brightmagenta "(^|[[:space:]])\[.*[[:space:]].*\]"
_C7REPOS__color white ":[[:alnum:]]*"
_C7REPOS__color magenta "[[:alnum:]]*:"
_C7REPOS__color white "\[[^][:space:]]*\]"
_C7REPOS__# Strings.
_C7REPOS__color brightblack "'([^'\]|(\\["'abfnrtv\\]))'" "'\\(([0-3]?[0-7]{1,2}))'" "'\\x[0-9A-Fa-f]{1,2}'"
_C7REPOS__color brightblack "<[^= 	]*>" ""(\\.|[^"])*""
_C7REPOS__color brightblue "@"(\\.|[^"])*""
_C7REPOS__# Multiline strings.  This regex is VERY resource intensive,
_C7REPOS__# and sometimes colours things that shouldn't be coloured.
_C7REPOS__###color brightyellow start=""(\\.|[^"])*\\[[:space:]]*$" end="^(\\.|[^"])*""
_C7REPOS__# Preprocessor commands.
_C7REPOS__color brightblue "^[[:space:]]*#[[:space:]]*(define|include|import|(un|ifn?)def|endif|el(if|se)|if|warning|error)"
_C7REPOS__# Comments.
_C7REPOS__color yellow "//.*"
_C7REPOS__color yellow start="/\*" end="\*/"
_C7REPOS__# Trailing whitespace.                                                                                                       
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/objc.nanorc failed";
fi
# ============= /usr/share/nano/ocaml.nanorc ==============
if test -f '/usr/share/nano/ocaml.nanorc'
then
echo " - Skipping /usr/share/nano/ocaml.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/ocaml.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/ocaml.nanorc' &&
_C7REPOS__## Syntax highlighting for OCaml.
_C7REPOS__syntax "ocaml" "\.mli?$"
_C7REPOS__comment "(*|*)"
_C7REPOS__# Uid:
_C7REPOS__color red "\<[A-Z][0-9a-z_]{2,}\>"
_C7REPOS__# Declarations:
_C7REPOS__color green "\<(let|val|method|in|and|rec|private|virtual|constraint)\>"
_C7REPOS__# Structure items:
_C7REPOS__color red "\<(type|open|class|module|exception|external)\>"
_C7REPOS__# Patterns:
_C7REPOS__color blue "\<(fun|function|functor|match|try|with)\>"
_C7REPOS__# Pattern modifiers:
_C7REPOS__color yellow "\<(as|when|of)\>"
_C7REPOS__# Conditions:
_C7REPOS__color cyan "\<(if|then|else)\>"
_C7REPOS__# Blocks:
_C7REPOS__color magenta "\<(begin|end|object|struct|sig|for|while|do|done|to|downto)\>"
_C7REPOS__# Constants:
_C7REPOS__color green "\<(true|false)\>"
_C7REPOS__# Modules/classes:
_C7REPOS__color green "\<(include|inherit|initializer)\>"
_C7REPOS__# Expression modifiers:
_C7REPOS__color yellow "\<(new|ref|mutable|lazy|assert|raise)\>"
_C7REPOS__# Comments:
_C7REPOS__color white start="\(\*" end="\*\)"
_C7REPOS__# Strings: (no multiline handling yet)
_C7REPOS__color brightblack ""[^\"]*""
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/ocaml.nanorc failed";
fi
# ============= /usr/share/nano/patch.nanorc ==============
if test -f '/usr/share/nano/patch.nanorc'
then
echo " - Skipping /usr/share/nano/patch.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/patch.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/patch.nanorc' &&
_C7REPOS__## Here is an example for patch files.
_C7REPOS__syntax "patch" "\.(patch|diff|debdiff)$"
_C7REPOS__magic "diff output text"
_C7REPOS__# There is no official support for comments in patch files.
_C7REPOS__comment ""
_C7REPOS__# Added lines.
_C7REPOS__color brightgreen "^\+.*"
_C7REPOS__# Show trailing whitespace only on added lines.
_C7REPOS__color ,green "[[:space:]]+$"
_C7REPOS__# Context lines.
_C7REPOS__color brightblue "^ .*"
_C7REPOS__# Deleted lines.
_C7REPOS__color brightred "^-.*"
_C7REPOS__# Header lines.
_C7REPOS__color magenta "^(Index:|diff)[[:blank:]].*"
_C7REPOS__# File names and dates.
_C7REPOS__color red "^---.*"
_C7REPOS__color green "^\+\+\+.*"
_C7REPOS__# Line numbers.
_C7REPOS__color brightyellow "^@@.*"
_C7REPOS__# Statistics.
_C7REPOS__color cyan start="^---$" end="^$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/patch.nanorc failed";
fi
# ============= /usr/share/nano/perl.nanorc ==============
if test -f '/usr/share/nano/perl.nanorc'
then
echo " - Skipping /usr/share/nano/perl.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/perl.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/perl.nanorc' &&
_C7REPOS__## Here is an example for Perl.
_C7REPOS__syntax "perl" "\.p[lm]$"
_C7REPOS__header "^#!.*perl[-0-9._]*"
_C7REPOS__magic "Perl script text"
_C7REPOS__comment "#"
_C7REPOS__color red "\<(accept|alarm|atan2|bin(d|mode)|c(aller|h(dir|mod|op|own|root)|lose(dir)?|onnect|os|rypt)|d(bm(close|open)|efined|elete|ie|o|ump)|e(ach|of|val|x(ec|ists|it|p))|f(cntl|ileno|lock|ork))\>" "\<(get(c|login|peername|pgrp|ppid|priority|pwnam|(host|net|proto|serv)byname|pwuid|grgid|(host|net)byaddr|protobynumber|servbyport)|([gs]et|end)(pw|gr|host|net|proto|serv)ent|getsock(name|opt)|gmtime|goto|grep|hex|index|int|ioctl|join)\>" "\<(keys|kill|last|length|link|listen|local(time)?|log|lstat|m|mkdir|msg(ctl|get|snd|rcv)|next|oct|open(dir)?|ord|pack|pipe|pop|printf?|push|q|qq|qx|rand|re(ad(dir|link)?|cv|do|name|quire|set|turn|verse|winddir)|rindex|rmdir|s|scalar|seek(dir)?)\>" "\<(se(lect|mctl|mget|mop|nd|tpgrp|tpriority|tsockopt)|shift|shm(ctl|get|read|write)|shutdown|sin|sleep|socket(pair)?|sort|spli(ce|t)|sprintf|sqrt|srand|stat|study|substr|symlink|sys(call|read|tem|write)|tell(dir)?|time|tr(y)?|truncate|umask)\>" "\<(un(def|link|pack|shift)|utime|values|vec|wait(pid)?|wantarray|warn|write)\>"
_C7REPOS__color magenta "\<(continue|else|elsif|do|for|foreach|if|unless|until|while|eq|ne|lt|gt|le|ge|cmp|x|my|sub|use|package|can|isa)\>"
_C7REPOS__icolor cyan start="[$@%]" end="( |[^0-9A-Z_]|-)"
_C7REPOS__color yellow "".*"|qq\|.*\|"
_C7REPOS__color white "[sm]/.*/"
_C7REPOS__color white start="(^use| = new)" end=";"
_C7REPOS__color green "#.*"
_C7REPOS__color yellow start="<< 'STOP'" end="STOP"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/perl.nanorc failed";
fi
# ============= /usr/share/nano/php.nanorc ==============
if test -f '/usr/share/nano/php.nanorc'
then
echo " - Skipping /usr/share/nano/php.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/php.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/php.nanorc' &&
_C7REPOS__## Here is an example for PHP.
_C7REPOS__syntax "php" "\.ph(p[23457s~]?|tml)$"
_C7REPOS__magic "PHP script text"
_C7REPOS__comment "//"
_C7REPOS__# PHP markings.
_C7REPOS__color brightgreen "(<\?(php)?|\?>)"
_C7REPOS__# Function names.
_C7REPOS__color white "\<[a-z_]*\("
_C7REPOS__# Variable names.
_C7REPOS__color cyan "\$[a-z_]+"
_C7REPOS__# Types.
_C7REPOS__color green "\<(array|bool|callable|const|float|global|int|object|string|var)\>"
_C7REPOS__# Directives and structure.
_C7REPOS__color brightyellow "\<(abstract|as|class|clone|(end)?declare|extends|function|implements|include(_once)?|inst(ance|ead)of|interface|namespace|new|private|protected|public|require(_once)?|static|trait|use|yield)\>"
_C7REPOS__color brightyellow "\<(case|catch|default|do|echo|else(if)?|end(for(each)?|if|switch|while)|final(ly)?|for(each)?|if|print|switch|throw|try|while)\>"
_C7REPOS__# Operators.
_C7REPOS__color brightyellow "\<(and|or|xor)\>"
_C7REPOS__# Control flow.
_C7REPOS__color magenta "\<(break|continue|goto|return)\>"
_C7REPOS__# Strings.
_C7REPOS__color brightyellow ""(\.|[^"])*"" "'(\.|[^'])*'"
_C7REPOS__# Comments.
_C7REPOS__color brightblue "(^|[[:space:]]+)//.*"
_C7REPOS__color brightblue start="/\*" end="\*/"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/php.nanorc failed";
fi
# ============= /usr/share/nano/po.nanorc ==============
if test -f '/usr/share/nano/po.nanorc'
then
echo " - Skipping /usr/share/nano/po.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/po.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/po.nanorc' &&
_C7REPOS__## Colouring for PO files.
_C7REPOS__syntax "po" "\.pot?$"
_C7REPOS__comment "#"
_C7REPOS__# Comments.
_C7REPOS__color green "^#.*$"
_C7REPOS__color yellow "Copyright|\(C\)"
_C7REPOS__# Header fields.
_C7REPOS__color brightred "^\"X-Bugs:.*\"$"
_C7REPOS__color brightmagenta "\<(Project\-Id\-Version|Report\-Msgid\-Bugs\-To|Last\-Translator|Language(\-Team)?|X-Bugs|X-Generator|Plural\-Forms)\>"
_C7REPOS__color cyan "\<(POT\-Creation\-Date|PO\-Revision\-Date|MIME\-Version|Content\-Type|Content\-Transfer\-Encoding)\>"
_C7REPOS__# Encodings and numbers.
_C7REPOS__color yellow "\<(UTF|ISO|Windows|Mac|IBM)\>\-[0-9]"
_C7REPOS__color yellow "[0-9]|pre[0-9]|[0-9]bit"
_C7REPOS__# Msgids.
_C7REPOS__color brightblue "^(msgid|msgid_plural|msgstr)\>"
_C7REPOS__# Tags.
_C7REPOS__color red " fuzzy(,|$)"
_C7REPOS__color yellow " (no-)?[-[:alpha:]]+-format(,|$)"
_C7REPOS__# Format specifiers.
_C7REPOS__color brightmagenta "%([1-9]\$)?[a-z]*"
_C7REPOS__# Quotes and newlines.
_C7REPOS__color yellow "\""
_C7REPOS__color cyan "\\n"
_C7REPOS__# Reminders.
_C7REPOS__color ,yellow "(FIXME|TODO|XXX)"
_C7REPOS__# Obsolete strings.
_C7REPOS__color red "#~.*$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/po.nanorc failed";
fi
# ============= /usr/share/nano/postgresql.nanorc ==============
if test -f '/usr/share/nano/postgresql.nanorc'
then
echo " - Skipping /usr/share/nano/postgresql.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/postgresql.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/postgresql.nanorc' &&
_C7REPOS__## Here is an example for PostgreSQL.
_C7REPOS__syntax "sql" "\.sql[2345s~]?$"
_C7REPOS__magic "PostgreSQL script text"
_C7REPOS__comment "-- "
_C7REPOS__# Functions.
_C7REPOS__color white "\<[a-z_]*\("
_C7REPOS__# Types.
_C7REPOS__color green "\<(int2|smallint|int4|int|integer|int8|bigint|decimal|numeric|real|double precision|(small|big)?serial)\>"
_C7REPOS__color green "\<(bit( varying)?|boolean|bytea|enum|money|tsvector|uuid)\>"
_C7REPOS__color green "\<(char|varchar|character( varying)?|text)\>"
_C7REPOS__color green "\<(date|interval|time(stamp)?( with time zone| without time zone)?)\>"
_C7REPOS__color green "\<(point|line|lseg|path|box|polygon|circle)\>"
_C7REPOS__color green "\<(cidr|inet|macaddr)\>"
_C7REPOS__color green "\<(daterange|int4range|int8range|numrange|tsrange|tstzrange)\>"
_C7REPOS__# Structure.
_C7REPOS__color brightyellow "\<(CASE|CLASS|DEFAULT|DO|ELSE|ELSEIF|FOR|FOREACH|FUNCTION|IF|IS NULL)\>"
_C7REPOS__color brightyellow "\<(NEW|PRIVATE|PUBLIC|RETURN|RETURNS|SETOF|SWITCH|THEN|WHEN|WHILE)>"
_C7REPOS__# Control flow.
_C7REPOS__color magenta "\<(EXCEPTION|NOTICE|RAISE|RETURN)\>"
_C7REPOS__# SQL keywords.
_C7REPOS__color blue "\<(ABORT|AGGREGATE|ALTER|ANALYZE|AND|AS|AUTHORIZATION|BEGIN|CAST|CHECKPOINT|CLASS|CLOSE)\>"
_C7REPOS__color blue "\<(CLUSTER|COLLATION|COMMENT|COMMIT|CONFIGURATION|CONSTRAINTS|CONVERSION|COPY|CREATE)\>"
_C7REPOS__color blue "\<(DATA|DATABASE|DEALLOCATE|DECLARE|DEFAULT|DELETE|DICTIONARY|DISCARD|DO|DOMAIN|DROP)\>"
_C7REPOS__color blue "\<(END|EVENT|EXECUTE|EXPLAIN|EXTENSION|FAMILY|FETCH|FOREIGN|FROM|FUNCTION)\>"
_C7REPOS__color blue "\<(GRANT|GROUP|IF NOT EXISTS|IMMUTABLE|INDEX|INSERT|INTO|LABEL|LANGUAGE|LARGE|LOAD|LOCK)\>"
_C7REPOS__color blue "\<(MAPPING FOR|MATERIALIZED|MOVE|NOTIFY|OBJECT|OPERATOR|OPTIONS|OWNED|OWNER)\>"
_C7REPOS__color blue "\<(PARSER|PREPARED?|PRIVILEGES|REASSIGN|REFRESH|RELEASE|RESET|REVOKE|ROLE|ROLLBACK|RULE)\>"
_C7REPOS__color blue "\<(SAVEPOINT|SCHEMA|SEARCH|SECURITY|SELECT|SEQUENCE|SERVER|SESSION|SET|SHOW|SPACE|START|SYSTEM)\>"
_C7REPOS__color blue "\<(TABLE|TEXT|TO|TRANSACTION|TYPE|UPDATE|USER|VACUUM|VALUES|VIEW|WHERE|WITH|WRAPPER)\>"
_C7REPOS__# Strings.
_C7REPOS__color brightyellow "<[^=       ]*>" ""(\.|[^"])*""
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
_C7REPOS__# Regular expressions.
_C7REPOS__color brightmagenta "/([^/]|(\\/))*/[iomx]*" "%r\{([^}]|(\\}))*\}[iomx]*"
_C7REPOS__# Shell command expansion is in `backticks` or like %x{this}.  These are
_C7REPOS__# "double-quotish" (to use a perlism).
_C7REPOS__color brightblue "`[^`]*`" "%x\{[^}]*\}"
_C7REPOS__# Strings, double-quoted.
_C7REPOS__color green ""([^"]|(\\"))*"" "%[QW]?\{[^}]*\}" "%[QW]?\([^)]*\)" "%[QW]?<[^>]*>"
_C7REPOS__color green "%[QW]?\[[^]]*\]" "%[QW]?\$[^$]*\$" "%[QW]?\^[^^]*\^" "%[QW]?![^!]*!"
_C7REPOS__# Expression substitution.  These go inside double-quoted strings,
_C7REPOS__# "like #{this}".
_C7REPOS__color brightgreen "#\{[^}]*\}"
_C7REPOS__# Strings, single-quoted.
_C7REPOS__color green "'([^']|(\\'))*'" "%[qw]\{[^}]*\}" "%[qw]\([^)]*\)" "%[qw]<[^>]*>"
_C7REPOS__color green "%[qw]\[[^]]*\]" "%[qw]\$[^$]*\$" "%[qw]\^[^^]*\^" "%[qw]![^!]*!"
_C7REPOS__# Comments.
_C7REPOS__color red "#[^{].*$" "#$"
_C7REPOS__color red "--[^{].*$" "#$"
_C7REPOS__color red "##[^{].*$" "##$"
_C7REPOS__color brightblue "//.*"
_C7REPOS__color brightblue start="/\*" end="\*/"
_C7REPOS__# PostgreSQL markings.
_C7REPOS__color red "(--)"
_C7REPOS__# PostgreSQL default schemas.
_C7REPOS__color brightred "(pg_catalog|public)"
_C7REPOS__# PostgreSQL PLs.
_C7REPOS__color brightblue "(pljava|plperlu?|plpgsql|plpy|plpythonu?|plr|plruby|plsh|pltcl|plscheme)"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/postgresql.nanorc failed";
fi
# ============= /usr/share/nano/pov.nanorc ==============
if test -f '/usr/share/nano/pov.nanorc';then
echo " - Skipping /usr/share/nano/pov.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/pov.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/pov.nanorc' &&
_C7REPOS__## Here is an example for POV-Ray.
_C7REPOS__syntax "pov" "\.(pov|POV|povray|POVRAY)$"
_C7REPOS__comment "//"
_C7REPOS__color brightcyan "^[[:space:]]*#[[:space:]]*(declare)"
_C7REPOS__color brightyellow "\<(sphere|cylinder|translate|matrix|rotate|scale)\>"
_C7REPOS__color brightyellow "\<(orthographic|location|up|right|direction|clipped_by)\>"
_C7REPOS__color brightyellow "\<(fog_type|fog_offset|fog_alt|rgb|distance|transform)\>"
_C7REPOS__color brightred "^\<(texture)\>"
_C7REPOS__color brightred "\<(light_source|background)\>"
_C7REPOS__color brightred "\<(fog|object|camera)\>"
_C7REPOS__color green "(\{|\}|\(|\)|\;|\]|\[|`|\\|\$|<|>|!|=|&|\|)"
_C7REPOS__color brightmagenta "\<(union|group|subgroup)\>"
_C7REPOS__# Comments.
_C7REPOS__color brightblue "//.*"
_C7REPOS__color brightblue start="/\*" end="\*/"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/pov.nanorc failed";
fi
# ============= /usr/share/nano/python.nanorc ==============
if test -f '/usr/share/nano/python.nanorc'
then
echo " - Skipping /usr/share/nano/python.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/python.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/python.nanorc' &&
_C7REPOS__## Here is an example for Python.
_C7REPOS__syntax "python" "\.py$"
_C7REPOS__header "^#!.*python[-0-9._]*"
_C7REPOS__linter pyflakes
_C7REPOS__comment "#"
_C7REPOS__# Function definitions.
_C7REPOS__icolor brightblue "def [0-9A-Z_]+"
_C7REPOS__# Keywords.
_C7REPOS__color brightcyan "\<(and|as|assert|break|class|continue|def|del|elif|else|except|exec|finally|for|from)\>"
_C7REPOS__color brightcyan "\<(global|if|import|in|is|lambda|not|or|pass|print|raise|return|try|while|with|yield)\>"
_C7REPOS__# Single-quoted strings.
_C7REPOS__color brightgreen "'([^'\]|\\.)+'"
_C7REPOS__color brightgreen ""([^"\]|\\.)+""
_C7REPOS__# Comments.
_C7REPOS__color brightred "(^|[[:blank:]])#.*$"
_C7REPOS__# Triple-quoted strings.
_C7REPOS__color brightgreen    start="'''[^'),]" end="(^|[^(\])'''"
_C7REPOS__color brightgreen start="\"\"\"[^"),]" end="(^|[^(\])\"\"\""
_C7REPOS__# Reminders.
_C7REPOS__color ,yellow "(FIXME|TODO|XXX)"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/python.nanorc failed";
fi
# ============= /usr/share/nano/ruby.nanorc ==============
if test -f '/usr/share/nano/ruby.nanorc'
then
echo " - Skipping /usr/share/nano/ruby.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/ruby.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/ruby.nanorc' &&
_C7REPOS__## Here is an example for Ruby.
_C7REPOS__syntax "ruby" "\.rb$"
_C7REPOS__header "^#!.*ruby[-0-9._]*"
_C7REPOS__linter ruby -w -c
_C7REPOS__comment "#"
_C7REPOS__# Reserved words.
_C7REPOS__color yellow "\<(BEGIN|END|alias|and|begin|break|case|class|def|defined\?|do|else|elsif|end|ensure|false|for|if|in|module)\>"
_C7REPOS__color yellow "\<(next|nil|not|or|redo|rescue|retry|return|self|super|then|true|undef|unless|until|when|while|yield)\>"
_C7REPOS__# Constants.
_C7REPOS__color brightblue "(\$|@|@@)?\<[A-Z]+[0-9A-Z_a-z]*"
_C7REPOS__# Ruby "symbols".
_C7REPOS__icolor magenta "([ 	]|^):[0-9A-Z_]+\>"
_C7REPOS__# Some unique things we want to stand out.
_C7REPOS__color brightyellow "\<(__FILE__|__LINE__)\>"
_C7REPOS__# Regular expressions.
_C7REPOS__color brightmagenta "/([^/]|(\\/))*/[iomx]*" "%r\{([^}]|(\\}))*\}[iomx]*"
_C7REPOS__# Shell command expansion is in `backticks` or like %x{this}.  These are
_C7REPOS__# "double-quotish" (to use a perlism).
_C7REPOS__color brightblue "`[^`]*`" "%x\{[^}]*\}"
_C7REPOS__# Strings, double-quoted.
_C7REPOS__color green ""([^"]|(\\"))*"" "%[QW]?\{[^}]*\}" "%[QW]?\([^)]*\)" "%[QW]?<[^>]*>" "%[QW]?\[[^]]*\]" "%[QW]?\$[^$]*\$" "%[QW]?\^[^^]*\^" "%[QW]?![^!]*!"
_C7REPOS__# Expression substitution.  These go inside double-quoted strings,
_C7REPOS__# "like #{this}".
_C7REPOS__color brightgreen "#\{[^}]*\}"
_C7REPOS__# Strings, single-quoted.
_C7REPOS__color green "'([^']|(\\'))*'" "%[qw]\{[^}]*\}" "%[qw]\([^)]*\)" "%[qw]<[^>]*>" "%[qw]\[[^]]*\]" "%[qw]\$[^$]*\$" "%[qw]\^[^^]*\^" "%[qw]![^!]*!"
_C7REPOS__# Comments.
_C7REPOS__color cyan "#[^{].*$" "#$"
_C7REPOS__color brightcyan "##[^{].*$" "##$"
_C7REPOS__# "Here" docs.
_C7REPOS__color green start="<<-?'?EOT'?" end="^EOT"
_C7REPOS__# Some common markers.
_C7REPOS__color brightcyan "(XXX|TODO|FIXME|\?\?\?)"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/ruby.nanorc failed";
fi
# ============= /usr/share/nano/rust.nanorc ==============
if test -f '/usr/share/nano/rust.nanorc'
then
echo " - Skipping /usr/share/nano/rust.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/rust.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/rust.nanorc' &&
_C7REPOS__## Syntax highlighting for Rust.
_C7REPOS__## Copyright 2015 Luke Francl.
_C7REPOS__## Licensed under GPL version 3.
_C7REPOS__## NOTE: Rules are applied in order: later rules re-colorize matching text.
_C7REPOS__syntax "rust" "\.rs"
_C7REPOS__comment "//"
_C7REPOS__# Function definitions
_C7REPOS__color magenta "fn [a-z_0-9]+"
_C7REPOS__# Reserved words
_C7REPOS__color yellow "\<(abstract|alignof|as|become|box|break|const|continue|crate|do|else|enum|extern|false|final|fn|for|if|impl|in|let|loop|macro|match|mod|move|mut|offsetof|override|priv|pub|pure|ref|return|sizeof|static|self|struct|super|true|trait|type|typeof|unsafe|unsized|use|virtual|where|while|yield)\>"
_C7REPOS__# Macros
_C7REPOS__color red "[a-z_]+!"
_C7REPOS__# Constants
_C7REPOS__color magenta "[A-Z][A-Z_0-9]+"
_C7REPOS__# Traits/Enums/Structs/Types/...
_C7REPOS__color magenta "[A-Z][A-Za-z0-9]+"
_C7REPOS__# Strings
_C7REPOS__color green "\".*\""
_C7REPOS__color green start="\".*\\$" end=".*\""
_C7REPOS__## NOTE: This isn't accurate, but matching "#{0,} for the end of the string is too liberal.
_C7REPOS__color green start="r#+\"" end="\"#+"
_C7REPOS__# Comments
_C7REPOS__color blue "//.*"
_C7REPOS__color blue start="/\*" end="\*/"
_C7REPOS__# Attributes
_C7REPOS__color magenta start="#!\[" end="\]"
_C7REPOS__# Some common markers
_C7REPOS__color brightcyan "(XXX|TODO|FIXME|\?\?\?)"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/rust.nanorc failed";
fi
# ============= /usr/share/nano/sh.nanorc ==============
if test -f '/usr/share/nano/sh.nanorc'
then
echo " - Skipping /usr/share/nano/sh.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/sh.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/sh.nanorc' &&
_C7REPOS__## Here is an example for Bourne shell scripts.
_C7REPOS__syntax "sh" "\.sh$"
_C7REPOS__header "^#!.*((ba|da|k|pdk)?sh[-0-9_]*|openrc-run|runscript)"
_C7REPOS__magic "(POSIX|Bourne.*) shell script text"
_C7REPOS__linter dash -n
_C7REPOS__comment "#"
_C7REPOS__icolor brightgreen "^[0-9A-Z_]+\(\)"
_C7REPOS__color green "\<(break|case|continue|do|done|elif|else|esac|exit|fi|for|function|if|in|read|return|select|shift|then|time|until|while)\>"
_C7REPOS__color green "\<(declare|eval|exec|export|let|local)\>"
_C7REPOS__color green "[{}():;|`$<>!=&\\]" "(\]|\[)"
_C7REPOS__color green "-[Ldefgruwx]\>"
_C7REPOS__color green "-(eq|ne|gt|lt|ge|le|s|n|z)\>"
_C7REPOS__color brightblue "\<(awk|cat|cd|ch(grp|mod|own)|cp|echo|env|grep|install|ln|make|mkdir|mv|popd|printf|pushd|rm|rmdir|sed|set|tar|touch|umask|unset)\>"
_C7REPOS__# Basic variable names (no braces).
_C7REPOS__color brightred "\$[-0-9@*#?$!]" "\$[[:alpha:]_][[:alnum:]_]*"
_C7REPOS__# More complicated variable names; handles braces and replacements and arrays.
_C7REPOS__color brightred "\$\{[#!]?([-@*#?$!]|[0-9]+|[[:alpha:]_][[:alnum:]_]*)(\[([[:space:]]*[[:alnum:]_]+[[:space:]]*|@)\])?(([#%/]|:?[-=?+])[^}]*\}|\[|\})"
_C7REPOS__# Comments.
_C7REPOS__color cyan "(^|[[:space:]])#.*$"
_C7REPOS__# Strings.
_C7REPOS__color brightyellow ""(\\.|[^"])*"" "'(\\.|[^'])*'"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/sh.nanorc failed";
fi
# ============= /usr/share/nano/spec.nanorc ==============
if test -f '/usr/share/nano/spec.nanorc'
then
echo " - Skipping /usr/share/nano/spec.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/spec.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/spec.nanorc' &&
_C7REPOS__## Syntax highlighting for RPM spec files.
_C7REPOS__syntax "spec" "\.(spec$|spec\.*)"
_C7REPOS__comment "#"
_C7REPOS__# Main tags.
_C7REPOS__color brightblue "((Icon|ExclusiveOs|ExcludeOs)[[:space:]]*:)"
_C7REPOS__color brightblue "((BuildArch|BuildArchitectures|ExclusiveArch|ExcludeArch)[[:space:]]*:)"
_C7REPOS__color brightblue "((Conflicts|Obsoletes|Provides|Requires|Requires\(.*\)|Enhances|Suggests|BuildConflicts|BuildRequires|Recommends|PreReq|Supplements)[[:space:]]*:)"
_C7REPOS__color brightblue "((Epoch|Serial|Nosource|Nopatch)[[:space:]]*:)"
_C7REPOS__color brightblue "((AutoReq|AutoProv|AutoReqProv)[[:space:]]*:)"
_C7REPOS__color brightblue "((Copyright|License|Summary|Summary\(.*\)|Distribution|Vendor|Packager|Group|Source\d*|Patch\d*|BuildRoot|Prefix)[[:space:]]*:)"
_C7REPOS__color brightblue "((Name|Version|Release|Url|URL)[[:space:]]*:)"
_C7REPOS__color brightblue start="^Source" end=":" start="^Patch" end=":"
_C7REPOS__# Architectures.
_C7REPOS__color brightred "(i386|i486|i586|i686|athlon|ia64|alpha|alphaev5|alphaev56|alphapca56|alphaev6|alphaev67|sparc|sparcv9|sparc64armv3l|armv4b|armv4lm|ips|mipsel|ppc|ppc|iseries|ppcpseries|ppc64|m68k|m68kmint|Sgi|rs6000|i370|s390x|s390|noarch)"
_C7REPOS__# Architecture conditionals.
_C7REPOS__color brightred "(ifarch|ifnarch)"
_C7REPOS__# OS conditionals.
_C7REPOS__color brightred "(ifos|ifnos)"
_C7REPOS__# %* strings.
_C7REPOS__color green "%([A-Z_a-z_0-9_]*)"
_C7REPOS__color magenta "%_([A-Z_a-z_0-9_]*)"
_C7REPOS__color yellow start="%__" end="\ "
_C7REPOS__color magenta start="%\{" end="\}"
_C7REPOS__color yellow start="%\{__" end="\}"
_C7REPOS__# Sections.
_C7REPOS__color red "^%(build$|changelog|check$|clean$|description|files|install$|package|pre|prep$|pretrans|preun)"
_C7REPOS__color red "^%(post|posttrans|postun|trigger|triggerin|triggerpostun|triggerun|verifyscript)"
_C7REPOS__# Conditionals and defines.
_C7REPOS__color brightred "%(if|else|endif|define|global|undefine)"
_C7REPOS__# Comments.
_C7REPOS__color cyan "#.*$"
_C7REPOS__# Special case: "# norootforbuild" is handled as main tag.
_C7REPOS__color brightblue "^# norootforbuild"
_C7REPOS__# %changelog date entries.
_C7REPOS__color brightyellow "^\* .*\)$"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/spec.nanorc failed";
fi
# ============= /usr/share/nano/tcl.nanorc ==============
if test -f '/usr/share/nano/tcl.nanorc'
then
echo " - Skipping /usr/share/nano/tcl.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/tcl.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/tcl.nanorc' &&
_C7REPOS__## Syntax highlighting for Tcl files.
_C7REPOS__syntax "tcl" "\.tcl$"
_C7REPOS__comment "#"
_C7REPOS__# Standard Tcl [info commands]:
_C7REPOS__color green "\<(after|append|array|auto_execok|auto_import|auto_load|auto_load_index|auto_qualify|binary|break|case|catch|cd|clock|close|concat|continue|encoding|eof|error|eval|exec|exit|expr|fblocked|fconfigure|fcopy|file|fileevent|flush|for|foreach|format|gets|glob|global|history|if|incr|info|interp|join|lappend|lindex|linsert|list|llength|load|lrange|lreplace|lsearch|lset|lsort|namespace|open|package|pid|puts|pwd|read|regexp|regsub|rename|return|scan|seek|set|socket|source|split|string|subst|switch|tclLog|tell|time|trace|unknown|unset|update|uplevel|upvar|variable|vwait|while)\>"
_C7REPOS__# Basic Tcl subcommands:
_C7REPOS__color green "\<(array anymore|array donesearch|array exists|array get|array names|array nextelement|array set|array size|array startsearch|array statistics|array unset)\>"
_C7REPOS__color green "\<(string bytelength|string compare|string equal|string first|string index|string is|string last|string length|string map|string match|string range|string repeat|string replace|string to|string tolower|string totitle|string toupper|string trim|string trimleft|string trimright|string will|string wordend|string wordstart)\>"
_C7REPOS__# Extended TclX [info commands]:
_C7REPOS__color green "\<(alarm|auto_load_pkg|bsearch|catclose|catgets|catopen|ccollate|cconcat|cequal|chgrp|chmod|chown|chroot|cindex|clength|cmdtrace|commandloop|crange|csubstr|ctoken|ctype|dup|echo|execl|fcntl|flock|fork|fstat|ftruncate|funlock|host_info|id|infox|keyldel|keylget|keylkeys|keylset|kill|lassign|lcontain|lempty|lgets|link|lmatch|loadlibindex|loop|lvarcat|lvarpop|lvarpush|max|min|nice|pipe|profile|random|readdir|replicate|scancontext|scanfile|scanmatch|select|server_accept|server_create|signal|sleep|sync|system|tclx_findinit|tclx_fork|tclx_load_tndxs|tclx_sleep|tclx_system|tclx_wait|times|translit|try_eval|umask|wait)\>"
_C7REPOS__# Syntax:
_C7REPOS__color brightblue "proc[[:space:]]" "(\{|\})"
_C7REPOS__color green "(\(|\)|\;|`|\\|\$|<|>|!|=|&|\|)"
_C7REPOS__color brightyellow ""(\\.|[^"])*"" "'(\\.|[^'])*'"
_C7REPOS__icolor brightred "\$\{?[0-9A-Z_!@#$*?-]+\}?"
_C7REPOS__color ,green "[[:space:]]+$"
_C7REPOS__color ,magenta "^[[:space:]]*#.*"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/tcl.nanorc failed";
fi
# ============= /usr/share/nano/texinfo.nanorc ==============
if test -f '/usr/share/nano/texinfo.nanorc'
then
echo " - Skipping /usr/share/nano/texinfo.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/texinfo.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/texinfo.nanorc' &&
_C7REPOS__## Here is an example for Texinfo files.
_C7REPOS__syntax "texinfo" "\.texi$"
_C7REPOS__header "^\\input texinfo"
_C7REPOS__magic "Texinfo source text"
_C7REPOS__comment "@c "
_C7REPOS__# Command arguments, trailing and enclosed.
_C7REPOS__color cyan "^@[a-z]+[[:space:]]+.*$"
_C7REPOS__color brightmagenta "@[a-z]+\{[^}]*\}"
_C7REPOS__# Commands themselves.
_C7REPOS__color yellow "@[a-z]+\{?" "\}"
_C7REPOS__# Menu items.
_C7REPOS__color brightred "^\*[[:space:]]+.*::.*$"
_C7REPOS__# Comments.
_C7REPOS__color green "@c[[:space:]]+.*$"
_C7REPOS__# Trailing whitespace.
_C7REPOS__color ,green "[[:space:]]+$"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/texinfo.nanorc failed";
fi
# ============= /usr/share/nano/tex.nanorc ==============
if test -f '/usr/share/nano/tex.nanorc'
then
echo " - Skipping /usr/share/nano/tex.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/tex.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/tex.nanorc' &&
_C7REPOS__## Here is a short example for TeX files.
_C7REPOS__syntax "tex" "\.tex$"
_C7REPOS__linter chktex -v0 -q -I
_C7REPOS__comment "%"
_C7REPOS__icolor green "\\.|\\[A-Z]*"
_C7REPOS__color magenta "[{}]"
_C7REPOS__color blue "(^|[^\])%.*"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/tex.nanorc failed";
fi
# ============= /usr/share/nano/xml.nanorc ==============
if test -f '/usr/share/nano/xml.nanorc'
then
echo " - Skipping /usr/share/nano/xml.nanorc (file exists)"
else
echo " - Extracting /usr/share/nano/xml.nanorc"
  sed 's/^_C7REPOS__//' << 'C7REPOS_SHAR' > '/usr/share/nano/xml.nanorc' &&
_C7REPOS__## Here is an example for XML files.
_C7REPOS__syntax "xml" "\.([jrsx]html?|jnlp|mml|pom|rng|sgml?|svg|w[as]dl|wsdd|xjb|xml|xs(d|lt?)|xul)$"
_C7REPOS__header "<\?xml.*version=.*\?>"
_C7REPOS__magic "(XML|SGML) (sub)?document text"
_C7REPOS__comment "<!--|-->"
_C7REPOS__# The entire content of the tag:
_C7REPOS__color green  start="<" end=">"
_C7REPOS__# The start and the end of the tag:
_C7REPOS__color cyan   "<[^> ]+" ">"
_C7REPOS__# The strings inside the tag:
_C7REPOS__color magenta "\"[^"]*\""
_C7REPOS__# Comments:
_C7REPOS__color yellow start="<!DOCTYPE" end="[/]?>"
_C7REPOS__color yellow start="<!--" end="-->"
_C7REPOS__# Escapes:
_C7REPOS__color red    "&[^;]*;"
C7REPOS_SHAR
:
[[ $? -ne 0 ]] && echo "restore of /usr/share/nano/xml.nanorc failed";
fi
rm -fr ${lock_dir}; exit 0