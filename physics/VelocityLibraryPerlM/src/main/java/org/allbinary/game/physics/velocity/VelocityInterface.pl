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
package org::allbinary::game::physics::velocity::VelocityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::physics::velocity::BasicVelocityInterface';



sub getMaxForwardVelocity {
    my ($self) = @_;
    die "abstract method getMaxForwardVelocity";
}


sub getMaxReverseVelocity {
    my ($self) = @_;
    die "abstract method getMaxReverseVelocity";
}


sub limitMaxXYForwardVelocity {
    my ($self) = @_;
    die "abstract method limitMaxXYForwardVelocity";
}


sub limitMaxXYReverseVelocity {
    my ($self) = @_;
    die "abstract method limitMaxXYReverseVelocity";
}


sub limitXYToForwardAndReverseMaxVelocity {
    my ($self) = @_;
    die "abstract method limitXYToForwardAndReverseMaxVelocity";
}


sub limitMaxXYVelocity {
    my ($self, $maxVelocity) = @_;
    die "abstract method limitMaxXYVelocity";
}


sub setMaxForwardVelocity {
    my ($self, $maxForwardVelocity) = @_;
    die "abstract method setMaxForwardVelocity";
}


sub setMaxReverseVelocity {
    my ($self, $maxReverseVelocity) = @_;
    die "abstract method setMaxReverseVelocity";
}

use org::allbinary::game::physics::velocity::BasicVelocityInterface;

1;

