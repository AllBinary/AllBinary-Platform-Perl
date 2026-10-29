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

package org::allbinary::media::graphics::geography::map::drop::BaseDropCellPositionGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::drop::DropCellPositionGeneratorInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getName {
    my ($self) = @_;
        return ref($self);
}


# throws Exception
sub update {
    my ($self, $allBinaryGameLayerManager, $geographicMapInterface) = @_;
}


# throws Exception
sub isDropAllowedAt {
    my ($self, $geographicMapCellPosition) = @_;
        return 1;
}


# throws Exception
sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
}

use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::drop::DropCellPositionGeneratorInterface;

1;

