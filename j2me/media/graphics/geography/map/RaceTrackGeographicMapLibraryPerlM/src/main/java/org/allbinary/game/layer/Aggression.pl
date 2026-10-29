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

package org::allbinary::game::layer::Aggression;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{ram} = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0);
    $self->{projectile} = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0);
    $self->{drops} = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0);
}


sub new {
    my ($class, $ram, $projectile, $drops) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setRam($ram);
        $self->setProjectile($projectile);
        $self->setDrops($drops);
    return $self;
}


sub getRam {
    my ($self) = @_;
        return $self->{ram};
}


sub setRam {
    my ($self, $ram) = @_;
        $self->{ram} = $ram;
}


sub getProjectile {
    my ($self) = @_;
        return $self->{projectile};
}


sub setProjectile {
    my ($self, $projectile) = @_;
        $self->{projectile} = $projectile;
}


sub getDrops {
    my ($self) = @_;
        return $self->{drops};
}


sub setDrops {
    my ($self, $drops) = @_;
        $self->{drops} = $drops;
}

use org::allbinary::logic::math::SmallIntegerSingletonFactory;

1;

