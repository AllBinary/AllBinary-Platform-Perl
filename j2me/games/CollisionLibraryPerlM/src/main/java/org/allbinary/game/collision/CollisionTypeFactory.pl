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

package org::allbinary::game::collision::CollisionTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::game::collision::CollisionTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NONE} = 'org::allbinary::game::collision::CollisionType'->new("None");
    $self->{DAMAGE} = 'org::allbinary::game::collision::CollisionType'->new("Damage");
    $self->{PICKUP} = 'org::allbinary::game::collision::CollisionType'->new("Pickup");
    $self->{COLLISION} = 'org::allbinary::game::collision::CollisionType'->new("Collision");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::collision::CollisionTypeFactory::SINGLETON;
}

use org::allbinary::game::collision::CollisionType;

1;

