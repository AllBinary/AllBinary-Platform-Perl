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
package org::allbinary::animation::RotationAnimationInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimationInterface','org::allbinary::direction::DirectionalInterface';



sub getAngleInfoP {
    my ($self) = @_;
    die "abstract method getAngleInfoP";
}


sub nextRotation {
    my ($self) = @_;
    die "abstract method nextRotation";
}


sub previousRotation {
    my ($self) = @_;
    die "abstract method previousRotation";
}

use org::allbinary::direction::DirectionalInterface;
use org::allbinary::math::AngleInfo;
use org::allbinary::animation::IndexedAnimationInterface;

1;

