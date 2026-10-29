# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::input::form::RTSFormInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{groupCommonFactory} = 'org::allbinary::game::identification::GroupCommonFactory'->getInstance();
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
    $self->{newUnconstructedRTSLayerInterfaceArray} = [(undef) x (7)];
    $self->{groupInterfaceArray} = undef;
    $self->{selectedGeographicCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{stickyItemSelected} = 0;
    $self->{selectedStickyItemIndex} = 0;
    $self->{selectedStickyItem} = 'org::allbinary::graphics::form::item::ABCustomItem'->getNullInstance();
}


sub new {
    my ($class, $groupInterfaceArray) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $size = scalar(@{$self->{newUnconstructedRTSLayerInterfaceArray}});
        for (my $index = 0; $index < $size; $index++) {
            $self->{newUnconstructedRTSLayerInterfaceArray}->[$index] = 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance();
        }
        $self->{groupInterfaceArray} = $groupInterfaceArray;
        $self->{hashtable}->put('org::allbinary::direction::DirectionFactory'->getInstance()->{NAME}, 'org::allbinary::direction::DirectionFactory'->getInstance()->{DOWN});
        if (defined($groupInterfaceArray)) {
            $self->{hashtable}->put($self->{groupCommonFactory}->{ID}, $groupInterfaceArray);
        }
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
}


# throws Exception
sub processAtPoint {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $point) = @_;
        my $index = $self->getIndexAt($rtsPlayerLayerInterface, $point);
        if ($index < 0) {
            return;
        }
        my $scrollSelectionForm = $rtsPlayerLayerInterface->getCurrentScrollSelectionForm();
        my $item = $scrollSelectionForm->get($index);
        if (!defined($item)) {
            return;
        }
        $self->processGameSpecific($associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $index);
}


# throws Exception
sub process {
    my ($self, $layerManager) = @_;
        $self->setAllBinaryGameLayerManager($layerManager);
}


# throws Exception
sub processGameSpecific {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $index) = @_;
}


# throws Exception
sub processSticky {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $point) = @_;
        my $index = $self->getIndexAt($rtsPlayerLayerInterface, $point);
        if ($index < 0) {
            return 0;
        }
        my $scrollSelectionForm = $rtsPlayerLayerInterface->getCurrentScrollSelectionForm();
        my $item = $scrollSelectionForm->get($index);
        if (!defined($item)) {
            return 0;
        }
        $self->processStickyGameSpecific($associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $index);
        return 1;
}


# throws Exception
sub processStickyGameSpecific {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $index) = @_;
}


# throws Exception
sub getItemAt {
    my ($self, $rtsPlayerLayerInterface, $point) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Point: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($point))->toString(), $self, "getItemAt");
        my $scrollSelectionForm = $rtsPlayerLayerInterface->getCurrentScrollSelectionForm();
        return $scrollSelectionForm->getSelectedItem($point);
}


# throws Exception
sub getIndexAt {
    my ($self, $rtsPlayerLayerInterface, $point) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Point: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($point))->toString(), $self, "getItemAt");
        my $scrollSelectionForm = $rtsPlayerLayerInterface->getCurrentScrollSelectionForm();
        return $scrollSelectionForm->getSelectedIndexForPoint($point);
}


# throws Exception
sub getInstance {
    my ($self, $layerManager, $aItem, $geographicMapCellPosition) = @_;
        my $item = $aItem;
        my $layerInterfaceFactoryInterface = $item->getLayerInterfaceFactoryInterface();
        my $cellPoint = $geographicMapCellPosition->getPoint();
        if (defined($layerInterfaceFactoryInterface)) {
            $self->{hashtable}->put($org::allbinary::game::layer::AllBinaryGameLayerManager::ID, $layerManager);
            return $layerInterfaceFactoryInterface->getNextInstance($self->getHashtable(), $cellPoint->getX(), $cellPoint->getY(), $cellPoint->getZ());
        }
        return 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance();
}


sub getSelectedGeographicCellPosition {
    my ($self) = @_;
        return $self->{selectedGeographicCellPosition};
}


sub setSelectedGeographicCellPosition {
    my ($self, $selectedGeographicCellPosition) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Selected GeographicMapCellPosition: ")->append($selectedGeographicCellPosition->toString())->toString(), $self, "setSelectedGeographicCellPosition");
        $self->{selectedGeographicCellPosition} = $selectedGeographicCellPosition;
}


sub isStickyItemSelected {
    my ($self) = @_;
        return $self->{stickyItemSelected};
}


sub setStickyItemSelected {
    my ($self, $stickyItemSelected) = @_;
        $self->{stickyItemSelected} = $stickyItemSelected;
}


sub getSelectedStickyItem {
    my ($self) = @_;
        return $self->{selectedStickyItem};
}


sub setSelectedStickyItem {
    my ($self, $selectedStickyItem) = @_;
        $self->{selectedStickyItem} = $selectedStickyItem;
}


sub getSelectedStickyItemIndex {
    my ($self) = @_;
        return $self->{selectedStickyItemIndex};
}


sub setSelectedStickyItemIndex {
    my ($self, $selectedStickyItemIndex) = @_;
        $self->{selectedStickyItemIndex} = $selectedStickyItemIndex;
}


sub getHashtable {
    my ($self) = @_;
        return $self->{hashtable};
}

use org::allbinary::game::identification::GroupCommonFactory;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::game::layer::item::LayerInterfaceFactoryImageItem;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::direction::DirectionFactory;
use org::allbinary::game::identification::Group;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::layer::LayerInterfaceFactoryInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::util::ABHashtable;

1;

