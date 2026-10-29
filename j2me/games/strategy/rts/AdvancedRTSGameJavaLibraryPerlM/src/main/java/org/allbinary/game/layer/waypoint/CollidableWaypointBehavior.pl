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

package org::allbinary::game::layer::waypoint::CollidableWaypointBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::CollidableRTSBehavior';



sub new {
    my ($class, $collidable) = @_;
    my $self = $class->SUPER::new($collidable);
        # super(...) made $self above
    return $self;
}


sub isCollision {
    my ($self, $ownerLayer, $collisionLayer) = @_;
        return 0;
}


# throws Exception
sub collide {
    my ($self, $ownerLayer, $collisionLayer) = @_;
}


sub isCollisionInterface {
    my ($self, $ownerLayer, $collidableInterface) = @_;
        return 0;
}


# throws Exception
sub collideInterface {
    my ($self, $ownerLayer, $collidableInterface) = @_;
}

use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::game::layer::CollidableRTSBehavior;
use org::allbinary::game::collision::CollidableInterfaceCompositeInterface;

1;

