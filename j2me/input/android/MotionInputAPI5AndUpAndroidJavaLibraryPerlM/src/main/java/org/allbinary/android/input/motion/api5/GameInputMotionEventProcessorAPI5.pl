#
# AllBinary Open License Version 1
# Copyright (c) 2009 AllBinary
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

package org::allbinary::android::input::motion::api5::GameInputMotionEventProcessorAPI5;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::input::motion::BaseGameInputMotionEventProcessor';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{displayInfo} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{motionRecognizerArray} = undef;
    $self->{TOTAL_MINUS_ONE} = undef;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::android::input::motion::api5::GameInputMotionEventProcessorAPI5::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::android::input::motion::api5::GameInputMotionEventProcessorAPI5::instance = 'org::allbinary::android::input::motion::api5::GameInputMotionEventProcessorAPI5'->new();
        }
        return $org::allbinary::android::input::motion::api5::GameInputMotionEventProcessorAPI5::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $size = 'org::allbinary::android::input::motion::api5::GameInputMotionInfoAPI5'->getInstance()->{MAX_POINTERS};
        $self->{motionRecognizerArray} = [(undef) x ($size)];
        $self->{TOTAL_MINUS_ONE} = $size;
        for (my $index = 0; $index < $size; $index++) {
            $self->{motionRecognizerArray}->[$index] = 'org::allbinary::input::motion::AllMotionRecognizer'->new();
        }
    return $self;
}


sub isValid {
    my ($self, $pointerId) = @_;
        if ($pointerId > $self->{TOTAL_MINUS_ONE}) {
            my $message = "Log that the pointer Ids are not what would be expected or Android has more than what I set my stuff to support pointerId: ";
            'org::allbinary::logic::communication::log::ForcedLogUtil'->log($message . $pointerId, $self);
            return 0;
        } else {
            return 1;
        }
}


sub process {
    my ($self, $motionEvent) = @_;
        try {
            my $action = $motionEvent->getAction();
            my $total = scalar(@{$self->{motionRecognizerArray}});
            if ($total > $motionEvent->getPointerCount()) {
                $total = $motionEvent->getPointerCount();
            } else {
                my $message = "Log that Android has more pointers than I have expected so increase it motionEvent.getPointerCount(): ";
                'org::allbinary::logic::communication::log::ForcedLogUtil'->log($message . $motionEvent->getPointerCount(), $self);
            }
            my $totalMinusOne = $total - 1;
            if ($action == $android::view::MotionEvent::ACTION_DOWN) {
                for (my $pointerIndex = $totalMinusOne; $pointerIndex >= 0; $pointerIndex--) {
                    my $pointerId = $motionEvent->getPointerId($pointerIndex);
                    if ($self->isValid($pointerId)) {
                        my $scalableListener = $self->{displayInfo}->getScalableListener();
                        my $x = int((($motionEvent->getX($pointerIndex) - $self->{displayInfo}->getLeft()) / $scalableListener->getRatio($self->{displayInfo}->getRatio())));
                        my $y = int((($motionEvent->getY($pointerIndex) - $self->{displayInfo}->getTop()) / $scalableListener->getRatio($self->{displayInfo}->getRatio())));
                        $self->{motionRecognizerArray}->[$pointerId]->processStartMotionEvent($x, $y, $motionEvent->getDeviceId(), 0);
                    }
                }
            } elsif ($action == $android::view::MotionEvent::ACTION_UP || $action == $android::view::MotionEvent::ACTION_CANCEL) {
                for (my $pointerIndex = $totalMinusOne; $pointerIndex >= 0; $pointerIndex--) {
                    my $pointerId = $motionEvent->getPointerId($pointerIndex);
                    if ($self->isValid($pointerId)) {
                        my $scalableListener = $self->{displayInfo}->getScalableListener();
                        my $x = int((($motionEvent->getX($pointerIndex) - $self->{displayInfo}->getLeft()) / $scalableListener->getRatio($self->{displayInfo}->getRatio())));
                        my $y = int((($motionEvent->getY($pointerIndex) - $self->{displayInfo}->getTop()) / $scalableListener->getRatio($self->{displayInfo}->getRatio())));
                        $self->{motionRecognizerArray}->[$pointerId]->processEndMotionEvent($x, $y, $motionEvent->getDeviceId(), 0);
                    }
                }
            } elsif ($action == $android::view::MotionEvent::ACTION_MOVE) {
                for (my $pointerIndex = $totalMinusOne; $pointerIndex >= 0; $pointerIndex--) {
                    my $pointerId = $motionEvent->getPointerId($pointerIndex);
                    if ($self->isValid($pointerId)) {
                        my $scalableListener = $self->{displayInfo}->getScalableListener();
                        my $x = int((($motionEvent->getX($pointerIndex) - $self->{displayInfo}->getLeft()) / $scalableListener->getRatio($self->{displayInfo}->getRatio())));
                        my $y = int((($motionEvent->getY($pointerIndex) - $self->{displayInfo}->getTop()) / $scalableListener->getRatio($self->{displayInfo}->getRatio())));
                        $self->{motionRecognizerArray}->[$pointerId]->processDraggedMotionEvent($x, $y, $motionEvent->getDeviceId(), 0);
                    }
                }
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
        }
}

use android::view::MotionEvent;
use org::allbinary::android::input::motion::BaseGameInputMotionEventProcessor;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::displayable::ScalableListener;
use org::allbinary::input::motion::AllMotionRecognizer;
use org::allbinary::input::motion::MotionRecognizer;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::android::input::motion::api5::GameInputMotionInfoAPI5;

1;

