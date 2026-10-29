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

package org::allbinary::game::combat::destroy::DestroyableSimpleBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::combat::destroy::DestroyableBaseBehavior';


sub _init_fields {
    my ($self) = @_;
    $self->{ownerLayer} = undef;
    $self->{destroyed} = 0;
}


sub new {
    my ($class, $ownerLayer) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{ownerLayer} = $ownerLayer;
    return $self;
}


sub isDestroyed {
    my ($self) = @_;
        return $self->{destroyed};
}


sub setDestroyed {
    my ($self, $destroyed) = @_;
        $self->{destroyed} = $destroyed;
        if ($self->isDestroyed()) {
            'org::allbinary::game::combat::destroy::DestroyedLayerProcessor'->getInstance()->add($self->{ownerLayer});
        }
}

use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::game::combat::destroy::DestroyableBaseBehavior;
use org::allbinary::game::combat::destroy::DestroyedLayerProcessor;

1;

