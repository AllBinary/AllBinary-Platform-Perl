# Generated Code Do Not Modify

package org::platform::opengl::OpenGLTextureFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::platform::opengles::PlatformTextureBaseFactory';

our $instance = 'org::platform::opengl::OpenGLTextureFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{gluUtils} = 'org::platform::opengl::OpenGLGLUUtils'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::platform::opengl::OpenGLTextureFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub load {
    my ($self, $gl, $target, $level, $image, $border, $flip) = @_;
        die ("RuntimeException");
}

# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Image;
use org::allbinary::platform::opengles::PlatformTextureBaseFactory;
use org::platform::opengl::OpenGLGLUUtils;

1;

