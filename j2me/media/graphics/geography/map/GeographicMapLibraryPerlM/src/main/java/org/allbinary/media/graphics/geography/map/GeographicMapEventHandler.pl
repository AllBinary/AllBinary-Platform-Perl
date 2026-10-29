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

package org::allbinary::media::graphics::geography::map::GeographicMapEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler';

our $instance = 'org::allbinary::media::graphics::geography::map::GeographicMapEventHandler'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::GeographicMapEventHandler::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub addListener {
    my ($self, $gameLayer) = @_;
        if (!$self->{list}->contains($gameLayer)) {
            $self->{list}->add($gameLayer);
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


sub fireEvent {
    my ($self) = @_;
        for (my $index = $self->{list}->size(); --$index >= 0; ) {
            try {
                my $gameLayer = $self->{list}->get($index);
                $gameLayer->move();
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::logic::util::event::EventStrings'->getInstance()->{FIRE_EVENT}, $e);
            }
        }
}

use org::allbinary::game::layer::AllBinaryGameLayer;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::handler::BasicEventHandler;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

