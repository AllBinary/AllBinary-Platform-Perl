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

# Java interface
package org::allbinary::game::collision::CollidableInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::NamedInterface';



# throws Exception
sub isCollidable {
    my ($self, $ownerLayer) = @_;
    die "abstract method isCollidable";
}


# throws Exception
sub isCollision {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
    die "abstract method isCollision";
}


# throws Exception
sub collide {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
    die "abstract method collide";
}


sub getCollisionTypeWith {
    my ($self, $layerInterface) = @_;
    die "abstract method getCollisionTypeWith";
}

use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::NamedInterface;

1;

