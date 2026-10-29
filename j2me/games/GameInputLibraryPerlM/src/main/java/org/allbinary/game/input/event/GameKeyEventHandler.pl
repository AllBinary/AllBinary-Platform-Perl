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

package org::allbinary::game::input::event::GameKeyEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::event::GameKeyEventHandler'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{pressGameKeyEventHandler} = 'org::allbinary::game::input::event::PressGameKeyEventHandler'->getInstance();
    $self->{upGameKeyEventHandler} = 'org::allbinary::game::input::event::UpGameKeyEventHandler'->getInstance();
    $self->{downGameKeyEventHandler} = 'org::allbinary::game::input::event::DownGameKeyEventHandler'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::event::GameKeyEventHandler::instance;
}


sub removeAllListeners {
    my ($self) = @_;
        $self->{pressGameKeyEventHandler}->removeAllListeners();
        $self->{upGameKeyEventHandler}->removeAllListeners();
        $self->{downGameKeyEventHandler}->removeAllListeners();
}


sub addListenerForPlayer {
    my ($self, $eventListenerInterface, $playerInputId) = @_;
        $self->{logUtil}->putF($eventListenerInterface->toString(), $self, $self->{commonStrings}->{ADD_LISTENER});
        $self->{pressGameKeyEventHandler}->addListenerSingleThreaded($eventListenerInterface);
        $self->{upGameKeyEventHandler}->getInstanceForPlayer($playerInputId)->addListenerSingleThreaded($eventListenerInterface);
        $self->{downGameKeyEventHandler}->getInstanceForPlayer($playerInputId)->addListenerSingleThreaded($eventListenerInterface);
}


sub addListener {
    my ($self, $eventListenerInterface) = @_;
        $self->{logUtil}->putF($eventListenerInterface->toString(), $self, $self->{commonStrings}->{ADD_LISTENER});
        $self->{pressGameKeyEventHandler}->addListenerSingleThreaded($eventListenerInterface);
        $self->{upGameKeyEventHandler}->addListenerSingleThreaded($eventListenerInterface);
        $self->{downGameKeyEventHandler}->addListenerSingleThreaded($eventListenerInterface);
}


sub removeListener {
    my ($self, $eventListenerInterface) = @_;
        $self->{logUtil}->putF($eventListenerInterface->toString(), $self, $self->{commonStrings}->{REMOVE_LISTENER});
        $self->{pressGameKeyEventHandler}->removeListenerSingleThreaded($eventListenerInterface);
        $self->{upGameKeyEventHandler}->removeListenerSingleThreaded($eventListenerInterface);
        $self->{downGameKeyEventHandler}->removeListenerSingleThreaded($eventListenerInterface);
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::input::event::PressGameKeyEventHandler;
use org::allbinary::game::input::event::UpGameKeyEventHandler;
use org::allbinary::game::input::event::DownGameKeyEventHandler;

1;

