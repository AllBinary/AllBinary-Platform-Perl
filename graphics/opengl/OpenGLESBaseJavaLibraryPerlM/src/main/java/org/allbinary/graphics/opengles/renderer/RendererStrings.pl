# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::graphics::opengles::renderer::RendererStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::opengles::renderer::RendererStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{ON_SURFACE_CREATED} = "onSurfaceCreated";
    $self->{ON_SURFACE_CHANGED} = "onSurfaceChanged";
    $self->{ON_DRAW_FRAME} = "onDrawFrame";
    $self->{ON_DRAW_FRAME_THREED} = "onDrawFrameThreed";
    $self->{ON_DRAW_FRAME_2D} = "onDrawFrame2d";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::renderer::RendererStrings::instance;
}


1;

