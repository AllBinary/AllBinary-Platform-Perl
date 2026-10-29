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

package org::allbinary::graphics::displayable::CanvasStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::displayable::CanvasStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{CONSTRUCTOR} = "MyCanvas::MyCanvas";
    $self->{PAUSE} = "MyCanvas::pause";
    $self->{UN_PAUSE} = "MyCanvas::unPause";
    $self->{SET_FULL_SCREEN_MODE} = "setFullScreenMode";
    $self->{SIZE_CHANGED} = "sizeChanged";
    $self->{SCALED_IMAGES} = "scaledImages";
    $self->{PAINT} = "paint";
    $self->{ON_DISPLAY_CHANGE_EVENT} = "onDisplayChangeEvent";
    $self->{UPDATE_MEASUREMENT} = "updateMeasurement";
    $self->{FD_WIDTH} = " font/display width: ";
    $self->{FD_HEIGHT} = " font/display height: ";
    $self->{EMPTY_CHILD_NAME_LIST} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
    $self->{ABOUT} = "About";
    $self->{OPTIONS} = "Options";
    $self->{FONT_ATLAS} = "/font.png";
    $self->{OBJ_MODEL} = "_obj";
    $self->{MD2_MODEL} = "_md2";
    $self->{_PNG} = ".png";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::displayable::CanvasStrings::instance;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;

1;

