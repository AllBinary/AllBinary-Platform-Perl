# Generated Code Do Not Modify

package org::allbinary::image::opengles::OpenGLStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::image::opengles::OpenGLStrings'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{GL_ERROR_LABEL} = "GLError: ";
    $self->{SET} = "set(GL10)";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::image::opengles::OpenGLStrings::instance;
}

use java::lang::Object ();
use java::lang::LazyStatic ();

1;

