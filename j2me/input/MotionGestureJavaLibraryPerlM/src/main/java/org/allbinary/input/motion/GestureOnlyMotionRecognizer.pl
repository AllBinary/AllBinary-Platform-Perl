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

package org::allbinary::input::motion::GestureOnlyMotionRecognizer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::motion::MotionRecognizer';

our $index = 0;
our $pointCircularPool = 'org::allbinary::graphics::GPointCircularPool'->new(40);

sub _init_fields {
    my ($self) = @_;
    $self->{motionGestureRecognizer} = undef;
    $self->{id} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{id} = $org::allbinary::input::motion::GestureOnlyMotionRecognizer::index++;
        $self->{motionGestureRecognizer} = 'org::allbinary::input::motion::gesture::MotionGestureRecognizer'->new($self->{id});
    return $self;
}


# throws Exception
sub processStartMotionEvent {
    my ($self, $x, $y, $deviceId, $modifiers) = @_;
        my $point = $org::allbinary::input::motion::GestureOnlyMotionRecognizer::pointCircularPool->getNextInstance();
        $point->setX($x);
        $point->setY($y);
        $self->{motionGestureRecognizer}->processPressedMotionEvent($point, $deviceId, $modifiers);
}


# throws Exception
sub processEndMotionEvent {
    my ($self, $x, $y, $deviceId, $modifiers) = @_;
        my $point = $org::allbinary::input::motion::GestureOnlyMotionRecognizer::pointCircularPool->getNextInstance();
        $point->setX($x);
        $point->setY($y);
        $self->{motionGestureRecognizer}->processReleasedMotionEvent($point, $deviceId, $modifiers);
}


# throws Exception
sub processDraggedMotionEvent {
    my ($self, $x, $y, $deviceId, $modifiers) = @_;
        my $point = $org::allbinary::input::motion::GestureOnlyMotionRecognizer::pointCircularPool->getNextInstance();
        $point->setX($x);
        $point->setY($y);
        $self->{motionGestureRecognizer}->processDraggedMotionEvent($point, $deviceId, $modifiers);
}

use org::allbinary::graphics::CustomGPoint;
use org::allbinary::graphics::GPointCircularPool;
use org::allbinary::input::motion::gesture::MotionGestureRecognizer;
use org::allbinary::input::motion::MotionRecognizer;

1;

