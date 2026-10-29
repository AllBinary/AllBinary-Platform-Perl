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

package org::allbinary::game::input::SelectAdvancedRTSLayerVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::visitor::Visitor';


sub _init_fields {
    my ($self) = @_;
    $self->{selectedRTSLayersPlayerGameInput} = undef;
}


sub new {
    my ($class, $selectedRTSLayersPlayerGameInput) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{selectedRTSLayersPlayerGameInput} = $selectedRTSLayersPlayerGameInput;
    return $self;
}


sub visit {
    my ($self, $anyType) = @_;
        my $selectedLayer = $anyType;
        if ($selectedLayer != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance() && $selectedLayer->getType() == 'org::allbinary::game::layer::building::BuildingLayer'->getStaticType()) {
            my $rtsGameLayer = $selectedLayer;
            my $assignWaypointsUtil = 'org::allbinary::game::input::form::AssignWaypointsUtil'->getInstance();
            my $list = $self->{selectedRTSLayersPlayerGameInput}->getSelectedBasicArrayList();
            my $currentRTSLayer = undef;
            my $unitLayer = undef;
            for (my $index = $list->size() - 1; $index >= 0; $index--) {
                $currentRTSLayer = $list->get($index);
                if ($currentRTSLayer->getType() == 'org::allbinary::game::layer::unit::UnitLayer'->getStaticType()) {
                    $unitLayer = $currentRTSLayer;
                    $unitLayer->setParentLayer($rtsGameLayer);
                    $assignWaypointsUtil->set($unitLayer, $rtsGameLayer);
                }
            }
        }
        return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
}

use org::allbinary::game::input::form::AssignWaypointsUtil;
use org::allbinary::game::layer::AdvancedRTSGameLayer;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::building::BuildingLayer;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::game::layer::unit::UnitLayer;
use org::allbinary::logic::NullUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::util::visitor::Visitor;

1;

