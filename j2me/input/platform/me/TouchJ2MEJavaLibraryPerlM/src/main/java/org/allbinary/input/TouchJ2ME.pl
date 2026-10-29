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

#TouchJ2ME
package org::allbinary::input::TouchJ2ME;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{DEVICE_ID} = 0;
    $self->{motionRecognizer} = 'org::allbinary::input::motion::AllMotionRecognizer'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $motionGesturesHandler = $self->{motionRecognizer}->getMotionGestureRecognizer()->getMotionGesturesHandler();
        $motionGesturesHandler->addListenerInterface('org::allbinary::input::motion::gesture::observer::GameMotionGestureListener'->new('org::allbinary::input::motion::gesture::observer::MotionGestureReceiveInterfaceFactory'->getInstance()));
    return $self;
}


sub pointerDragged {
    my ($self, $x, $y) = @_;
        try {
            $self->{motionRecognizer}->processDraggedMotionEvent($x, $y, $self->{DEVICE_ID}, 0);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "pointerDragged", $e);
        }
}


sub pointerPressed {
    my ($self, $x, $y) = @_;
        try {
            $self->{motionRecognizer}->processStartMotionEvent($x, $y, $self->{DEVICE_ID}, 0);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "pointerPressed", $e);
        }
}


sub pointerReleased {
    my ($self, $x, $y) = @_;
        try {
            $self->{motionRecognizer}->processEndMotionEvent($x, $y, $self->{DEVICE_ID}, 0);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "pointerReleased", $e);
        }
}

use org::allbinary::input::motion::AllMotionRecognizer;
use org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler;
use org::allbinary::input::motion::gesture::observer::GameMotionGestureListener;
use org::allbinary::input::motion::gesture::observer::MotionGestureReceiveInterfaceFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

