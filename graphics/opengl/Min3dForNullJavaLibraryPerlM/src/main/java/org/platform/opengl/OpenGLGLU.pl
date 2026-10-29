# Generated Code Do Not Modify

package org::platform::opengl::OpenGLGLU;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::platform::opengl::OpenGLGLU'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::platform::opengl::OpenGLGLU::instance;
}


sub gluLookAt {
    my ($self, $gl, $eyeX, $eyeY, $eyeZ, $centerX, $centerY, $centerZ, $upX, $upY, $upZ) = @_;
        die ("RuntimeException");
}


sub gluProject {
    my ($self, $gl, $objX, $objY, $objZ, $model, $modelOffset, $project, $projectOffset, $view, $viewOffset, $win, $winOffset) = @_;
        die ("RuntimeException");
}


sub gluUnProject {
    my ($self, $gl, $winX, $winY, $winZ, $model, $modelOffset, $project, $projectOffset, $view, $viewOffset, $obj, $objOffset) = @_;
        die ("RuntimeException");
}


sub glFrustumf {
    my ($self, $gl, $lt, $rt, $btm, $top, $zNear, $zFar) = @_;
        die ("RuntimeException");
}

# use javax::microedition::khronos::opengles::GL10;

1;

