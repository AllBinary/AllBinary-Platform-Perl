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

package org::allbinary::game::terrain::TerrainEventCircularStaticPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::terrain::TerrainEventCircularStaticPool'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EVENT_POOL} = 'org::allbinary::logic::util::event::AllBinaryEventCircularPool'->new(20);
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::terrain::TerrainEventCircularStaticPool::instance;
}


sub init {
    my ($self) = @_;
        $self->{EVENT_POOL}->initAllBinaryEventCircularPool('org::allbinary::game::terrain::TerrainEventFactory'->new());
}


# throws Exception
sub getNext {
    my ($self, $basicTerrainInfo) = @_;
        my $trackingEvent = $self->{EVENT_POOL}->getNextInstance();
        $trackingEvent->setBasicTerrainInfoForCircularStaticPool($basicTerrainInfo);
        return $trackingEvent;
}

use org::allbinary::logic::util::event::AllBinaryEventCircularPool;
use org::allbinary::game::terrain::TerrainEventFactory;

1;

