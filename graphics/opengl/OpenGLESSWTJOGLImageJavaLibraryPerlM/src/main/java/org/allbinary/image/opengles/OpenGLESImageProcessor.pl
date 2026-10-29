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

package org::allbinary::image::opengles::OpenGLESImageProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::image::opengles::OpenGLESImageProcessor'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::image::opengles::OpenGLESImageProcessor::instance;
}


sub translate {
    my ($self, $gl, $translateX, $translateY) = @_;
        $gl->glTranslatef($translateX, $translateY, 0);
}


sub rotate {
    my ($self, $gl, $angle) = @_;
        $gl->glRotatef(-$angle, 0, 0, 1);
}


sub scale {
    my ($self, $gl, $scaleX, $scaleY) = @_;
        $gl->glScalef($scaleX, $scaleY, 1);
}


sub colorMask {
    my ($self, $gl, $red, $green, $blue, $alpha) = @_;
}

# use javax::microedition::khronos::opengles::GL10;

1;

