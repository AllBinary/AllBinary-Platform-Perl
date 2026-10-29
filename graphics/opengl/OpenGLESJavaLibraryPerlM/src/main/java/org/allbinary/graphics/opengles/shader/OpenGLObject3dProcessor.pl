# Generated Code Do Not Modify

package org::allbinary::graphics::opengles::shader::OpenGLObject3dProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub process {
    my ($self, $gl, $object3d) = @_;
}


# Java overloaded method: Perl keeps the last definition
sub process {
    my ($self, $gl, $object3d, $index) = @_;
}

# use javax::microedition::khronos::opengles::GL10;
use org::allbinary::string::CommonStrings;

1;

