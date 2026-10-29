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

package org::allbinary::graphics::GraphicsStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::GraphicsStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{ANIMATION} = "animation";
    $self->{ANGLE} = "angle";
    $self->{MOVEMENT_ANGLE} = "movement_angle";
    $self->{ROTATION} = "rotation";
    $self->{OPACITY} = "opacity";
    $self->{HTML} = "HTML";
    $self->{WIDTH} = "width";
    $self->{HEIGHT} = "height";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::GraphicsStrings::instance;
}


1;

