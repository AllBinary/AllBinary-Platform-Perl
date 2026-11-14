# Generated Code Do Not Modify

package org::allbinary::device::OpenGLESGraphicsFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getOpenGLESGraphicsInstance {
    my ($self) = @_;
        return 'org::allbinary::device::OpenGLESNullGraphicsFactory'->getInstance();
}

use java::lang::Object ();
use org::allbinary::device::OpenGLESNullGraphicsFactory ();

1;

