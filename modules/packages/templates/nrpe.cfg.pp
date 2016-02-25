#############################################################################
# Sample NRPE Config File 
# Written by: Ethan Galstad (nagios@nagios.org)
# 
# Last Modified: 11-23-2007
#
# NOTES:
# This is a sample configuration file for the NRPE daemon.  It needs to be
# located on the remote host that is running the NRPE daemon, not the host
# from which the check_nrpe client is being executed.
#############################################################################


# LOG FACILITY
# The syslog facility that should be used for logging purposes.

log_facility=daemon



# PID FILE
# The name of the file in which the NRPE daemon should write it's process ID
# number.  The file is only written if the NRPE daemon is started by the root
# user and is running in standalone mode.

pid_file=/var/run/nagios/nrpe.pid



# PORT NUMBER
# Port number we should wait for connections on.
# NOTE: This must be a non-priviledged port (i.e. > 1024).
# NOTE: This option is ignored if NRPE is running under either inetd or xinetd

server_port=5666



# SERVER ADDRESS
# Address that nrpe should bind to in case there are more than one interface
# and you do not want nrpe to bind on all interfaces.
# NOTE: This option is ignored if NRPE is running under either inetd or xinetd

#server_address=127.0.0.1



# NRPE USER
# This determines the effective user that the NRPE daemon should run as.  
# You can either supply a username or a UID.
# 
# NOTE: This option is ignored if NRPE is running under either inetd or xinetd

nrpe_user=nagios



# NRPE GROUP
# This determines the effective group that the NRPE daemon should run as.  
# You can either supply a group name or a GID.
# 
# NOTE: This option is ignored if NRPE is running under either inetd or xinetd

nrpe_group=nagios



# ALLOWED HOST ADDRESSES
# This is an optional comma-delimited list of IP address or hostnames 
# that are allowed to talk to the NRPE daemon.
#
# Note: The daemon only does rudimentary checking of the client's IP
# address.  I would highly recommend adding entries in your /etc/hosts.allow
# file to allow only the specified host to connect to the port
# you are running this daemon on.
#
# NOTE: This option is ignored if NRPE is running under either inetd or xinetd

allowed_hosts=<%= @icinga %>,127.0.0.1

# COMMAND ARGUMENT PROCESSING
# This option determines whether or not the NRPE daemon will allow clients
# to specify arguments to commands that are executed.  This option only works
# if the daemon was configured with the --enable-command-args configure script
# option.  
#
# *** ENABLING THIS OPTION IS A SECURITY RISK! *** 
# Read the SECURITY file for information on some of the security implications
# of enabling this variable.
#
# Values: 0=do not allow arguments, 1=allow command arguments

dont_blame_nrpe=0



# COMMAND PREFIX
# This option allows you to prefix all commands with a user-defined string.
# A space is automatically added between the specified prefix string and the
# command line from the command definition.
#
# *** THIS EXAMPLE MAY POSE A POTENTIAL SECURITY RISK, SO USE WITH CAUTION! ***
# Usage scenario: 
# Execute restricted commmands using sudo.  For this to work, you need to add
# the nagios user to your /etc/sudoers.  An example entry for alllowing 
# execution of the plugins from might be:
#
# nagios          ALL=(ALL) NOPASSWD: /usr/lib/nagios/plugins/
#
# This lets the nagios user run all commands in that directory (and only them)
# without asking for a password.  If you do this, make sure you don't give
# random users write access to that directory or its contents!

command_prefix=/usr/bin/sudo 



# DEBUGGING OPTION
# This option determines whether or not debugging messages are logged to the
# syslog facility.
# Values: 0=debugging off, 1=debugging on

debug=0



# COMMAND TIMEOUT
# This specifies the maximum number of seconds that the NRPE daemon will
# allow plugins to finish executing before killing them off.

command_timeout=60



# CONNECTION TIMEOUT
# This specifies the maximum number of seconds that the NRPE daemon will
# wait for a connection to be established before exiting. This is sometimes
# seen where a network problem stops the SSL being established even though
# all network sessions are connected. This causes the nrpe daemons to
# accumulate, eating system resources. Do not set this too low.

connection_timeout=300



# WEEK RANDOM SEED OPTION
# This directive allows you to use SSL even if your system does not have
# a /dev/random or /dev/urandom (on purpose or because the necessary patches
# were not applied). The random number generator will be seeded from a file
# which is either a file pointed to by the environment valiable $RANDFILE
# or $HOME/.rnd. If neither exists, the pseudo random number generator will
# be initialized and a warning will be issued.
# Values: 0=only seed from /dev/[u]random, 1=also seed from weak randomness

#allow_weak_random_seed=1



# INCLUDE CONFIG FILE
# This directive allows you to include definitions from an external config file.

#include=<somefile.cfg>



# INCLUDE CONFIG DIRECTORY
# This directive allows you to include definitions from config files (with a
# .cfg extension) in one or more directories (with recursion).

#include_dir=<somedirectory>
#include_dir=<someotherdirectory>



# COMMAND DEFINITIONS
# Command definitions that this daemon will run.  Definitions
# are in the following format:
#
# command[<command_name>]=<command_line>
#
# When the daemon receives a request to return the results of <command_name>
# it will execute the command specified by the <command_line> argument.
#
# Unlike Nagios, the command line cannot contain macros - it must be
# typed exactly as it should be executed.
#
# Note: Any plugins that are used in the command lines must reside
# on the machine that this daemon is running on!  The examples below
# assume that you have plugins installed in a /usr/local/nagios/libexec
# directory.  Also note that you will have to modify the definitions below
# to match the argument format the plugins expect.  Remember, these are
# examples only!


# The following examples use hardcoded command arguments...

# check basic stuff on all hosts
<%- if @role0 == "datanode" or @role0 == "namenode" -%>
command[check_load]=/usr/lib/nagios/plugins/check_load -w 25,22,20 -c 35,32,30
<%- else -%>
command[check_load]=/usr/lib/nagios/plugins/check_load -w 15,10,5 -c 30,25,20
<%- end -%>

<%- if @role0 == "analysis" or @role1 == "analysis" -%>
command[check_users]=/usr/lib/nagios/plugins/check_users -w 15 -c 18
<%- else -%>
command[check_users]=/usr/lib/nagios/plugins/check_users -w 5 -c 10
<%- end -%>
command[check_boot_disk]=/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -p /dev/xvda1
command[check_zombie_procs]=/usr/lib/nagios/plugins/check_procs -w 5 -c 10 -s Z
command[check_total_procs]=/usr/lib/nagios/plugins/check_procs -w 150 -c 200 
command[check_ntp_time]=/usr/lib/nagios/plugins/check_ntp_time -H localhost -w 0.5 -c 1 
command[check_puppet_agent]=/usr/lib/nagios/plugins/check_puppet_agent -w 3600 -c 7200 -s /var/lib/puppet/state/last_run_summary.yaml -d 0

# check hdfs
command[check_datanode_xcf]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 50010 -w 1 -c 10 
command[check_datanode_ipc]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 50020 -w 1 -c 10 
command[check_datanode_http]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 50075 -w 1 -c 10 

command[check_namenode_ipc]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 8020 -w 1 -c 10 
command[check_namenode_http]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 50070 -w 1 -c 10 
command[check_zkfc]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 8019 -w 1 -c 10 
command[check_zookeeper]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 2181 -w 1 -c 10 
command[check_journalnode]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 8485 -w 1 -c 10 

# check job history
command[check_jobhistory_ipc]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 10020 -w 1 -c 10 
command[check_jobhistory_http]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 19888 -w 1 -c 10 

# check map reduce
command[check_tasktracker_http]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 50060 -w 1 -c 10 
command[check_jobtracker_ipc]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 8021 -w 1 -c 10 
command[check_jobtracker_http]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 50030 -w 1 -c 10 

# check yarn
command[check_nodemanager_ipc]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 8040 -w 1 -c 10 
command[check_nodemanager_http]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 8042 -w 1 -c 10 
command[check_resourcemanager_sched]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 8030 -w 1 -c 10 
command[check_resourcemanager_ipc]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 8032 -w 1 -c 10 
command[check_resourcemanager_http]=/usr/lib/nagios/plugins/check_tcp -H <%= @fqdn %> -p 8088 -w 1 -c 10 

# check mongodb
command[check_mongodb_connect]=/usr/lib/nagios/plugins/check_mongodb.py -H <%= @fqdn %> -A connect -P 27018 -W 1 -C 5
command[check_mongodb_connections]=/usr/lib/nagios/plugins/check_mongodb.py -H <%= @fqdn %> -A connections -P 27018 -W 70 -C 80
command[check_mongodb_memory]=/usr/lib/nagios/plugins/check_mongodb.py -H <%= @fqdn %> -A memory -P 27018 -W 20 -C 28
command[check_mongodb_mapped_memory]=/usr/lib/nagios/plugins/check_mongodb.py -H <%= @fqdn %> -A memory_mapped -P 27018 -W 20 -C 28
command[check_mongodb_lock]=/usr/lib/nagios/plugins/check_mongodb.py -H <%= @fqdn %> -A lock -P 27018 -W 70 -C 80
command[check_mongodb_flush]=/usr/lib/nagios/plugins/check_mongodb.py -H <%= @fqdn %> -A flushing -P 27018 -W 100 -C 200
command[check_mongodb_index_miss]=/usr/lib/nagios/plugins/check_mongodb.py -H <%= @fqdn %> -A index_miss_ratio -P 27018 -W .005 -C 0.01

# check importer servers
command[check_sprint_ftp]=/usr/lib/nagios/plugins/check_ftp -H 10.255.240.10 -p 21
command[check_jsvc_process]=/usr/lib/nagios/plugins/check_procs -C jsvc -c 2:2

# check flume servers
command[check_flume_process]=/usr/lib/nagios/plugins/check_procs -C java -c 1:1

# check hadoop
command[check_hadoop_datanodes]=/usr/lib/nagios/plugins/check_hadoop-datanodes.sh -w 35 -c 30
command[check_hadoop_deadnodes]=/usr/lib/nagios/plugins/check_hadoop-deadnodes.sh -w 9 -c 10
command[check_hadoop_dfs]=/usr/lib/nagios/plugins/check_hadoop-dfs.sh -w 80 -c 90

# The following examples allow user-supplied arguments and can
# only be used if the NRPE daemon was compiled with support for 
# command arguments *AND* the dont_blame_nrpe directive in this
# config file is set to '1'.  This poses a potential security risk, so
# make sure you read the SECURITY file before doing this.

#command[check_users]=/usr/lib/nagios/plugins/check_users -w $ARG1$ -c $ARG2$
#command[check_load]=/usr/lib/nagios/plugins/check_load -w $ARG1$ -c $ARG2$
#command[check_disk]=/usr/lib/nagios/plugins/check_disk -w $ARG1$ -c $ARG2$ -p $ARG3$
#command[check_procs]=/usr/lib/nagios/plugins/check_procs -w $ARG1$ -c $ARG2$ -s $ARG3$

#
# local configuration:
#	if you'd prefer, you can instead place directives here
include=/etc/nagios/nrpe_local.cfg

# 
# you can place your config snipplets into nrpe.d/
# only snipplets ending in .cfg will get included
include_dir=/etc/nagios/nrpe.d/


