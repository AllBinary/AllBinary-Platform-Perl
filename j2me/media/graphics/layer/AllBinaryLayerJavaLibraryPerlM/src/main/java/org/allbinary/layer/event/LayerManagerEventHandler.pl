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

package org::allbinary::layer::event::LayerManagerEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler';

our $instance = 'org::allbinary::layer::event::LayerManagerEventHandler'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{CREATE} = "Create";
    $self->{DELETE} = "Delete";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::layer::event::LayerManagerEventHandler::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub addListener {
    my ($self, $layerManagerEventListener) = @_;
        if (!$self->{list}->contains($layerManagerEventListener)) {
            $self->{list}->add($layerManagerEventListener);
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
                my $layerManagerEventListener = $self->{list}->{objectArray}->[$index];
                $layerManagerEventListener->onCreateLayerManagerEvent($eventObject);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
        }
        $self->SUPER::fireEvent($eventObject);
}


# throws Exception
sub fireDeleteEvent {
    my ($self, $eventObject) = @_;
        for (my $index = $self->{list}->size(); --$index >= 0; ) {
            try {
                my $layerManagerEventListener = $self->{list}->{objectArray}->[$index];
                $layerManagerEventListener->onDeleteLayerManagerEvent($eventObject);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
        }
        my $eventListenerInterfaceList = $self->{eventListenerInterfaceList};
        my $eventListenerInterface = undef;
        my $layerManagerEventListenerInterface = undef;
        my $index = 0;
        while ($index < $eventListenerInterfaceList->size()) {
            try {
                $eventListenerInterface = $eventListenerInterfaceList->{objectArray}->[$index];
                $layerManagerEventListenerInterface = ($eventListenerInterface);
                $layerManagerEventListenerInterface->onDeleteLayerManagerEvent($eventObject);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
            $index++;
        }
}


# throws Exception
sub process {
    my ($self, $eventObject, $eventListenerInterface) = @_;
        my $layerManagerEventListenerInterface = ($eventListenerInterface);
        $layerManagerEventListenerInterface->onCreateLayerManagerEvent($eventObject);
}

use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::logic::util::event::handler::BasicEventHandler;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

