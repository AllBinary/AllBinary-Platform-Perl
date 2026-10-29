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

package org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactoryInterface';

our $NULL_GEOGRAPHIC_MAP_CELL_POSITION = 'org::allbinary::media::graphics::geography::map::GeographicMapCellPosition'->new(-1, -1, -1, -1, -1, -1);

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($self, $geographicMapInterface, $i_column, $i_row, $columns, $rows, $width, $height) = @_;
        return 'org::allbinary::media::graphics::geography::map::GeographicMapCellPosition'->new($i_column, $i_row, $columns, $rows, $width, $height);
}

use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactoryInterface;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;

1;

