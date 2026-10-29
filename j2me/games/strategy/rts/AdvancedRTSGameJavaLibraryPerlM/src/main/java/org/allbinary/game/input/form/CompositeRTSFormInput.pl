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

package org::allbinary::game::input::form::CompositeRTSFormInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::form::RTSFormInput';


sub _init_fields {
    my ($self) = @_;
    $self->{rtsFormInputArray} = undef;
    $self->{itemIndex} = undef;
    $self->{isPrimaryWaypointCreator} = undef;
}


sub new {
    my ($class, $groupInterface, $isPrimaryWaypointCreator, $itemIndex) = @_;
    my $self = $class->SUPER::new($groupInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{itemIndex} = $itemIndex;
        $self->{isPrimaryWaypointCreator} = $isPrimaryWaypointCreator;
        $self->{rtsFormInputArray} = [(undef) x (2)];
        $self->{rtsFormInputArray}->[0] = 'org::allbinary::game::input::form::WaypointRTSFormInput'->new($self->{groupInterfaceArray}, $isPrimaryWaypointCreator);
        $self->{rtsFormInputArray}->[1] = 'org::allbinary::game::input::form::UnitRTSFormInput'->new($self->{groupInterfaceArray});
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->SUPER::setAllBinaryGameLayerManager($allBinaryGameLayerManager);
        my $geographicMapCompositeInterface = $allBinaryGameLayerManager;
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        my $size = scalar(@{$self->{rtsFormInputArray}});
        for (my $index = 0; $index < $size; $index++) {
            $self->{rtsFormInputArray}->[$index]->setAllBinaryGameLayerManager($allBinaryGameLayerManager);
        }
}


# throws Exception
sub processAtPoint {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $point) = @_;
        my $scrollSelectionForm = $rtsPlayerLayerInterface->getCurrentScrollSelectionForm();
        my $index = $scrollSelectionForm->getSelectedIndexForPoint($point);
        if ($self->isStickyItemSelected() && $associatedRtsLayer == 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            if ($self->getSelectedStickyItemIndex() <= $self->{itemIndex}->[0]) {
                $self->{rtsFormInputArray}->[0]->processAtPoint($associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $point);
            }
        } elsif ($index > $self->{itemIndex}->[0]) {
            $self->{rtsFormInputArray}->[1]->processAtPoint($associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $point);
        }
}


# throws Exception
sub processGameSpecific {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $index) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{INDEX_LABEL} + $index . " > " . $self->{itemIndex}->[0], $self, $commonStrings->{PROCESS});
        if ($self->isStickyItemSelected() && $associatedRtsLayer == 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            if ($self->getSelectedStickyItemIndex() <= $self->{itemIndex}->[0]) {
                $self->{rtsFormInputArray}->[0]->processGameSpecific($associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $index);
            }
        } elsif ($index > $self->{itemIndex}->[0]) {
            $self->{rtsFormInputArray}->[1]->processGameSpecific($associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $index);
        }
}


# throws Exception
sub processSticky {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $point) = @_;
        return $self->{rtsFormInputArray}->[0]->processSticky($associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $point);
}


# throws Exception
sub processStickyGameSpecific {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $index) = @_;
        $self->{rtsFormInputArray}->[0]->processStickyGameSpecific($associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $index);
}


sub getSelectedStickyItemIndex {
    my ($self) = @_;
        return $self->{rtsFormInputArray}->[0]->getSelectedStickyItemIndex();
}


sub isStickyItemSelected {
    my ($self) = @_;
        return $self->{rtsFormInputArray}->[0]->isStickyItemSelected();
}


sub setStickyItemSelected {
    my ($self, $stickyItemSelected) = @_;
        $self->{rtsFormInputArray}->[0]->setStickyItemSelected($stickyItemSelected);
}


sub getSelectedStickyItem {
    my ($self) = @_;
        return $self->{rtsFormInputArray}->[0]->getSelectedStickyItem();
}


sub setSelectedStickyItem {
    my ($self, $selectedStickyItem) = @_;
        $self->{rtsFormInputArray}->[0]->setSelectedStickyItem($selectedStickyItem);
}

use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::identification::Group;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::string::CommonLabels;
use org::allbinary::game::input::form::RTSFormInput;
use org::allbinary::game::input::form::WaypointRTSFormInput;
use org::allbinary::game::input::form::UnitRTSFormInput;

1;

