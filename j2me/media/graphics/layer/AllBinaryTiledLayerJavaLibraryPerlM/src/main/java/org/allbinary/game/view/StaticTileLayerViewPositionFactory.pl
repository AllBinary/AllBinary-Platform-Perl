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

package org::allbinary::game::view::StaticTileLayerViewPositionFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::view::ViewPositionFactoryInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($self) = @_;
        return 'org::allbinary::game::view::StaticTileLayerIntoPositionViewPosition'->new();
}

use org::allbinary::view::ViewPositionBase;
use org::allbinary::view::ViewPositionFactoryInterface;
use org::allbinary::game::view::StaticTileLayerIntoPositionViewPosition;

1;

