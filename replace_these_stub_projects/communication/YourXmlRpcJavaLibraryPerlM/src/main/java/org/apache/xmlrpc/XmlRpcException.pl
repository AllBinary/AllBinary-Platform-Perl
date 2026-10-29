# Generated Code Do Not Modify

package org::apache::xmlrpc::XmlRpcException;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'Exception';



sub new {
    my ($class, $code, $message) = @_;
    my $self = $class->SUPER::new($message);
        # super(...) made $self above
    return $self;
}


1;

