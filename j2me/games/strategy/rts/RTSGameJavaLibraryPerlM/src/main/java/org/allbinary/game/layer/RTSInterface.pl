# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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
package org::allbinary::game::layer::RTSInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub isSelfUpgradeable {
    my ($self) = @_;
    die "abstract method isSelfUpgradeable";
}


sub isCompleted {
    my ($self) = @_;
    die "abstract method isCompleted";
}


sub getPercentComplete {
    my ($self) = @_;
    die "abstract method getPercentComplete";
}


sub getLevel {
    my ($self) = @_;
    die "abstract method getLevel";
}


sub getMaxLevel {
    my ($self) = @_;
    die "abstract method getMaxLevel";
}


sub getCost {
    my ($self) = @_;
    die "abstract method getCost";
}


sub downgrade {
    my ($self) = @_;
    die "abstract method downgrade";
}


sub getDowngradeCost {
    my ($self) = @_;
    die "abstract method getDowngradeCost";
}


sub isDowngradeable {
    my ($self) = @_;
    die "abstract method isDowngradeable";
}


sub getUpgradeCost {
    my ($self) = @_;
    die "abstract method getUpgradeCost";
}


sub isUpgradeable {
    my ($self) = @_;
    die "abstract method isUpgradeable";
}


sub upgrade {
    my ($self) = @_;
    die "abstract method upgrade";
}


1;

