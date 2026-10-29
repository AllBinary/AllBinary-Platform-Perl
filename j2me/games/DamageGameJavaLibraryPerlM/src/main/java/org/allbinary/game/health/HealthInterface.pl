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
package org::allbinary::game::health::HealthInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub isAlive {
    my ($self) = @_;
    die "abstract method isAlive";
}


sub damage {
    my ($self, $ahealth) = @_;
    die "abstract method damage";
}


sub heal {
    my ($self, $ahealth) = @_;
    die "abstract method heal";
}


sub healMax {
    my ($self) = @_;
    die "abstract method healMax";
}


sub getMaxHealth {
    my ($self) = @_;
    die "abstract method getMaxHealth";
}


sub setMaxHealth {
    my ($self, $maxHealth) = @_;
    die "abstract method setMaxHealth";
}


sub getHealth {
    my ($self) = @_;
    die "abstract method getHealth";
}


sub addListener {
    my ($self, $healthListenerInterface) = @_;
    die "abstract method addListener";
}


1;

