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

package org::allbinary::game::ag::ai::scroller::TerrainPatrolAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ag::ai::scroller::PacePatrolAI';


sub _init_fields {
    my ($self) = @_;
    $self->{terrainEventListener} = 'org::allbinary::game::terrain::TerrainEventListener'->new();
    $self->{DOWN} = 'org::allbinary::math::AngleFactory'->getInstance()->{DOWN};
    $self->{CLIFF} = 'org::allbinary::game::terrain::BasicTerrainInfo'->new($self->{DOWN});
}


sub new {
    my ($class, $hashtable, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($hashtable, $ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        'org::allbinary::game::terrain::TerrainEventHandler'->getInstance($ownerLayerInterface)->addListener($self->{terrainEventListener});
        $self->{terrainEventListener}->onTerrainEvent('org::allbinary::game::terrain::TerrainEventCircularStaticPool'->getInstance()->getNext($self->{CLIFF}));
    return $self;
}


sub update {
    my ($self) = @_;
        $self->SUPER::update();
        $self->changeDirectionIfCliffReached();
}


sub changeDirectionIfCliffReached {
    my ($self) = @_;
        my $list = $self->{terrainEventListener}->getList();
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            my $terrainEvent = $list->removeAt($index);
            my $basicTerrainInfo = $terrainEvent->getBasicTerrainInfo();
            my $angle = $basicTerrainInfo->getAngle();
            if ($angle == $self->{DOWN}) {
                $self->nextDirection();
                if (!$self->{isFollowLimitedByTerrain}) {
                    $self->{logUtil}->putF("Following Limited", $self, "onTerrainEvent");
                    $self->{isFollowLimitedByTerrain} = 1;
                }
            }
        }
}

use org::allbinary::game::input::GameInput;
use org::allbinary::game::terrain::BasicTerrainInfo;
use org::allbinary::game::terrain::TerrainEvent;
use org::allbinary::game::terrain::TerrainEventCircularStaticPool;
use org::allbinary::game::terrain::TerrainEventHandler;
use org::allbinary::game::terrain::TerrainEventListener;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::math::Angle;
use org::allbinary::math::AngleFactory;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::ag::ai::scroller::PacePatrolAI;

1;

