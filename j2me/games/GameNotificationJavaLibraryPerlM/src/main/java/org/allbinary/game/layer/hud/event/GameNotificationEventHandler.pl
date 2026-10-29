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

package org::allbinary::game::layer::hud::event::GameNotificationEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler';

our $instance = 'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{enabled} = 1;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub removeAllListeners {
    my ($self) = @_;
        my $eventListenerInterface = $org::allbinary::logic::util::event::NullEventListener::NULL_EVENT_LISTENER;
        my $list = $self->{eventListenerInterfaceList};
        if ($list->size() > 0) {
            $eventListenerInterface = $list->{objectArray}->[0];
        }
        $self->SUPER::removeAllListeners();
        if ($eventListenerInterface != $org::allbinary::logic::util::event::NullEventListener::NULL_EVENT_LISTENER) {
            $self->addListenerInterface($eventListenerInterface);
        }
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::hud::event::GameNotificationEventHandler::instance;
}


# throws Exception
sub process {
    my ($self, $eventObject, $eventListenerInterface) = @_;
        if (!$self->{enabled}) {
            return;
        }
        my $gameNotificationListenerInterface = $eventListenerInterface;
        $gameNotificationListenerInterface->onGameNotificationEvent($eventObject);
}

use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::NullEventListener;
use org::allbinary::logic::util::event::handler::BasicEventHandler;
use org::allbinary::util::BasicArrayList;

1;

