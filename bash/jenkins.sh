#!/usr/bin/perl -w
#
# Bernhard M. Wiedemann <bwiedemann@suse.de>
#
# A simple redirect tool to circumvent the SSL and passwords of OBS api
#
# Usage:
#   http://clouddata.cloud.suse.de/cgi-bin/apicheck/<apiurl>/<api-request>


use strict;
use CGI ":standard";

print header("text/xml");
my $p=$ENV{PATH_INFO};
$p =~ s#^/##;
my ($USER, $PASSWORD);
eval `cat /etc/apicheck.cred`;

exec "curl", "--insecure", "https://$USER:$PASSWORD\@$p";
