# Generated Code Do Not Modify

package org::allbinary::game::terrain::TerrainEventListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::terrain::TerrainEventListenerInterface';


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


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onTerrainEvent {
    my ($self, $terrainEvent) = @_;
        $self->{list}->clear();
        $self->{list}->add($terrainEvent);
}


sub getList {
    my ($self) = @_;
        return $self->{list};
}

use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::terrain::TerrainEventListenerInterface;

1;

