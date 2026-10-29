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
#   
# Generated Code Do Not Modify

package org::allbinary::game::layer::geological::resources::GeologicalGeographicMapCellPositionFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{resourcePerMapCellType} = undef;
}


sub new {
    my ($class, $resourcePerMapCellType) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{resourcePerMapCellType} = $resourcePerMapCellType;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $geographicMapInterface, $i_column, $i_row, $columns, $rows, $width, $height) = @_;
        my $tiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        my $resources = $self->{resourcePerMapCellType}->[$tiledLayer->getCell($i_column, $i_row)] + 'org::allbinary::game::rand::MyRandomFactory'->getInstance()->getAbsoluteNextInt(1000);
        return 'org::allbinary::game::layer::geological::resources::GeologicalGeographicMapCellPosition'->new($i_column, $i_row, $columns, $rows, $width, $height, 'org::allbinary::game::layer::geological::resources::GeologicalResource'->new($resources));
}

use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactoryInterface;
use org::allbinary::game::layer::geological::resources::GeologicalGeographicMapCellPosition;
use org::allbinary::game::layer::geological::resources::GeologicalResource;

1;

