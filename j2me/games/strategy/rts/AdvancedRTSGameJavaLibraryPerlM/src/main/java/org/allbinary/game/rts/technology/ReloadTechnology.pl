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

package org::allbinary::game::rts::technology::ReloadTechnology;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::RTSInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{level} = 0;
    $self->{maxLevel} = undef;
}


sub new {
    my ($class, $maxLevel) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{maxLevel} = $maxLevel;
    return $self;
}


sub isCompleted {
    my ($self) = @_;
        return 0;
}


sub getPercentComplete {
    my ($self) = @_;
        return 0;
}


sub getLevel {
    my ($self) = @_;
        return $self->{level};
}


sub getMaxLevel {
    my ($self) = @_;
        return $self->{maxLevel};
}


sub getCost {
    my ($self) = @_;
        return 0;
}


sub downgrade {
    my ($self) = @_;
}


sub getDowngradeCost {
    my ($self) = @_;
        return 0;
}


sub isDowngradeable {
    my ($self) = @_;
        return 0;
}


sub getUpgradeCost {
    my ($self) = @_;
        return ($self->getLevel() * $self->getLevel()) * 1000;
}


sub isUpgradeable {
    my ($self) = @_;
        if ($self->getLevel() < $self->getMaxLevel()) {
            return 1;
        } else {
            return 0;
        }
}


sub upgrade {
    my ($self) = @_;
        $self->{level}++;
        my $unitTechnologySingletonFactory = 'org::allbinary::game::rts::technology::UnitTechnologySingletonFactory'->getInstance();
        $unitTechnologySingletonFactory->setReload($unitTechnologySingletonFactory->getReload() + ($self->getLevel() * 10));
}


sub isSelfUpgradeable {
    my ($self) = @_;
        return 0;
}

use org::allbinary::game::layer::RTSInterface;
use org::allbinary::game::rts::technology::UnitTechnologySingletonFactory;

1;

