# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::input::event::RawKeyEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::event::RawKeyEventHandler'->new();
our $TOTAL_LISTENERS = "Total Listeners: ";
our $LISTENER_LABEL = " Listener: ";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{eventListenerInterfaceList} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::event::RawKeyEventHandler::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{eventListenerInterfaceList} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub removeAllListeners {
    my ($self) = @_;
        $self->{eventListenerInterfaceList} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub addListeners {
    my ($self, $vector) = @_;
        my $eventListenerInterface = undef;
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            $eventListenerInterface = $vector->get($index);
            $self->addListener($eventListenerInterface);
        }
}


sub addListenerSingleThreaded {
    my ($self, $eventListenerInterface) = @_;
        if (!$self->{eventListenerInterfaceList}->contains($eventListenerInterface)) {
            $self->{eventListenerInterfaceList}->add($eventListenerInterface);
        }
}


sub addListener {
    my ($self, $eventListenerInterface) = @_;
        if (!$self->{eventListenerInterfaceList}->contains($eventListenerInterface)) {
            $self->{eventListenerInterfaceList}->add($eventListenerInterface);
        }
}


sub removeListenerSingleThreaded {
    my ($self, $eventListenerInterface) = @_;
        $self->{eventListenerInterfaceList}->remove($eventListenerInterface);
}


sub removeListener {
    my ($self, $eventListenerInterface) = @_;
        $self->{eventListenerInterfaceList}->remove($eventListenerInterface);
}


# throws Exception
sub fireEvent {
    my ($self, $keyCode, $deviceId, $repeated) = @_;
        my $eventListenerInterface = undef;
        my $index = 0;
        while ($index < $self->{eventListenerInterfaceList}->size()) {
            try {
                $eventListenerInterface = $self->{eventListenerInterfaceList}->get($index);
                $self->process($keyCode, $deviceId, $repeated, $eventListenerInterface);
            } catch ($e) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
            $index++;
        }
}


# throws Exception
sub process {
    my ($self, $keyCode, $deviceId, $repeated, $eventListenerInterface) = @_;
        $eventListenerInterface->onEventRaw($keyCode, $deviceId, $repeated);
}


sub getEventListenerInterfaceListP {
    my ($self) = @_;
        return $self->{eventListenerInterfaceList};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($org::allbinary::game::input::event::RawKeyEventHandler::TOTAL_LISTENERS);
        $stringBuffer->appendint($self->{eventListenerInterfaceList}->size());
        my $eventListenerInterface = undef;
        my $index = 0;
        while ($index < $self->{eventListenerInterfaceList}->size()) {
            try {
                $eventListenerInterface = $self->{eventListenerInterfaceList}->get($index);
                $stringBuffer->append($org::allbinary::game::input::event::RawKeyEventHandler::LISTENER_LABEL);
                $stringBuffer->append($eventListenerInterface->toString());
            } catch ($e) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{TOSTRING}, $e);
            }
            $index++;
        }
        return $stringBuffer->toString();
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

