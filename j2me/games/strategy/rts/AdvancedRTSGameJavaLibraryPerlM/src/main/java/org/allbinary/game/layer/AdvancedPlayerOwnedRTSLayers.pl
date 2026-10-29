# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::AdvancedPlayerOwnedRTSLayers;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::PlayerOwnedRTSLayers';


sub _init_fields {
    my ($self) = @_;
    $self->{unitsList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{waypointsList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{buildingList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{baseList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{garrisonList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{houseList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{labList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{factoryList} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub addUnit {
    my ($self, $rtsLayer) = @_;
        $self->{unitsList}->add($rtsLayer);
        $self->{rtsLayerList}->add($rtsLayer);
}


sub addWaypoint {
    my ($self, $rtsLayer) = @_;
        $self->{waypointsList}->add($rtsLayer);
        $self->{rtsLayerList}->add($rtsLayer);
}


sub addBase {
    my ($self, $rtsLayer) = @_;
        $self->{baseList}->add($rtsLayer);
        $self->{buildingList}->add($rtsLayer);
        $self->{rtsLayerList}->add($rtsLayer);
}


sub addGarrison {
    my ($self, $rtsLayer) = @_;
        $self->{garrisonList}->add($rtsLayer);
        $self->{buildingList}->add($rtsLayer);
        $self->{rtsLayerList}->add($rtsLayer);
}


sub addHouse {
    my ($self, $rtsLayer) = @_;
        $self->{houseList}->add($rtsLayer);
        $self->{buildingList}->add($rtsLayer);
        $self->{rtsLayerList}->add($rtsLayer);
}


sub addLab {
    my ($self, $rtsLayer) = @_;
        $self->{labList}->add($rtsLayer);
        $self->{buildingList}->add($rtsLayer);
        $self->{rtsLayerList}->add($rtsLayer);
}


sub addFactory {
    my ($self, $rtsLayer) = @_;
        $self->{factoryList}->add($rtsLayer);
        $self->{buildingList}->add($rtsLayer);
        $self->{rtsLayerList}->add($rtsLayer);
}


sub removeUnit {
    my ($self, $gameLayer) = @_;
        $self->{unitsList}->remove($gameLayer);
        $self->{rtsLayerList}->remove($gameLayer);
}


sub removeWaypoint {
    my ($self, $gameLayer) = @_;
        $self->{waypointsList}->remove($gameLayer);
        $self->{rtsLayerList}->remove($gameLayer);
}


sub getUnitsList {
    my ($self) = @_;
        return $self->{unitsList};
}


sub getWaypointsList {
    my ($self) = @_;
        return $self->{waypointsList};
}


sub getBaseList {
    my ($self) = @_;
        return $self->{baseList};
}


sub getGarrisonList {
    my ($self) = @_;
        return $self->{garrisonList};
}


sub getHouseList {
    my ($self) = @_;
        return $self->{houseList};
}


sub getLabList {
    my ($self) = @_;
        return $self->{labList};
}


sub getFactoryList {
    my ($self) = @_;
        return $self->{factoryList};
}


sub getTotalBuildings {
    my ($self) = @_;
        return $self->{baseList}->size() + $self->{garrisonList}->size() + $self->{houseList}->size() + $self->{labList}->size() + $self->{factoryList}->size();
}


sub removeBuilding {
    my ($self, $layerInterface) = @_;
        $self->{buildingList}->add($layerInterface);
        if ($self->getBaseList()->remove($layerInterface)) {
            $self->{rtsLayerList}->remove($layerInterface);
        } elsif ($self->getFactoryList()->remove($layerInterface)) {
            $self->{rtsLayerList}->remove($layerInterface);
        } elsif ($self->getGarrisonList()->remove($layerInterface)) {
            $self->{rtsLayerList}->remove($layerInterface);
        } elsif ($self->getLabList()->remove($layerInterface)) {
            $self->{rtsLayerList}->remove($layerInterface);
        } elsif ($self->getHouseList()->remove($layerInterface)) {
            $self->{rtsLayerList}->remove($layerInterface);
        }
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->SUPER::toString());
        $stringBuffer->append(" Bases: ");
        $stringBuffer->appendint($self->getBaseList()->size());
        $stringBuffer->append(" Factory: ");
        $stringBuffer->appendint($self->getFactoryList()->size());
        $stringBuffer->append(" Garrison: ");
        $stringBuffer->appendint($self->getGarrisonList()->size());
        $stringBuffer->append(" Labs: ");
        $stringBuffer->appendint($self->getLabList()->size());
        $stringBuffer->append(" Houses: ");
        $stringBuffer->appendint($self->getHouseList()->size());
        $stringBuffer->append(" Waypoints: ");
        $stringBuffer->appendint($self->getWaypointsList()->size());
        $stringBuffer->append(" Units: ");
        $stringBuffer->appendint($self->getUnitsList()->size());
        return $stringBuffer->toString();
}


sub getBuildingList {
    my ($self) = @_;
        return $self->{buildingList};
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::layer::PlayerOwnedRTSLayers;

1;

