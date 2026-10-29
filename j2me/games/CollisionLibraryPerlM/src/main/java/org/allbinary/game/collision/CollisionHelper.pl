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

package org::allbinary::game::collision::CollisionHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{sourceLayerInterface} = undef;
}


sub new {
    my ($class, $sourceLayerInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{sourceLayerInterface} = $sourceLayerInterface;
    return $self;
}


sub isCollidable {
    my ($self, $layerInterface) = @_;
        return 1;
}


sub getOwnerLayerInterface {
    my ($self) = @_;
        return $self->{sourceLayerInterface};
}


sub setOwnerLayerInterface {
    my ($self, $sourceLayerInterface) = @_;
        $self->{sourceLayerInterface} = $sourceLayerInterface;
}

use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::layer::AllBinaryLayer;

1;

