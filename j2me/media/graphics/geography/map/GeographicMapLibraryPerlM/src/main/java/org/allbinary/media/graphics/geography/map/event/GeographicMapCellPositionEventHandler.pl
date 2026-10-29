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

package org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler';

our $instance = 'org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEventHandler'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEventHandler::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub addListener {
    my ($self, $miniMapLayer) = @_;
        if (!$self->{list}->contains($miniMapLayer)) {
            $self->{list}->add($miniMapLayer);
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
                my $miniMapLayer = $self->{list}->get($index);
                $miniMapLayer->onGeographicMapCellPositionEvent($eventObject);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
        }
        $self->SUPER::fireEvent($eventObject);
}


# throws Exception
sub fireRemoveEvent {
    my ($self, $eventObject) = @_;
        my $list = $self->{eventListenerInterfaceList};
        for (my $index = $self->{list}->size(); --$index >= 0; ) {
            try {
                my $miniMapLayer = $self->{list}->get($index);
                $miniMapLayer->onRemoveGeographicMapCellPositionEvent($eventObject);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
        }
        my $eventListenerInterface = undef;
        my $geographicMapCellPositionEventListenerInterface = undef;
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            try {
                $eventListenerInterface = $list->get($index);
                $geographicMapCellPositionEventListenerInterface = ($eventListenerInterface);
                $geographicMapCellPositionEventListenerInterface->onRemoveGeographicMapCellPositionEvent($eventObject);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
        }
}


# throws Exception
sub process {
    my ($self, $eventObject, $eventListenerInterface) = @_;
        my $geographicMapCellPositionEventListenerInterface = ($eventListenerInterface);
        $geographicMapCellPositionEventListenerInterface->onGeographicMapCellPositionEvent($eventObject);
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::layer::geographic::map::MiniMapLayer;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::logic::util::event::handler::BasicEventHandler;

1;

