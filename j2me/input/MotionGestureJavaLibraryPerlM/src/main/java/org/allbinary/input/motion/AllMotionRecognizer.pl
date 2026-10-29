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

package org::allbinary::input::motion::AllMotionRecognizer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::motion::MotionRecognizer';

our $index = 0;
our $pointCircularPool = 'org::allbinary::graphics::GPointCircularPool'->new(40);

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{motionGestureRecognizer} = undef;
    $self->{touchButtonProcessing} = 0;
    $self->{touchButtonRecognizer} = undef;
    $self->{id} = undef;
    $self->{lastX} = 0;
    $self->{lastY} = 0;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{id} = $org::allbinary::input::motion::AllMotionRecognizer::index++;
        $self->{motionGestureRecognizer} = 'org::allbinary::input::motion::gesture::MotionGestureRecognizer'->new($self->{id});
        $self->{touchButtonRecognizer} = 'org::allbinary::input::motion::button::TouchButtonRecognizer'->new();
    return $self;
}


# throws Exception
sub processStartMotionEvent {
    my ($self, $x, $y, $deviceId, $modifiers) = @_;
        if ($self->{touchButtonRecognizer}->pressTouchButtonInput($x, $y, $deviceId)) {
            $self->{touchButtonProcessing} = 1;
        }
        if (!$self->{touchButtonProcessing}) {
            my $point = $org::allbinary::input::motion::AllMotionRecognizer::pointCircularPool->getNextInstance();
            $point->setX($x);
            $point->setY($y);
            $self->{motionGestureRecognizer}->processPressedMotionEvent($point, $deviceId, $modifiers);
        }
}


# throws Exception
sub processEndMotionEvent {
    my ($self, $x, $y, $deviceId, $modifiers) = @_;
        if ($self->{touchButtonRecognizer}->releaseTouchButtonInput($x, $y, $deviceId)) {
        }
        if (!$self->{touchButtonProcessing}) {
            my $point = $org::allbinary::input::motion::AllMotionRecognizer::pointCircularPool->getNextInstance();
            $point->setX($x);
            $point->setY($y);
            $self->{motionGestureRecognizer}->processReleasedMotionEvent($point, $deviceId, $modifiers);
        }
        if ($self->{touchButtonProcessing}) {
            $self->{touchButtonProcessing} = 0;
        }
}


# throws Exception
sub processDraggedMotionEvent {
    my ($self, $x, $y, $deviceId, $modifiers) = @_;
        if ($self->{touchButtonProcessing}) {
            $self->{touchButtonRecognizer}->pressTouchButtonInput($x, $y, $deviceId);
        }
        if (!$self->{touchButtonProcessing}) {
            my $point = $org::allbinary::input::motion::AllMotionRecognizer::pointCircularPool->getNextInstance();
            $point->setX($x);
            $point->setY($y);
            $self->{motionGestureRecognizer}->processDraggedMotionEvent($point, $deviceId, $modifiers);
        }
}


# throws Exception
sub processMovedMotionEvent {
    my ($self, $x, $y, $deviceId, $modifiers) = @_;
        if ($x != $self->{lastX} || $y != $self->{lastY}) {
            $self->{lastX} = $x;
            $self->{lastY} = $y;
            my $point = $org::allbinary::input::motion::AllMotionRecognizer::pointCircularPool->getNextInstance();
            $point->setX($x);
            $point->setY($y);
            $self->{motionGestureRecognizer}->processMovedMotionEvent($point, $deviceId, $modifiers);
        }
}


# throws Exception
sub processScrolledMotionEvent {
    my ($self, $x, $y, $deviceId, $modifiers) = @_;
        my $point = $org::allbinary::input::motion::AllMotionRecognizer::pointCircularPool->getNextInstance();
        $point->setX($x);
        $point->setY($y);
        $self->{motionGestureRecognizer}->processScrolledMotionEvent($point, $deviceId, $modifiers);
}


sub getMotionGestureRecognizer {
    my ($self) = @_;
        return $self->{motionGestureRecognizer};
}

use org::allbinary::graphics::CustomGPoint;
use org::allbinary::graphics::GPointCircularPool;
use org::allbinary::input::motion::button::TouchButtonRecognizer;
use org::allbinary::input::motion::gesture::MotionGestureRecognizer;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::input::motion::MotionRecognizer;

1;

