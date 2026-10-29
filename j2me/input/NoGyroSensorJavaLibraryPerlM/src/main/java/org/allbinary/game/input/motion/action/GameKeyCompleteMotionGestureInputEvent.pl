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
    $self->{gameKey} = $org::allbinary::game::input::GameKey::NULL_GAME_KEY;
    $self->{gameKeyEvent} = $org::allbinary::game::input::event::GameKeyEvent::NONE;
}


sub new {
    my ($class, $name, $motionGestureInput, $inputToGameKeyMapping) = @_;
    my $self = $class->SUPER::new($name, $motionGestureInput);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getSourceId {
    my ($self) = @_;
        return 0;
}


sub update {
    my ($self) = @_;
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
use org::allbinary::game::input::mapping::InputToGameKeyMapping;
use org::allbinary::input::motion::gesture::MotionGestureInput;

1;

