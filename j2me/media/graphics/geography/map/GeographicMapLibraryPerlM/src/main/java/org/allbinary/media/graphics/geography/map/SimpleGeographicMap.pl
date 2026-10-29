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

package org::allbinary::media::graphics::geography::map::SimpleGeographicMap;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{id} = undef;
    $self->{name} = undef;
    $self->{cellTypeIdToGeographicMapCellType} = undef;
    $self->{tiledLayer} = undef;
    $self->{foregroundBasicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{NULL_COLOR};
    $self->{backgroundBasicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{NULL_COLOR};
    $self->{geographicMapCellTypeFactory} = 'org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory'->getInstance();
}


sub new {
    my ($class, $id, $name, $cellTypeIdToGeographicMapCellType, $tiledLayer, $foregroundBasicColor, $backgroundBasicColor) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{id} = $id;
        $self->{name} = $name;
        $self->{cellTypeIdToGeographicMapCellType} = $cellTypeIdToGeographicMapCellType;
        $self->{tiledLayer} = $tiledLayer;
        $self->setBackgroundBasicColor($backgroundBasicColor);
        $self->setForegroundBasicColor($foregroundBasicColor);
    return $self;
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub reset {
    my ($self) = @_;
}


sub getAllBinaryTiledLayer {
    my ($self) = @_;
        return $self->{tiledLayer};
}


# throws Exception
sub getCellTypeAt {
    my ($self, $cellPosition) = @_;
        my $i_column = $cellPosition->getColumn();
        my $i_row = $cellPosition->getRow();
        my $cellTypeId = $self->{tiledLayer}->getCell($i_column, $i_row);
        if ($cellTypeId < 0) {
            $cellTypeId = $self->{tiledLayer}->getAnimatedTile($cellTypeId);
        }
        return $self->{geographicMapCellTypeFactory}->get($self->{cellTypeIdToGeographicMapCellType}->[$cellTypeId]);
}


sub getCellTypeFromMapCellTypeInt {
    my ($self, $cellTypeId) = @_;
        return $self->{cellTypeIdToGeographicMapCellType}->[$cellTypeId];
}


sub getForegroundBasicColor {
    my ($self) = @_;
        return $self->{foregroundBasicColor};
}


sub setForegroundBasicColor {
    my ($self, $foregroundBasicColor) = @_;
        $self->{foregroundBasicColor} = $foregroundBasicColor;
}


sub getBackgroundBasicColor {
    my ($self) = @_;
        return $self->{backgroundBasicColor};
}


sub setBackgroundBasicColor {
    my ($self, $backgroundBasicColor) = @_;
        $self->{backgroundBasicColor} = $backgroundBasicColor;
}

use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;

1;

