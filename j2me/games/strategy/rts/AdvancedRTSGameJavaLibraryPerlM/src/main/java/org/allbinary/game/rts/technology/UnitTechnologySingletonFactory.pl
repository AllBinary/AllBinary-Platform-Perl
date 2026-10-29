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

package org::allbinary::game::rts::technology::UnitTechnologySingletonFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::rts::technology::UnitTechnologySingletonFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{damage} = 0;
    $self->{health} = 0;
    $self->{reload} = 0;
    $self->{repair} = 0;
    $self->{speed} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::rts::technology::UnitTechnologySingletonFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self) = @_;
        $self->setDamage(0);
        $self->setHealth(0);
        $self->setReload(0);
        $self->setRepair(0);
        $self->setSpeed(0);
}


sub getDamage {
    my ($self) = @_;
        return $self->{damage};
}


sub setDamage {
    my ($self, $damage) = @_;
        $self->{damage} = $damage;
}


sub getHealth {
    my ($self) = @_;
        return $self->{health};
}


sub setHealth {
    my ($self, $health) = @_;
        $self->{health} = $health;
}


sub getReload {
    my ($self) = @_;
        return $self->{reload};
}


sub setReload {
    my ($self, $reload) = @_;
        $self->{reload} = $reload;
}


sub getRepair {
    my ($self) = @_;
        return $self->{repair};
}


sub setRepair {
    my ($self, $repair) = @_;
        $self->{repair} = $repair;
}


sub getSpeed {
    my ($self) = @_;
        return $self->{speed};
}


sub setSpeed {
    my ($self, $speed) = @_;
        $self->{speed} = $speed;
}


1;

