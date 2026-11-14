# Generated Code Do Not Modify

package org::allbinary::graph::E;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $e, 'java::lang::LazyStatic', sub { 'org::allbinary::graph::E'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub newInstance {
    my ($self) = @_;
        return $org::allbinary::graph::E::e;
}

use java::lang::Object ();
use java::lang::LazyStatic ();

1;

