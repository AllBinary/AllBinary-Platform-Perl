# 
# AllBinary Open License Version 1 
# Copyright (c) 2002 AllBinary 
#  
# By agreeing to this license you and any business entity you represent are 
# legally bound to the AllBinary Open License Version 1 legal agreement. 
#  
# You may obtain the AllBinary Open License Version 1 legal agreement from 
# AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
#  
# Created By: Travis Berthelot  
# Generated Code Do Not Modify

package org::allbinary::game::layer::FakeLayerManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::AllBinaryGameLayerManager','org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{geographicMapInterfaceArray} = $org::allbinary::media::graphics::geography::map::BasicGeographicMap::NULL_BASIC_GEOGRAPHIC_MAP_ARRAY;
    $self->{geographicMapCellTypeArray} = $org::allbinary::media::graphics::geography::map::GeographicMapCellType::NULL_GEOGRAPHIC_MAP_CELL_TYPE_ARRAY;
}


sub new {
    my ($class, $gameInfo) = @_;
    my $self = $class->SUPER::new('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE}, $gameInfo);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getGeographicMapInterface {
    my ($self) = @_;
        return $self->{geographicMapInterfaceArray};
}


sub setGeographicMapInterface {
    my ($self, $geographicMapInterfaceArray) = @_;
        $self->{geographicMapInterfaceArray} = $geographicMapInterfaceArray;
        $self->{geographicMapCellTypeArray} = [(undef) x (scalar(@{$self->{geographicMapInterfaceArray}}))];
}


sub geographicMapCellTypeArray {
    my ($self) = @_;
        return $self->{geographicMapCellTypeArray};
}

use org::allbinary::game::GameInfo;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::game::layer::AllBinaryGameLayerManager;

1;

