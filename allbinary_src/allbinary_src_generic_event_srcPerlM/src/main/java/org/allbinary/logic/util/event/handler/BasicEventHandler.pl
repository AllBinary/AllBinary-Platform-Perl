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

package org::allbinary::logic::util::event::handler::BasicEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandlerInterface';

our $PERFORMANCE_MESSAGE = "Use Custom onEvent Methods for needed optimization";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{eventListenerInterfaceList} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{eventListenerInterfaceList} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $LISTENER = " Listener: ";
        $stringBuffer->append("Total Listeners: ");
        $stringBuffer->appendint($self->{eventListenerInterfaceList}->size());
        my $eventListenerInterface = undef;
        my $index = 0;
        while ($index < $self->{eventListenerInterfaceList}->size()) {
            try {
                $eventListenerInterface = $self->{eventListenerInterfaceList}->{objectArray}->[$index];
                $stringBuffer->append($LISTENER);
                $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($eventListenerInterface));
            } catch ($e) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{TOSTRING}, $e);
            }
            $index++;
        }
        return $stringBuffer->toString();
}


sub removeAllListeners {
    my ($self) = @_;
        $self->{eventListenerInterfaceList} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub addListenerSingleThreaded {
    my ($self, $eventListenerInterface) = @_;
        if (!$self->{eventListenerInterfaceList}->contains($eventListenerInterface)) {
            $self->{eventListenerInterfaceList}->add($eventListenerInterface);
        }
}


sub addListenerInterface {
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
    my ($self, $eventObject) = @_;
        my $index = 0;
        my $eventListenerInterface = undef;
        while ($index < $self->{eventListenerInterfaceList}->size()) {
            try {
                $eventListenerInterface = $self->{eventListenerInterfaceList}->{objectArray}->[$index];
                $self->process($eventObject, $eventListenerInterface);
            } catch ($e) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
            $index++;
        }
}


# throws Exception
sub process {
    my ($self, $eventObject, $eventListenerInterface) = @_;
        $eventListenerInterface->onEvent($eventObject);
}


sub getEventListenerInterfaceListP {
    my ($self) = @_;
        return $self->{eventListenerInterfaceList};
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::util::event::handler::BasicEventHandlerInterface;

1;

