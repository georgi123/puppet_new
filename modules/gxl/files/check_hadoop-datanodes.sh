#!/bin/sh
PROGNAME=`basename $0`
VERSION="Version 2.0,"
AUTHOR="2009, Mike Adolphs (http://www.matejunkie.com/)"
AUTHOR="2013, Florian Baumann (http://noqqe.de)"

ST_OK=0
ST_WR=1
ST_CR=2
ST_UK=3


print_version() {
    echo "$VERSION $AUTHOR"
}

print_help() {
    print_version $PROGNAME $VERSION
    echo ""
    echo "$PROGNAME is a Icinga plugin to check the status of HDFS, Hadoop's"
	echo "underlying, redundant, distributed file system."
    echo ""
    echo "$PROGNAME -w 10 -c 5"
    echo ""
    echo "Options:"
	echo "  -w|--warning)"
	echo "     Defines the warning level for available nodes"
	echo "  -c|--critical)"
	echo "     Defines the critical level for available nodes"
    exit $ST_UK
}

while test -n "$1"; do
    case "$1" in
        --help|-h)
            print_help
            exit $ST_UK
            ;;
        --version|-v)
            print_version $PROGNAME $VERSION
            exit $ST_UK
            ;;
        --warning|-w)
            warning=$2
            shift
            ;;
        --critical|-c)
            critical=$2
            shift
            ;;
        *)
            echo "Unknown argument: $1"
            print_help
            exit $ST_UK
            ;;
        esac
    shift
done

check_sanity() {
    if [ -n "$warning" -a -n "$critical" ]; then
        if [ ${warning} -lt ${critical} ]; then
            echo "ERR: Confusing warning and critical values" 
            exit $ST_UK
        fi
    else
        echo "ERR: Missing value, see --help"
        exit $ST_UK
    fi

    if [ ! -x "$(which hdfs)" ]; then
        echo "ERR: hdfs not installed"
        exit $ST_UK
    fi
}

get_vals() {
    tmp_vals=`sudo /usr/lib/nagios/plugins/genhdfsreport.sh '-live' 2>/dev/null`
    dn_avail=`echo -e "$tmp_vals" | grep -m1 "Live" | awk '{print $3}' | sed 's/[():]//g'`

    tmp_vals=`sudo /usr/lib/nagios/plugins/genhdfsreport.sh '-decommissioning' 2>/dev/null`
    dn_decommissioning=`echo -e "$tmp_vals" | grep -m1 "Decommission" | awk '{print $3}'  | sed 's/[():]//g'`

    tmp_vals=`sudo /usr/lib/nagios/plugins/genhdfsreport.sh '-dead' 2>/dev/null`
    dn_dead=`echo -e "$tmp_vals" | grep -m1 "Dead" | awk '{print $3}'  | sed 's/[():]//g'`

}

do_output() {
	output="Nodes love: ${dn_avail}, Nodes decommissioning: ${dn_decommissioning}, Nodes dead: ${dn_dead}"
}

do_perfdata() {
	perfdata="'dn_avail'=${dn_avail} 'dn_decommissioning'=${dn_decommissioning} 'dn_dead'=${dn_dead}"
}

# Runtime
check_sanity
get_vals

do_output
do_perfdata

# Nagios plugin data
if [ -n "$warning" -a -n "$critical" ] ; then
    if [ "$dn_avail" -le "$warning" -a "$dn_avail" -gt "$critical" ] ; then
        echo "WARNING - ${output} | ${perfdata}"
	exit $ST_WR
    elif [ "$dn_avail" -le "$critical" ]; then
        echo "CRITICAL - ${output} | ${perfdata}"
	exit $ST_CR
    else
        echo "OK - ${output} | ${perfdata} "
	exit $ST_OK
    fi
else
    echo "OK - ${output} | ${perfdata}"
    exit $ST_OK
fi
