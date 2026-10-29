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

package org::allbinary::android::input::motion::TrackballGameInputMotionEventProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::input::motion::MotionEventProcessor';

our $PROCESSOR = 'org::allbinary::android::input::motion::TrackballGameInputMotionEventProcessor'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{listener} = 'org::allbinary::game::input::motion::action::SingleKeyPressGameKeyFromMotionGestureEventListener'->new();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::android::input::motion::TrackballGameInputMotionEventProcessor::PROCESSOR;
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
            my $x = $motionEvent->getX();
            my $y = $motionEvent->getY();
            if ($x < 0.0) {
                $self->{listener}->onCompleteMotionGestureInputEvent('org::allbinary::input::motion::trackball::action::LeftTrackballInputToGameKeyEventAction'->getInstance());
            } elsif ($x > 0.0) {
                $self->{listener}->onCompleteMotionGestureInputEvent('org::allbinary::input::motion::trackball::action::RightTrackballInputToGameKeyEventAction'->getInstance());
            }
            if ($y < 0.0) {
                $self->{listener}->onCompleteMotionGestureInputEvent('org::allbinary::input::motion::trackball::action::UpTrackballInputToGameKeyEventAction'->getInstance());
            } elsif ($y > 0.0) {
                $self->{listener}->onCompleteMotionGestureInputEvent('org::allbinary::input::motion::trackball::action::DownTrackballInputToGameKeyEventAction'->getInstance());
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
        }
}

use android::view::MotionEvent;
use org::allbinary::game::input::motion::action::SingleKeyPressGameKeyFromMotionGestureEventListener;
use org::allbinary::input::motion::trackball::action::DownTrackballInputToGameKeyEventAction;
use org::allbinary::input::motion::trackball::action::LeftTrackballInputToGameKeyEventAction;
use org::allbinary::input::motion::trackball::action::RightTrackballInputToGameKeyEventAction;
use org::allbinary::input::motion::trackball::action::UpTrackballInputToGameKeyEventAction;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::android::input::motion::MotionEventProcessor;

1;

