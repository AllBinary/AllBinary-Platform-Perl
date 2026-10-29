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

package org::allbinary::input::motion::gesture::MotionGestureRecognizer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{j2seMath} = 'org::allbinary::logic::math::J2SEMath'->getInstance();
    $self->{origin} = 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO};
    $self->{previous} = $self->{origin};
    $self->{intermediate} = $self->{origin};
    $self->{line} = 'org::allbinary::graphics::Line'->new($self->{origin}, $self->{origin});
    $self->{motionGesturesHandler} = undef;
    $self->{movedMotionGesturesHandler} = undef;
    $self->{scrolledMotionGesturesHandler} = undef;
    $self->{motionEventCircularPool} = undef;
}


sub new {
    my ($class, $id) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{motionEventCircularPool} = 'org::allbinary::input::motion::gesture::observer::MotionEventCircularPool'->createPool($id);
        my $motionGesturesHandler = 'org::allbinary::logic::util::event::handler::BasicEventHandler'->new();
        my $movedMotionGesturesHandler = $motionGesturesHandler;
        my $scrolledMotionGesturesHandler = $motionGesturesHandler;
        try {
            $motionGesturesHandler = 'org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler'->getInstance();
            $movedMotionGesturesHandler = 'org::allbinary::input::motion::gesture::observer::MovedMotionGesturesHandler'->getInstance();
            $scrolledMotionGesturesHandler = 'org::allbinary::input::motion::gesture::observer::ScrolledMotionGesturesHandler'->getInstance();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR}, $e);
        }
        $self->{motionGesturesHandler} = $motionGesturesHandler;
        $self->{movedMotionGesturesHandler} = $movedMotionGesturesHandler;
        $self->{scrolledMotionGesturesHandler} = $scrolledMotionGesturesHandler;
    return $self;
}


# throws Exception
sub processPressedMotionEvent {
    my ($self, $current, $deviceId, $button) = @_;
        $self->{intermediate} = $self->{origin};
        $self->{previous} = $self->{origin};
        my $event = $self->{motionEventCircularPool}->getInstance('org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance()->{PRESSED});
        $event->setPreviousPoint($self->{previous});
        $event->setCurrentPoint($current);
        $self->{motionGesturesHandler}->fireEvent($event);
        return 1;
}


# throws Exception
sub processReleasedMotionEvent {
    my ($self, $current, $deviceId, $button) = @_;
        my $event = $self->{motionEventCircularPool}->getInstance('org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance()->{RELEASED});
        $event->setPreviousPoint($self->{previous});
        $event->setCurrentPoint($current);
        $self->{motionGesturesHandler}->fireEvent($event);
        return 1;
}


# throws Exception
sub processDraggedMotionEvent {
    my ($self, $current, $deviceId, $buttonMask) = @_;
        if ($self->{previous} == $self->{origin} || $self->{intermediate} == $self->{origin}) {
            $self->{previous} = $current;
            $self->{intermediate} = $current;
            return;
        }
        $self->{line}->setP1($self->{previous});
        $self->{line}->setP2($current);
        my $minimumMotionGesture = 'org::allbinary::input::motion::gesture::configuration::MotionGestureConfigurationFactory'->getInstance()->getMinimumMotionGesture();
        if ($self->{j2seMath}->abs($self->{line}->getDeltaX()) < $minimumMotionGesture && $self->{j2seMath}->abs($self->{line}->getDeltaY()) < $minimumMotionGesture) {
            $self->{intermediate} = $current;
            return;
        }
        my $gradient = $self->{line}->getGradient();
        my $absGradient = $self->{j2seMath}->abs($gradient);
        my $conf = 'org::allbinary::input::motion::gesture::configuration::MotionGestureConfigurationFactory'->getInstance();
        my $touchMotionGestureFactory = 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance();
        my $newMotionGesture = $touchMotionGestureFactory->{NO_MOTION};
        my $diagonalToleranceHigher = 12.0;
        my $diagonalToleranceLower = 12.0;
        if ($conf->isDiagonalMotionGestureAllowed()) {
            $diagonalToleranceHigher = (90 - $conf->getDiagonalTolerance());
            $diagonalToleranceLower = $conf->getDiagonalTolerance();
        }
        if ($absGradient > POSIX::tan((($diagonalToleranceHigher) * 3.14159265358979 / 180))) {
            if ($self->{line}->getDeltaY() > 0) {
                $newMotionGesture = $touchMotionGestureFactory->{UP};
            } else {
                $newMotionGesture = $touchMotionGestureFactory->{DOWN};
            }
        } else {
            if ($absGradient < POSIX::tan((($diagonalToleranceLower) * 3.14159265358979 / 180))) {
                if ($self->{line}->getDeltaX() > 0) {
                    $newMotionGesture = $touchMotionGestureFactory->{LEFT};
                } else {
                    $newMotionGesture = $touchMotionGestureFactory->{RIGHT};
                }
            } else {
                if ($gradient > 0.0) {
                    if ($self->{line}->getDeltaX() > 0) {
                        $newMotionGesture = $touchMotionGestureFactory->{DIAGONAL_UP_LEFT};
                    } else {
                        $newMotionGesture = $touchMotionGestureFactory->{DIAGONAL_DOWN_RIGHT};
                    }
                } else {
                    if ($self->{line}->getDeltaX() > 0) {
                        $newMotionGesture = $touchMotionGestureFactory->{DIAGONAL_DOWN_LEFT};
                    } else {
                        $newMotionGesture = $touchMotionGestureFactory->{DIAGONAL_UP_RIGHT};
                    }
                }
            }
        }
        $self->{previous} = $current;
        $self->{intermediate} = $current;
        my $event = $self->{motionEventCircularPool}->getInstance($newMotionGesture);
        $event->setPreviousPoint($self->{previous});
        $event->setCurrentPoint($current);
        $self->{motionGesturesHandler}->fireEvent($event);
        return;
}


# throws Exception
sub processMovedMotionEvent {
    my ($self, $current, $deviceId, $button) = @_;
        my $event = $self->{motionEventCircularPool}->getInstance('org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance()->{NO_MOTION});
        $event->setPreviousPoint($self->{previous});
        $event->setCurrentPoint($current);
        $self->{movedMotionGesturesHandler}->fireEvent($event);
        return 1;
}


# throws Exception
sub processScrolledMotionEvent {
    my ($self, $current, $deviceId, $button) = @_;
        my $touchMotionGestureFactory = 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance();
        my $newMotionGesture = $touchMotionGestureFactory->{NO_MOTION};
        if ($button > 0) {
            $newMotionGesture = $touchMotionGestureFactory->{SCROLL_UP};
        } elsif ($button < 0) {
            $newMotionGesture = $touchMotionGestureFactory->{SCROLL_DOWN};
        }
        my $event = $self->{motionEventCircularPool}->getInstance($newMotionGesture);
        $event->setPreviousPoint($self->{previous});
        $event->setCurrentPoint($current);
        $self->{scrolledMotionGesturesHandler}->fireEvent($event);
        return 1;
}


sub getMotionGesturesHandler {
    my ($self) = @_;
        return $self->{motionGesturesHandler};
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::Line;
use org::allbinary::graphics::PointFactory;
use org::allbinary::input::motion::gesture::configuration::MotionGestureConfiguration;
use org::allbinary::input::motion::gesture::configuration::MotionGestureConfigurationFactory;
use org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler;
use org::allbinary::input::motion::gesture::observer::MotionEventCircularPool;
use org::allbinary::input::motion::gesture::observer::MotionGestureEvent;
use org::allbinary::input::motion::gesture::observer::MovedMotionGesturesHandler;
use org::allbinary::input::motion::gesture::observer::ScrolledMotionGesturesHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::J2SEMath;
use org::allbinary::logic::util::event::handler::BasicEventHandler;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;

1;

