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

package org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMap;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::BaseRaceTrackGeographicMap';


sub _init_fields {
    my ($self) = @_;
    $self->{customMapGenerator} = undef;
}


sub new {
    my ($class, $raceTrackInfo, $raceTrackData, $tiledLayerFactoryInterface, $geographicMapCellPositionFactoryInterface, $geographicMapCellPositionBaseFactory, $geographicMapCellTypeFactory, $customMapGeneratorBaseFactory) = @_;
    my $self = $class->SUPER::new($raceTrackInfo, $raceTrackData, $tiledLayerFactoryInterface->getInstance($raceTrackInfo, $raceTrackData), 'org::allbinary::media::graphics::geography::map::racetrack::BasicGeographicMapFactory'->new()->getInstance($raceTrackInfo, $raceTrackData, $tiledLayerFactoryInterface, $geographicMapCellPositionFactoryInterface, $geographicMapCellTypeFactory), $geographicMapCellPositionFactoryInterface, $geographicMapCellPositionBaseFactory, $geographicMapCellTypeFactory);
    $self->_init_fields();
        # super(...) made $self above
        $self->{customMapGenerator} = $customMapGeneratorBaseFactory->create($self);
    return $self;
}


sub getCustomMapGenerator {
    my ($self) = @_;
        return $self->{customMapGenerator};
}


# throws Exception
sub isValid {
    my ($self, $geographicMapCellPosition) = @_;
        my $customMapArray = $self->{customMapGenerator}->getCustomMapArray();
        if ($geographicMapCellPosition->getColumn() >= scalar(@{$customMapArray->[0]})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Column: ");
            $stringBuffer->appendint(int($geographicMapCellPosition->getColumn()));
            $stringBuffer->append(" not in: ");
            $stringBuffer->appendint(scalar(@{$customMapArray->[0]}));
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
            if ($geographicMapCellPosition->getColumn() == scalar(@{$customMapArray->[0]})) {
                return 1;
            } else {
                return 0;
            }
        } elsif ($geographicMapCellPosition->getRow() > scalar(@{$customMapArray})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Row: ");
            $stringBuffer->appendint(int($geographicMapCellPosition->getRow()));
            $stringBuffer->append(" not in: ");
            $stringBuffer->appendint(scalar(@{$customMapArray}));
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
            if ($geographicMapCellPosition->getRow() == scalar(@{$customMapArray})) {
                return 1;
            } else {
                return 0;
            }
        }
        return 1;
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionBaseFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactoryInterface;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::map::racetrack::BaseRaceTrackGeographicMap;
use org::allbinary::media::graphics::geography::map::racetrack::BasicGeographicMapFactory;

1;

