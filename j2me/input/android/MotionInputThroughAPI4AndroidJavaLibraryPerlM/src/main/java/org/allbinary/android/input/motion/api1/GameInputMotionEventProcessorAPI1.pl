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

package org::allbinary::android::input::motion::api1::GameInputMotionEventProcessorAPI1;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::input::motion::BaseGameInputMotionEventProcessor';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{motionRecognizer} = 'org::allbinary::input::motion::AllMotionRecognizer'->new();
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::android::input::motion::api1::GameInputMotionEventProcessorAPI1::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::android::input::motion::api1::GameInputMotionEventProcessorAPI1::instance = 'org::allbinary::android::input::motion::api1::GameInputMotionEventProcessorAPI1'->new();
        }
        return $org::allbinary::android::input::motion::api1::GameInputMotionEventProcessorAPI1::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub process {
    my ($self, $motionEvent) = @_;
        try {
            my $x = int($motionEvent->getX());
            my $y = int($motionEvent->getY());
            my $action = $motionEvent->getAction();
            if ($action == $android::view::MotionEvent::ACTION_DOWN) {
                $self->{motionRecognizer}->processStartMotionEvent($x, $y, $motionEvent->getDeviceId(), 0);
            } elsif ($action == $android::view::MotionEvent::ACTION_UP || $action == $android::view::MotionEvent::ACTION_CANCEL) {
                $self->{motionRecognizer}->processEndMotionEvent($x, $y, $motionEvent->getDeviceId(), 0);
            } elsif ($action == $android::view::MotionEvent::ACTION_MOVE) {
                $self->{motionRecognizer}->processDraggedMotionEvent($x, $y, $motionEvent->getDeviceId(), 0);
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
        }
}

use android::view::MotionEvent;
use org::allbinary::android::input::motion::BaseGameInputMotionEventProcessor;
use org::allbinary::input::motion::AllMotionRecognizer;
use org::allbinary::input::motion::MotionRecognizer;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;

1;

