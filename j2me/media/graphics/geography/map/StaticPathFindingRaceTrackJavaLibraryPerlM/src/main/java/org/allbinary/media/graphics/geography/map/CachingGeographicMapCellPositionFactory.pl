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

package org::allbinary::media::graphics::geography::map::CachingGeographicMapCellPositionFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory';



sub new {
    my ($class, $geographicMapInterface) = @_;
    my $self = $class->SUPER::new($geographicMapInterface);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub createInstance {
    my ($self, $i_column, $i_row, $width, $height) = @_;
        my $hashtable = 'org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactory'->getHashtable();
        my $cellPositionKey = 'org::allbinary::graphics::CellPosition'->toStringColRow($i_column, $i_row);
        my $cellPositionCanBeNull = $hashtable->get($cellPositionKey);
        if (!defined($cellPositionCanBeNull)) {
            $cellPositionCanBeNull = $self->{geographicMapCellPositionFactoryInterface}->getInstance($self->{geographicMapInterface}, $i_column, $i_row, $self->getColumns(), $self->getRows(), $width, $height);
            $self->{geographicMapCellPositionArray}->[$i_row]->[$i_column] = $cellPositionCanBeNull;
            $hashtable->put($cellPositionKey, $cellPositionCanBeNull);
        }
        return $cellPositionCanBeNull;
}

use org::allbinary::graphics::CellPosition;
use org::allbinary::util::ABHashtable;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactory;

1;

