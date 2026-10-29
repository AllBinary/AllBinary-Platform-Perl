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

package org::allbinary::media::graphics::geography::map::racetrack::BaseRaceTrackGeographicMap;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::BasicGeographicMap','org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{raceTrackInfo} = undef;
    $self->{raceTrackData} = undef;
    $self->{miniGeographicMap} = undef;
}


sub new {
    my ($class, $raceTrackInfo, $raceTrackData, $tiledLayer, $miniGeographicMap, $geographicMapCellPositionFactoryInterface, $geographicMapCellPositionBaseFactory, $geographicMapCellTypeFactory) = @_;
    my $self = $class->SUPER::new($raceTrackInfo->getId(), $raceTrackInfo->getName(), $raceTrackData->getCellTypeIdToGeographicMapCellTypeArray(), $tiledLayer, $raceTrackInfo->getForegroundBasicColor(), $raceTrackInfo->getBackgroundBasicColor(), $geographicMapCellPositionFactoryInterface, $geographicMapCellPositionBaseFactory, $geographicMapCellTypeFactory);
    $self->_init_fields();
        # super(...) made $self above
        $self->{raceTrackInfo} = $raceTrackInfo;
        $self->{raceTrackData} = $raceTrackData;
        $self->{miniGeographicMap} = $miniGeographicMap;
        my $miniTiledLayer = $self->{miniGeographicMap}->getAllBinaryTiledLayer();
        if ($miniTiledLayer->getColumns() != $self->getGeographicMapCellPositionFactory()->getColumns()) {
            my $error = 'org::allbinary::logic::string::StringMaker'->new()->append("RaceTrackMap has incorrect Mini Map columns: ")->appendint(int($miniTiledLayer->getColumns()))->append(" != ")->appendint(int($self->getGeographicMapCellPositionFactory()->getColumns()))->toString();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR});
            die ($error);
        }
        if ($miniTiledLayer->getRows() != $self->getGeographicMapCellPositionFactory()->getRows()) {
            my $error = "RaceTrackMap has incorrect Mini Map rows";
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR});
            die ($error);
        }
    return $self;
}


sub getRaceTrackInfo {
    my ($self) = @_;
        return $self->{raceTrackInfo};
}


sub setRaceTrackInfo {
    my ($self, $aRaceTrackInfo) = @_;
        $self->{raceTrackInfo} = $aRaceTrackInfo;
}


sub setMiniBasicGeographicMap {
    my ($self, $miniBasicGeographicMap) = @_;
        $self->{miniGeographicMap} = $miniBasicGeographicMap;
}


sub getMiniBasicGeographicMap {
    my ($self) = @_;
        return $self->{miniGeographicMap};
}


sub getRaceTrackData {
    my ($self) = @_;
        return $self->{raceTrackData};
}


sub setRaceTrackData {
    my ($self, $raceTrackData) = @_;
        $self->{raceTrackData} = $raceTrackData;
}

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionBaseFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactoryInterface;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapInterface;

1;

