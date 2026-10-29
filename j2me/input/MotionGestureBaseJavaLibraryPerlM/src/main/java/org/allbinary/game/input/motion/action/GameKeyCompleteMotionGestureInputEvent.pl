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

package org::allbinary::game::input::motion::action::GameKeyCompleteMotionGestureInputEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::CompleteMotionGestureInputEvent','org::allbinary::game::input::GameKeyEventSourceInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{gameKeyEventFactory} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance();
    $self->{SOURCE_ID} = $self->{gameKeyEventFactory}->{MOTION_GESTURE_SOURCE_ID};
    $self->{gameKey} = $org::allbinary::game::input::GameKey::NULL_GAME_KEY;
    $self->{gameKeyEvent} = $org::allbinary::game::input::event::GameKeyEvent::NONE;
    $self->{inputToGameKeyMapping} = undef;
}


sub new {
    my ($class, $name, $motionGestureInput, $inputToGameKeyMapping) = @_;
    my $self = $class->SUPER::new($name, $motionGestureInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->{inputToGameKeyMapping} = $inputToGameKeyMapping;
        'org::allbinary::game::input::motion::action::GameKeyCompleteMotionGestureInputEventFactory'->getInstance()->add($self);
        $self->update();
    return $self;
}


sub getSourceId {
    my ($self) = @_;
        return $self->{SOURCE_ID};
}


sub update {
    my ($self) = @_;
        try {
            $self->setGameKey($self->{inputToGameKeyMapping}->getInstance($self->getMotionGestureInput()->getId()));
            $self->setGameKeyEvent($self->{gameKeyEventFactory}->getInstanceForInput($self, $self->getGameKey()));
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{UPDATE}, $e);
        }
}


sub setGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
        $self->{gameKeyEvent} = $gameKeyEvent;
}


sub getGameKeyEvent {
    my ($self) = @_;
        return $self->{gameKeyEvent};
}


sub setGameKey {
    my ($self, $gameKey) = @_;
        $self->{gameKey} = $gameKey;
}


sub getGameKey {
    my ($self) = @_;
        return $self->{gameKey};
}

use org::allbinary::game::input::CompleteMotionGestureInputEvent;
use org::allbinary::game::input::GameKey;
use org::allbinary::game::input::GameKeyEventSourceInterface;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::game::input::mapping::InputToGameKeyMapping;
use org::allbinary::input::motion::gesture::MotionGestureInput;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::input::motion::action::GameKeyCompleteMotionGestureInputEventFactory;

1;

