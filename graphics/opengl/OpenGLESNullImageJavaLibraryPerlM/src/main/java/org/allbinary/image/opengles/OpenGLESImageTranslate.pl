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

package org::allbinary::image::opengles::OpenGLESImageTranslate;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::image::opengles::OpenGLESImageTranslate'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::image::opengles::OpenGLESImageTranslate::instance;
}


sub translate {
    my ($self, $gl, $openGLESImage, $x, $y) = @_;
        $openGLESImage->{imageProcessor}->translate($gl, $x, $y);
}


sub translate2 {
    my ($self, $gl, $openGLESImage) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::khronos::opengles::GL10 ();

1;

