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

package org::allbinary::game::ag::ai::scroller::FlockingAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI';


sub _init_fields {
    my ($self) = @_;
    $self->{allowedDistance} = undef;
}


sub new {
    my ($class, $hashtable, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        my $allowedDistance = $hashtable->get($org::allbinary::game::ag::ai::scroller::BasePatrolAI::MAX_DISTANCE);
        $self->{allowedDistance} = int($allowedDistance);
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        my $maxDistance = 0;
        my $farAllbinaryLayer = $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER;
        my $groupLayerManagerListener = 'org::allbinary::game::layer::identification::GroupLayerManagerListener'->getInstance();
        my $list = $groupLayerManagerListener->getList('org::allbinary::game::identification::BasicGroupFactory'->getInstance()->{ENEMY});
        my $size = $list->size();
        my $allBinaryLayer = undef;
        my $ownerLayerInterface = undef;
        for (my $index = 0; $index < $size; $index++) {
            $allBinaryLayer = $list->get($index);
            if ($allBinaryLayer->getType() != 'org::allbinary::game::layer::weapon::WeaponLayer'->getStaticType()) {
                my $distance = $self->getXYDistance($allBinaryLayer);
                if ($distance > $maxDistance) {
                    $maxDistance = $distance;
                    $farAllbinaryLayer = $allBinaryLayer;
                    if ($distance > $self->{allowedDistance}) {
                        last;
                    }
                }
            }
        }
        if ($maxDistance > $self->{allowedDistance}) {
            if ($farAllbinaryLayer != $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER) {
                $ownerLayerInterface = $self->getOwnerLayerInterface();
                if ($farAllbinaryLayer->getXP() < $ownerLayerInterface->getXP()) {
                    $self->processKeyAI($javax::microedition::lcdui::Canvas::LEFT);
                } elsif ($farAllbinaryLayer->getXP() > $ownerLayerInterface->getXP()) {
                    $self->processKeyAI($javax::microedition::lcdui::Canvas::RIGHT);
                } elsif ($farAllbinaryLayer->getYP() > $ownerLayerInterface->getYP()) {
                    $self->processKeyAI($javax::microedition::lcdui::Canvas::UP);
                } elsif ($farAllbinaryLayer->getYP() < $ownerLayerInterface->getYP()) {
                    $self->processKeyAI($javax::microedition::lcdui::Canvas::DOWN);
                }
            }
        }
}


sub getXYDistance {
    my ($self, $allBinaryLayer) = @_;
        my $ownerLayerInterface = $self->getOwnerLayerInterface();
        my $xTotalDistance = ($allBinaryLayer->getXP() + $allBinaryLayer->getHalfWidth()) - ($ownerLayerInterface->getXP() + $ownerLayerInterface->getHalfWidth());
        my $yTotalDistance = ($allBinaryLayer->getYP() + $allBinaryLayer->getHalfHeight()) - ($ownerLayerInterface->getYP() + $ownerLayerInterface->getHalfHeight());
        my $mathUtil = 'org::allbinary::logic::math::MathUtil'->getInstance();
        my $totalDistance = $mathUtil->abs($xTotalDistance) + $mathUtil->abs($yTotalDistance);
        return $totalDistance;
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::identification::BasicGroupFactory;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::layer::identification::GroupLayerManagerListener;
use org::allbinary::game::layer::weapon::WeaponLayer;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::math::MathUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::ag::ai::scroller::BasePatrolAI;

1;

