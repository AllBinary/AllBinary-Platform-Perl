# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::geological::resources::GeologicalGeographicMapCellPosition;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::GeographicMapCellPosition';


sub _init_fields {
    my ($self) = @_;
    $self->{geologicalResource} = undef;
}


sub new {
    my ($class, $column, $row, $columns, $rows, $width, $height, $geologicalResource) = @_;
    my $self = $class->SUPER::new($column, $row, $columns, $rows, $width, $height);
    $self->_init_fields();
        # super(...) made $self above
        $self->{geologicalResource} = $geologicalResource;
    return $self;
}


sub getGeologicalResource {
    my ($self) = @_;
        return $self->{geologicalResource};
}

use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;

1;

