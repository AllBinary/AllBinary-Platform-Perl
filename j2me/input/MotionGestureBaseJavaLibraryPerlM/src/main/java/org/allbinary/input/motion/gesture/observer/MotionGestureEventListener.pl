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

# Java interface
package org::allbinary::input::motion::gesture::observer::MotionGestureEventListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::motion::gesture::observer::BaseMotionGestureEventListener';



sub onPressedMotionGestureEvent {
    my ($self, $ev) = @_;
    die "abstract method onPressedMotionGestureEvent";
}


sub onUpMotionGestureEvent {
    my ($self, $ev) = @_;
    die "abstract method onUpMotionGestureEvent";
}


sub onDownMotionGestureEvent {
    my ($self, $ev) = @_;
    die "abstract method onDownMotionGestureEvent";
}


sub onLeftMotionGestureEvent {
    my ($self, $ev) = @_;
    die "abstract method onLeftMotionGestureEvent";
}


sub onRightMotionGestureEvent {
    my ($self, $ev) = @_;
    die "abstract method onRightMotionGestureEvent";
}


sub onDiagonalDownRightMotionGestureEvent {
    my ($self, $ev) = @_;
    die "abstract method onDiagonalDownRightMotionGestureEvent";
}


sub onDiagonalDownLeftMotionGestureEvent {
    my ($self, $ev) = @_;
    die "abstract method onDiagonalDownLeftMotionGestureEvent";
}


sub onDiagonalUpRightMotionGestureEvent {
    my ($self, $ev) = @_;
    die "abstract method onDiagonalUpRightMotionGestureEvent";
}


sub onDiagonalUpLeftMotionGestureEvent {
    my ($self, $ev) = @_;
    die "abstract method onDiagonalUpLeftMotionGestureEvent";
}


# throws Exception
sub released {
    my ($self, $ev) = @_;
    die "abstract method released";
}

use org::allbinary::input::motion::gesture::observer::BaseMotionGestureEventListener;

1;

