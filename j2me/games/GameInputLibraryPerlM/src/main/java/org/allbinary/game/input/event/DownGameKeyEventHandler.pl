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

package org::allbinary::game::input::event::DownGameKeyEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::event::DownGameKeyEventHandlerBase';

our $instance = 'org::allbinary::game::input::event::DownGameKeyEventHandler'->new();
our $instanceArray = ['org::allbinary::game::input::event::DownGameKeyEventHandlerBase'->new(), 'org::allbinary::game::input::event::DownGameKeyEventHandlerBase'->new(), 'org::allbinary::game::input::event::DownGameKeyEventHandlerBase'->new(), 'org::allbinary::game::input::event::DownGameKeyEventHandlerBase'->new(), 'org::allbinary::game::input::event::DownGameKeyEventHandlerBase'->new(), 'org::allbinary::game::input::event::DownGameKeyEventHandlerBase'->new()];

sub _init_fields {
    my ($self) = @_;
    $self->{playerInputIdFactory} = 'org::allbinary::game::input::LocalPlayerInputIdFactory'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::event::DownGameKeyEventHandler::instance;
}


sub getInstanceForDevice {
    my ($self, $deviceId) = @_;
        my $playerInputId = $self->{playerInputIdFactory}->getPlayerForDevice($deviceId);
        return $org::allbinary::game::input::event::DownGameKeyEventHandler::instanceArray->[$playerInputId];
}


sub getInstanceForPlayer {
    my ($self, $playerInputId) = @_;
        return $org::allbinary::game::input::event::DownGameKeyEventHandler::instanceArray->[$playerInputId];
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub removeAllListeners {
    my ($self) = @_;
        $self->SUPER::removeAllListeners();
        for (my $index = scalar(@{$org::allbinary::game::input::event::DownGameKeyEventHandler::instanceArray}) - 1; $index >= 0; $index--) {
            $org::allbinary::game::input::event::DownGameKeyEventHandler::instanceArray->[$index]->removeAllListeners();
        }
}


sub removeListenerSingleThreaded {
    my ($self, $eventListenerInterface) = @_;
        $self->SUPER::removeListenerSingleThreaded($eventListenerInterface);
        for (my $index = scalar(@{$org::allbinary::game::input::event::DownGameKeyEventHandler::instanceArray}) - 1; $index >= 0; $index--) {
            $org::allbinary::game::input::event::DownGameKeyEventHandler::instanceArray->[$index]->removeListenerSingleThreaded($eventListenerInterface);
        }
}


sub removeListener {
    my ($self, $eventListenerInterface) = @_;
        $self->SUPER::removeListener($eventListenerInterface);
        for (my $index = scalar(@{$org::allbinary::game::input::event::DownGameKeyEventHandler::instanceArray}) - 1; $index >= 0; $index--) {
            $org::allbinary::game::input::event::DownGameKeyEventHandler::instanceArray->[$index]->removeListener($eventListenerInterface);
        }
}

use org::allbinary::game::input::LocalPlayerInputIdFactory;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::game::input::event::DownGameKeyEventHandlerBase;

1;

