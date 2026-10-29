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

package org::allbinary::image::opengles::OpenGLESImageProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{textureID} = -1;
    $self->{scaleX} = 1.0;
    $self->{scaleY} = 1.0;
    $self->{scaleX2} = 1.0;
    $self->{scaleY2} = 1.0;
    $self->{angle} = 0;
    $self->{redf} = 1.0;
    $self->{greenf} = 1.0;
    $self->{bluef} = 1.0;
    $self->{alphaf} = 0.0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

