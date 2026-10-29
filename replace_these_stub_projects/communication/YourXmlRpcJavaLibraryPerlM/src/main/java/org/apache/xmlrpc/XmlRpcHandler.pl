# Generated Code Do Not Modify

# Java interface
package org::apache::xmlrpc::XmlRpcHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub execute {
    my ($self, $method, $params) = @_;
    die "abstract method execute";
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

