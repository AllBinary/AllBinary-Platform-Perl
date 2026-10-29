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

package org::allbinary::game::input::motion::action::GameKeyFromMotionGestureEventListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::CompleteMotionGestureInputEventListener';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{previousGameKeyEvent} = $org::allbinary::game::input::event::GameKeyEvent::NONE;
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onCompleteMotionGestureInputEvent {
    my ($self, $completeMotionGestureInputEvent) = @_;
        try {
            my $gameKeyCompleteMotionGestureInputEvent = $completeMotionGestureInputEvent;
            my $gameKeyEvent = $gameKeyCompleteMotionGestureInputEvent->getGameKeyEvent();
            if ($gameKeyEvent != $self->{previousGameKeyEvent}) {
                if ($self->{previousGameKeyEvent} != $org::allbinary::game::input::event::GameKeyEvent::NONE) {
                    'org::allbinary::game::input::event::UpGameKeyEventHandler'->getInstance()->fireEvent($self->{previousGameKeyEvent});
                }
                $self->{previousGameKeyEvent} = $gameKeyEvent;
                if (defined($gameKeyEvent) && $gameKeyEvent != $org::allbinary::game::input::event::GameKeyEvent::NONE) {
                    'org::allbinary::game::input::event::DownGameKeyEventHandler'->getInstance()->fireEvent($gameKeyEvent);
                }
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "onCompleteMotionGestureInputEvent", $e);
        }
}

use org::allbinary::game::input::CompleteMotionGestureInputEvent;
use org::allbinary::game::input::CompleteMotionGestureInputEventListener;
use org::allbinary::game::input::event::DownGameKeyEventHandler;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::input::event::UpGameKeyEventHandler;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::string::CommonStrings;

1;

