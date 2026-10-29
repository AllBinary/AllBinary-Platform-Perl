# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::image::opengles::OpenGLESDeviceImageTranslate;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::image::opengles::OpenGLESImageTranslate';


sub _init_fields {
    my ($self) = @_;
    $self->{translateX} = 0.0;
    $self->{translateY} = 0.0;
    $self->{translateX2} = 0.0;
    $self->{translateY2} = 0.0;
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub translate {
    my ($self, $gl, $openGLESImage, $x, $y) = @_;
        $openGLESImage->{imageProcessor}->translate($gl, $self->{translateX} + ($openGLESImage->{openGLESImageProperties}->{scaleX} * $x), $self->{translateY} + ($openGLESImage->{openGLESImageProperties}->{scaleY} * $y));
}


sub translate2 {
    my ($self, $gl, $openGLESImage) = @_;
        $openGLESImage->{imageProcessor}->translate($gl, $self->{translateX2}, $self->{translateY2});
}

# use javax::microedition::khronos::opengles::GL10;
use org::allbinary::image::opengles::OpenGLESImageTranslate;

1;

