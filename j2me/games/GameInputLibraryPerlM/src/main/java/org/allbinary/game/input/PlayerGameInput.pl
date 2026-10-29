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

package org::allbinary::game::input::PlayerGameInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::GameInput','org::allbinary::game::input::event::GameKeyEventListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{gameInputStrings} = 'org::allbinary::game::input::GameInputStrings'->getInstance();
    $self->{playerInputId} = undef;
}


sub new {
    my ($class, $gameKeyEventList, $removalGameKeyEventList, $playerInputId) = @_;
    my $self = $class->SUPER::new($gameKeyEventList, $removalGameKeyEventList);
    $self->_init_fields();
        # super(...) made $self above
        $self->{playerInputId} = $playerInputId;
    return $self;
}


sub onPressGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
        $self->add($gameKeyEvent);
        $self->addForRemoval($gameKeyEvent);
}


sub onDownGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
        $self->add($gameKeyEvent);
}


sub onDownKeyEvent {
    my ($self, $gameKeyEvent) = @_;
        $self->add($gameKeyEvent);
        $self->addForRemoval($gameKeyEvent);
}


sub onDownKey {
    my ($self, $gameKeyEvent) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->append($gameKeyEvent->toString())->toString(), $self, $self->{gameInputStrings}->{ON_DOWN_GAME_KEY});
}


sub onUpGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
        $self->addForRemoval($gameKeyEvent);
}


sub onUpKeyEvent {
    my ($self, $gameKeyEvent) = @_;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub getPlayerInputId {
    my ($self) = @_;
        return $self->{playerInputId};
}

use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::input::event::GameKeyEventListenerInterface;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::string::CommonLabels;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::input::GameInputStrings;

1;

