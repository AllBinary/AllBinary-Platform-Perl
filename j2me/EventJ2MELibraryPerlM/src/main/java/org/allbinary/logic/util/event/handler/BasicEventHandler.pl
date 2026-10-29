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


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{eventStrings} = 'org::allbinary::logic::util::event::EventStrings'->getInstance();
    $self->{eventListenerInterfaceList} = undef;
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
            $self->addListenerInterface($eventListenerInterface);
        }
}


sub removeListeners {
    my ($self, $vector) = @_;
        my $eventListenerInterface = undef;
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            $eventListenerInterface = $vector->get($index);
            $self->removeListener($eventListenerInterface);
        }
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
        my $eventListenerInterface = undef;
        my $index = 0;
        while ($index < $self->{eventListenerInterfaceList}->size()) {
            try {
                $eventListenerInterface = $self->{eventListenerInterfaceList}->get($index);
                $self->process($eventObject, $eventListenerInterface);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{eventStrings}->{FIRE_EVENT}, $e);
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


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{eventStrings}->{TOTAL_LISTENERS});
        $stringBuffer->appendint($self->{eventListenerInterfaceList}->size());
        my $eventListenerInterface = undef;
        my $index = 0;
        while ($index < $self->{eventListenerInterfaceList}->size()) {
            try {
                $eventListenerInterface = $self->{eventListenerInterfaceList}->get($index);
                $stringBuffer->append($self->{eventStrings}->{LISTENER_LABEL});
                $stringBuffer->append($eventListenerInterface->toString());
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{TOSTRING}, $e);
            }
            $index++;
        }
        return $stringBuffer->toString();
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
# use jsinterop::annotations::JsProperty;
use org::allbinary::logic::util::event::handler::BasicEventHandlerInterface;

1;

