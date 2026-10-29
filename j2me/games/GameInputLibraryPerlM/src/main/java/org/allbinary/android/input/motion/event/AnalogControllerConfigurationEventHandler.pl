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

package org::allbinary::android::input::motion::event::AnalogControllerConfigurationEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler';

our $instance = 'org::allbinary::android::input::motion::event::AnalogControllerConfigurationEventHandler'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::android::input::motion::event::AnalogControllerConfigurationEventHandler::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub addListener {
    my ($self, $analogControllerConfigurationEventListenerInterface) = @_;
        if (!$self->{list}->contains($analogControllerConfigurationEventListenerInterface)) {
            $self->{list}->add($analogControllerConfigurationEventListenerInterface);
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
                my $playerGameInput = $self->{list}->{objectArray}->[$index];
                $playerGameInput->onAnalogControllerConfigurationEvent($eventObject);
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
        }
        $self->SUPER::fireEvent($eventObject);
}


# throws Exception
sub process {
    my ($self, $eventObject, $eventListenerInterface) = @_;
        my $analogControllerConfigurationEventListenerInterface = ($eventListenerInterface);
        $analogControllerConfigurationEventListenerInterface->onAnalogControllerConfigurationEvent($eventObject);
}

use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::logic::util::event::handler::BasicEventHandler;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

