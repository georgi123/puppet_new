include '::hosts'
include '::hosts::hosts'
include '::hosts::other'
include '::hosts::nurago'
include '::puppet'

node default {
    include snow_xclient    
    include sshkeys
    include packages
    include ssh_confd
}

import 'nodes.pp'

