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

package org::allbinary::game::terrain::TerrainEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler';

our $hashtable = 'org::allbinary::logic::StdUtil'->getInstance()->{NULL_TABLE};

sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub init {
    my ($class) = @_;
        $org::allbinary::game::terrain::TerrainEventHandler::hashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
}


sub getInstance {
    my ($class, $anyType) = @_;
        my $eventHandlerCanBeNull = $org::allbinary::game::terrain::TerrainEventHandler::hashtable->get($anyType);
        if (!defined($eventHandlerCanBeNull)) {
            $eventHandlerCanBeNull = 'org::allbinary::game::terrain::TerrainEventHandler'->new();
            $org::allbinary::game::terrain::TerrainEventHandler::hashtable->put($anyType, $eventHandlerCanBeNull);
        }
        return $eventHandlerCanBeNull;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub addListener {
    my ($self, $terrainEventListener) = @_;
        if (!$self->{list}->contains($terrainEventListener)) {
            $self->{list}->add($terrainEventListener);
        }
}


sub removeAllListeners {
    my ($self) = @_;
        $self->{list}->clear();
        $self->SUPER::removeAllListeners();
}


sub removeListener {
    my ($self, $eventListenerInterface) = @_;
        $self->{list}->remove($eventListenerInterface);
        $self->SUPER::removeListener($eventListenerInterface);
}


# throws Exception
sub fireEvent {
    my ($self, $eventObject) = @_;
        for (my $index = $self->{list}->size(); --$index >= 0; ) {
            try {
                my $terrainEventListener = $self->{list}->get($index);
                $terrainEventListener->onTerrainEvent($eventObject);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
        }
        $self->SUPER::fireEvent($eventObject);
}


# throws Exception
sub process {
    my ($self, $eventObject, $eventListenerInterface) = @_;
        my $terrainEventListenerInterface = $eventListenerInterface;
        $terrainEventListenerInterface->onTerrainEvent($eventObject);
}

use org::allbinary::logic::StdUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::logic::util::event::handler::BasicEventHandler;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

