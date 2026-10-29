# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::behavior::topview::GeographicMapTopViewLayerBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::behavior::topview::TopViewGameLayerBehavior';



sub new {
    my ($class, $maxGravityActionIndex) = @_;
    my $self = $class->SUPER::new($maxGravityActionIndex);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $velocityProperties, $layer, $x, $y) = @_;
        return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
}


# throws Exception
sub getGeographicMapCellPositionIfNotSolidBlockOrOffMap {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $geographicMapCellPosition, $velocityProperties, $layer) = @_;
        return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
}


# throws Exception
sub getGeographicMapCellPositionFromListIfNotSolidBlockOrOffMap {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $geographicMapCellPositionList, $velocityProperties, $layer) = @_;
        return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
}


# throws Exception
sub gravity {
    my ($self, $velocityProperties, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $geographicMapCellPosition) = @_;
}


# throws Exception
sub left {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $velocityProperties, $layer) = @_;
}


# throws Exception
sub move {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $velocityProperties, $layer, $x, $y) = @_;
        return 0;
}


# throws Exception
sub moveAndLand {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $geographicMapCellPosition, $velocityProperties, $layer, $x, $y) = @_;
}


# throws Exception
sub right {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $velocityProperties, $layer) = @_;
}


sub hasSolidBlock {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray) = @_;
        my $size = scalar(@{$geographicMapInterfaceArray});
        my $basicTopViewGeographicMapCellTypeFactory = undef;
        for (my $index = 0; $index < $size; $index++) {
            $basicTopViewGeographicMapCellTypeFactory = $geographicMapInterfaceArray->[$index]->getGeographicMapCellTypeFactory();
            if ($basicTopViewGeographicMapCellTypeFactory->{BLOCK_CELL_TYPE}->isType($geographicMapCellTypeArray->[$index])) {
                return 1;
            }
        }
        return 0;
}


sub isOffMap {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray) = @_;
        my $size = scalar(@{$geographicMapInterfaceArray});
        my $basicTopViewGeographicMapCellTypeFactory = undef;
        for (my $index = 0; $index < $size; $index++) {
            $basicTopViewGeographicMapCellTypeFactory = $geographicMapInterfaceArray->[$index]->getGeographicMapCellTypeFactory();
            if ($basicTopViewGeographicMapCellTypeFactory->{OFF_MAP_CELL_TYPE}->isType($geographicMapCellTypeArray->[$index])) {
                return 1;
            }
        }
        return 0;
}

use org::allbinary::game::physics::velocity::VelocityProperties;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellTypeFactory;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::behavior::topview::TopViewGameLayerBehavior;

1;

