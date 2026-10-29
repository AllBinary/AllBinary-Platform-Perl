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

package org::allbinary::input::event::VirtualKeyboardEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler';

our $gameKeyEventHandler = 'org::allbinary::input::event::VirtualKeyboardEventHandler'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{SHOW_EVENT} = 'org::allbinary::input::event::VirtualKeyboardEvent'->new('org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{TRUE});
    $self->{HIDE_EVENT} = 'org::allbinary::input::event::VirtualKeyboardEvent'->new('org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::event::VirtualKeyboardEventHandler::gameKeyEventHandler;
}


# throws Exception
sub process {
    my ($self, $eventObject, $eventListenerInterface) = @_;
        my $virtualKeyboardEventListenerInterface = $eventListenerInterface;
        $virtualKeyboardEventListenerInterface->onVirtualKeyboardEvent($eventObject);
}


sub open {
    my ($self) = @_;
        try {
            Time::HiRes::sleep((120) / 1000);
            $self->fireEvent($self->{SHOW_EVENT});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "open", $e);
        }
}


# throws Exception
sub close {
    my ($self) = @_;
        try {
            Time::HiRes::sleep((120) / 1000);
            $self->fireEvent($self->{HIDE_EVENT});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CLOSE}, $e);
        }
}

use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::handler::BasicEventHandler;
use org::allbinary::input::event::VirtualKeyboardEvent;
use java::lang::Thread;

1;

