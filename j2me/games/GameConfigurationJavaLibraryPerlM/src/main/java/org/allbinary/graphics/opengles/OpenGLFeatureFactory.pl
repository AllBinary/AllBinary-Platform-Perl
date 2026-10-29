#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{OPENGL_OPTIONS} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("OpenGL Options");
    $self->{OPENGL} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("OpenGL");
    $self->{OPENGL_SURFACE_VIEW} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("GLSurfaceView");
    $self->{OPENGL_2D} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("OpenGL 2D");
    $self->{OPENGL_3D} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("OpenGL 3D");
    $self->{OPENGL_2D_AND_3D} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("OpenGL 2D/3D");
    $self->{OPENGL_AUTO_SELECT} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("Auto Select");
    $self->{OPENGL_MINIMUM} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("Minimum");
    $self->{OPENGL_AS_GAME_THREAD} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("As game thread");
    $self->{OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("As different threads");
    $self->{IMAGE_COLOR_DEPTH_4444} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("4444");
    $self->{IMAGE_COLOR_DEPTH_8888} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("8888");
    $self->{IMAGE_COLOR_DEPTH_565} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("565");
    $self->{OPENGL_COLOR_DEPTH_4444} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("4444");
    $self->{OPENGL_COLOR_DEPTH_8888} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("8888");
    $self->{OPENGL_COLOR_DEPTH_565} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("565");
    $self->{OPENGL_DRAW_TEXTURE} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("GL_OES_draw_texture");
    $self->{OPENGL_VERTEX_BUFFER_OBJECT} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("vertex_buffer_object");
    $self->{OPENGL_SIMPLE_OBJECT3D_PROCESSOR} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("Simple Object3d Processor");
    $self->{OPENGL_COMPLEX_OBJECT3D_PROCESSOR} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("Complex Object3d Processor");
    $self->{OPENGL_SIMPLE_TEXTURE_PROCESSOR} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("Simple Texture Processor");
    $self->{OPENGL_COMPLEX_TEXTURE_PROCESSOR} = 'org::allbinary::graphics::opengles::OpenGLFeature'->new("Complex Texture Processor");
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::OpenGLFeatureFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}

use org::allbinary::graphics::opengles::OpenGLFeature;

1;

