# Generated Code Do Not Modify

package org::allbinary::device::OpenGLESGraphicsFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getOpenGLESGraphicsInstance {
    my ($self) = @_;
        return 'org::allbinary::device::OpenGLESNullGraphicsFactory'->getInstance();
}

use org::allbinary::device::OpenGLESNullGraphicsFactory;

1;

