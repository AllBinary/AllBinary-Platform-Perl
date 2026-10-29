# Generated Code Do Not Modify

package org::allbinary::image::opengles::OpenGLStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::image::opengles::OpenGLStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{GL_ERROR_LABEL} = "GLError: ";
    $self->{SET} = "set(GL10)";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::image::opengles::OpenGLStrings::instance;
}


1;

