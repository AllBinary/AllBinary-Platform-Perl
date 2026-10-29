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

package org::allbinary::game::collision::CollidableNeverCollideBehaviorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::collision::CollidableBaseBehaviorFactory';

our $instanceC = 'org::allbinary::game::collision::CollidableNeverCollideBehaviorFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{instance} = 'org::allbinary::game::collision::CollidableNeverCollideBehavior'->new(0);
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::collision::CollidableNeverCollideBehaviorFactory::instanceC;
}


sub createBehavior {
    my ($self) = @_;
        return $self->{instance};
}

use org::allbinary::game::collision::CollidableBaseBehaviorFactory;
use org::allbinary::game::collision::CollidableNeverCollideBehavior;

1;

