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

package org::allbinary::game::input::event::DownKeyEventHandlerBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler';

our $TOTAL_LISTENERS = " Total PlayerGameInput Listeners: ";
our $LISTENER_LABEL = " PlayerGameInput Listener: ";

sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub addListener {
    my ($self, $playerGameInput) = @_;
        if (!$self->{list}->contains($playerGameInput)) {
            $self->{list}->add($playerGameInput);
        }
}


sub removeAllListeners {
    my ($self) = @_;
        $self->{list}->clear();
        $self->SUPER::removeAllListeners();
}


sub removeListenerSingleThreaded {
    my ($self, $eventListenerInterface) = @_;
        $self->{list}->remove($eventListenerInterface);
        $self->SUPER::removeListenerSingleThreaded($eventListenerInterface);
}


sub removeListener {
    my ($self, $eventListenerInterface) = @_;
        $self->{list}->remove($eventListenerInterface);
        $self->SUPER::removeListener($eventListenerInterface);
}


# throws Exception
sub fireEventI {
    my ($self, $eventObject) = @_;
        for (my $index = $self->{list}->size(); --$index >= 0; ) {
            try {
                my $playerGameInput = $self->{list}->{objectArray}->[$index];
                $playerGameInput->onDownKey($eventObject);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
        }
        my $index = 0;
        my $eventListenerInterface = undef;
        while ($index < $self->{eventListenerInterfaceList}->size()) {
            try {
                $eventListenerInterface = $self->{eventListenerInterfaceList}->get($index);
                $self->processI($eventObject, $eventListenerInterface);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
            $index++;
        }
}


# throws Exception
sub fireEventForGameKeyEvent {
    my ($self, $eventObject) = @_;
        my $size = $self->{list}->size();
        for (my $index = $size; --$index >= 0; ) {
            try {
                my $playerGameInput = $self->{list}->{objectArray}->[$index];
                $playerGameInput->onDownKeyEvent($eventObject);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
        }
        my $index = 0;
        my $eventListenerInterface = undef;
        while ($index < $self->{eventListenerInterfaceList}->size()) {
            try {
                $eventListenerInterface = $self->{eventListenerInterfaceList}->get($index);
                $self->processEvent($eventObject, $eventListenerInterface);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
            $index++;
        }
}


# throws Exception
sub processI {
    my ($self, $eventObject, $eventListenerInterface) = @_;
        my $downKeyEventListenerInterface = $eventListenerInterface;
        $downKeyEventListenerInterface->onDownKey($eventObject);
}


# throws Exception
sub processEvent {
    my ($self, $eventObject, $eventListenerInterface) = @_;
        my $downKeyEventListenerInterface = $eventListenerInterface;
        $downKeyEventListenerInterface->onDownKeyEvent($eventObject);
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->SUPER::toString());
        $stringBuffer->append($org::allbinary::game::input::event::DownKeyEventHandlerBase::TOTAL_LISTENERS);
        $stringBuffer->appendint($self->{list}->size());
        my $eventListenerInterface = undef;
        for (my $index = 0; $index < $self->{list}->size(); $index++) {
            try {
                $eventListenerInterface = $self->{list}->get($index);
                $stringBuffer->append($org::allbinary::game::input::event::DownKeyEventHandlerBase::LISTENER_LABEL);
                $stringBuffer->append($eventListenerInterface->toString());
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{TOSTRING}, $e);
            }
        }
        return $stringBuffer->toString();
}

use org::allbinary::game::input::PlayerGameInput;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::logic::util::event::handler::BasicEventHandler;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

