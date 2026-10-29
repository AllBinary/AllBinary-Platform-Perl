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

package org::allbinary::game::displayable::GameLevelDisplayChangeEventListenersFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::displayable::GameLevelDisplayChangeEventListenersFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::displayable::GameLevelDisplayChangeEventListenersFactory::instance;
}


sub add {
    my ($self, $displayChangeEventListener) = @_;
        $self->{list}->add($displayChangeEventListener);
        'org::allbinary::graphics::displayable::event::DisplayChangeEventHandler'->getInstance()->addListenerInterface($displayChangeEventListener);
}


sub clear {
    my ($self) = @_;
        my $displayChangeEventHandler = 'org::allbinary::graphics::displayable::event::DisplayChangeEventHandler'->getInstance();
        my $displayChangeEventListener = undef;
        for (my $index = $self->{list}->size(); --$index >= 0; ) {
            $displayChangeEventListener = $self->{list}->{objectArray}->[$index];
            $displayChangeEventHandler->removeListener($displayChangeEventListener);
        }
        $self->{list}->clear();
}

use org::allbinary::graphics::displayable::event::DisplayChangeEventHandler;
use org::allbinary::graphics::displayable::event::DisplayChangeEventListener;
use org::allbinary::logic::util::event::handler::BasicEventHandler;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

