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

package org::allbinary::layer::relationship::MiddleRelativeLayerRelationship;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::relationship::RelativeLayerRelationship';



sub new {
    my ($class, $layer) = @_;
    my $self = $class->SUPER::new($layer, 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($layer->getHalfWidth(), $layer->getHalfHeight()), 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance());
        # super(...) made $self above
    return $self;
}

use org::allbinary::graphics::PointFactory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::layer::relationship::RelativeLayerRelationship;

1;

