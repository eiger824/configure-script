#
# Filename:			configure
#
# Author:			Santiago Pagola <santipagola@gmail.com>
# Brief:			Generic GNU-Compliant configure script to be used in Makefile-based
#                   projects.
#                   For more information about the configure script format, visit
#                   https://www.gnu.org/prep/standards/html_node/Configuration.html
# Last modified:	sön 30 dec 2018 08:44:52 CET
#

#!/bin/bash

reeval_paths()
{
    exec_prefix=${prefix}
    bindir=${exec_prefix}/bin
    sbindir=${exec_prefix}/sbin
    libexecdir=${exec_prefix}/libexec
    sysconfdir=${prefix}/etc
    sharedstatedir=${prefix}/com
    localstatedir=${prefix}/var
    runstatedir=${localstatedir}/run
    libdir=${exec_prefix}/lib
    includedir=${prefix}/include
    oldincludedir=/usr/include
    datarootdir=${prefix}/share
    datadir=${datarootdir}
    infodir=${datarootdir}/info
    localedir=${datarootdir}/locale
    mandir=${datarootdir}/man
    docdir=${datarootdir}/doc/${package_name}
    htmldir=${docdir}
    dvidir=${docdir}
    pdfdir=${docdir}
    psdir=${docdir}
}

configure_usage()
{
    cat << EOF
Usage: $(basename $0) [OPTIONS [DIRECTORY_VARIABLES]]

NOTE: All argument must be passed in the form --foo=bar, with no
      whitespaces in between the keys, values and the assignment
      (=) character.

OPTIONS:
 -h|--help              Print this help and exit
 --prefix               Install to prefix. Defaults to /usr/local.
 --srcdir               Directory where sources are found. Defaults to
                        the current directory (.) and the parent directory (..) 

DIRECTORY VARIABLES:
 --exec-prefix
 --bindir
 --sbindir
 --libexecdir
 --sysconfdir
 --sharedstatedir
 --localstatedir
 --runstatedir
 --libdir
 --includedir
 --oldincludedir
 --datarootdir
 --datadir
 --infodir
 --localedir
 --mandir
 --docdir
 --htmldir
 --dvidir
 --pdfdir
 --psdir
EOF
}

parse_opt()
{
    local -n str="$1"
    if ! \grep '=' <<< "$str" &> /dev/null; then
        return 1
    fi
    str=$(echo $str | cut -d= -f2)
    if [[ -z "$str" ]]; then
        return 1
    else
        return 0
    fi
}

parse_opt_key()
{
    local str="$1"
    echo $str | cut -d= -f1
}

die()
{
    echo "$@" >&2
    configure_usage
    exit 1
}

# The configure script should write a file named config.status
# which describes which configuration options were specified when
# the program was last configured. This file should be a shell
# script which, if run, will recreate the same configuration.
config_out_file="config.status"

# The configure script should accept an option of the form
# ‘--srcdir=dirname’ to specify the directory where sources are
# found (if it is not the current directory). This makes it
# possible to build the program in a separate directory, so that
# the actual source directory is not modified.
# If the user does not specify ‘--srcdir’, then configure should
# check both . and .. to see if it can find the sources. If it
# finds the sources in one of these places, it should use them
# from there. Otherwise, it should report that it cannot find the
# sources, and should exit with nonzero status. 
srcdirs=". .."

# The name of the package this configure script is working on
package_name="foo"

# In addition, the ‘configure’ script should take options corresponding
# to most of the standard directory variables. Default values stated
# here
prefix=/usr/local
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
sbindir=${exec_prefix}/sbin
libexecdir=${exec_prefix}/libexec
sysconfdir=${prefix}/etc
sharedstatedir=${prefix}/com
localstatedir=${prefix}/var
runstatedir=${localstatedir}/run
libdir=${exec_prefix}/lib
includedir=${prefix}/include
oldincludedir=/usr/include
datarootdir=${prefix}/share
datadir=${datarootdir}
infodir=${datarootdir}/info
localedir=${datarootdir}/locale
mandir=${datarootdir}/man
docdir=${datarootdir}/doc/${package_name}
htmldir=${docdir}
dvidir=${docdir}
pdfdir=${docdir}
psdir=${docdir}


while [ $# -gt 0 ]; do 
    case ${1} in
        -h|--help)
            configure_usage
            exit 0
            ;;
        --srcdir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                # Expand in case this option is given more than once
                srcdir="${srcdir} ${arg}"
            fi
            ;;
        --prefix*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                prefix="${arg}"
            fi
            ;;
        --exec-prefix*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                exec_prefix="${arg}"
            fi
            ;;
        --bindir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                bindir="${arg}"
            fi
            ;;
        --sbindir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                sbindir="${arg}"
            fi
            ;;
        --libexecdir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                libexecdir="${arg}"
            fi
            ;;
        --sysconfdir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                sysconfdir="${arg}"
            fi
            ;;
        --sharedstatedir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                sharedstatedir="${arg}"
            fi
            ;;
        --localstatedir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                localstatedir="${arg}"
            fi
            ;;
        --runstatedir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                runstatedir="${arg}"
            fi
            ;;
        --libdir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                libdir="${arg}"
            fi
            ;;
        --includedir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                includedir="${arg}"
            fi
            ;;
        --oldincludedir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                oldincludedir="${arg}"
            fi
            ;;
        --datarootdir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                datarootdir="${arg}"
            fi
            ;;
        --datadir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                datadir="${arg}"
            fi
            ;;
        --infodir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                infodir="${arg}"
            fi
            ;;
        --localedir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                localedir="${arg}"
            fi
            ;;
        --mandir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                mandir="${arg}"
            fi
            ;;
        --docdir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                docdir="${arg}"
            fi
            ;;
        --htmldir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                htmldir="${arg}"
            fi
            ;;
        --dvidir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                dvidir="${arg}"
            fi
            ;;
        --pdfdir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                pdfdir="${arg}"
            fi
            ;;
        --psdir*)
            arg="$1"
            if ! parse_opt arg; then
                die "Option $(parse_opt_key "$1") requires an argument"
            else
                psdir="${arg}"
            fi
            ;;
        *)
            echo "Unknown switch \"$1\"" >&2
            configure_usage
            exit 1
            ;;
    esac
    shift
done

# If srcdir is empty, look at the default directories
# TODO: clarify what is really meant with sources
if [[ -z "$srcdir" ]]; then
    for dir in $srcdirs; do
        if find $dir -type f -name "*.c" &> /dev/null; then
            srcdir="$dir"
            break
        fi
    done
fi

reeval_paths

# Set these values in the output file 
cat > $config_out_file << EOF
# Autogenerated file, will be overwritten next time the configure script 
# is called. Generated on: $(date -R)
prefix=${prefix}
VPATH=${srcdir}
exec_prefix=${prefix}
bindir=${bindir}
sbindir=${sbindir}
libexecdir=${libexecdir}
sysconfdir=${sysconfdir}
sharedstatedir=${sharedstatedir}
localstatedir=${localstatedir}
runstatedir=${runstatedir}
libdir=${libdir}
includedir=${includedir}
oldincludedir=${oldincludedir}
datarootdir=${datarootdir}
datadir=${datadir}
infodir=${infodir}
localedir=${localedir}
mandir=${mandir}
docdir=${docdir}
htmldir=${htmldir}
dvidir=${dvidir}
pdfdir=${pdfdir}
psdir=${psdir}
EOF

echo "Configuration done!"
