# Generated Code Do Not Modify

package org::allbinary::device::OpenGLESNullGraphicsFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::device::OpenGLESGraphics'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::device::OpenGLESNullGraphicsFactory::instance;
}

use org::allbinary::device::OpenGLESGraphics;

1;

