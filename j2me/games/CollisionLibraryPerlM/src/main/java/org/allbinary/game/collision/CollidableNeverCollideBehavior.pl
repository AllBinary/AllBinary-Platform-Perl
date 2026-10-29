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

package org::allbinary::game::collision::CollidableNeverCollideBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::collision::CollidableBaseBehavior';



sub new {
    my ($class, $isCollidable) = @_;
    my $self = $class->SUPER::new($isCollidable);
        # super(...) made $self above
    return $self;
}


sub isCollision {
    my ($self, $ownerLayer, $allbinaryCollidableLayer) = @_;
        return 0;
}


# throws Exception
sub collide {
    my ($self, $ownerLayer, $allbinaryCollidableLayer) = @_;
}


sub collideInterface {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
}


sub isCollisionInterface {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        return 0;
}

use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::game::collision::CollidableBaseBehavior;

1;

