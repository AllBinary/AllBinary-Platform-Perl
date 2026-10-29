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

package org::allbinary::input::motion::gesture::MirrorMotionGestureEventUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::input::motion::gesture::MirrorMotionGestureEventUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{motionEventCircularPool} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{motionEventCircularPool} = 'org::allbinary::input::motion::gesture::observer::MotionEventCircularPool'->createPool(2147483647);
    return $self;
}


# throws Exception
sub mirrorVerticle {
    my ($self, $motionGestureEvent, $halfWidth) = @_;
        my $event = $self->{motionEventCircularPool}->getInstance($motionGestureEvent->getMotionGesture());
        my $previousNewX = $self->getNewX($motionGestureEvent->getPreviousPoint()->getX(), $halfWidth);
        my $currentNewX = $self->getNewX($motionGestureEvent->getCurrentPoint()->getX(), $halfWidth);
        my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
        my $mirroredPreviousPoint = $pointFactory->createXY($previousNewX, $motionGestureEvent->getPreviousPoint()->getY());
        my $mirroredCurrentPoint = $pointFactory->createXY($currentNewX, $motionGestureEvent->getCurrentPoint()->getY());
        $event->setPreviousPoint($mirroredPreviousPoint);
        $event->setCurrentPoint($mirroredCurrentPoint);
        return $event;
}


sub getNewX {
    my ($self, $x, $halfWidth) = @_;
        my $newX = 0;
        if ($x > $halfWidth) {
            $newX = $halfWidth - ($x - $halfWidth);
        } else {
            $newX = $halfWidth + ($halfWidth - $x);
        }
        return $newX;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::gesture::MirrorMotionGestureEventUtil::instance;
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::input::motion::gesture::observer::MotionEventCircularPool;
use org::allbinary::input::motion::gesture::observer::MotionGestureEvent;

1;

