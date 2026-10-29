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
package org::allbinary::direction::DirectionalInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub setFrameByDirection {
    my ($self, $direction) = @_;
    die "abstract method setFrameByDirection";
}


sub setFrameToAngle {
    my ($self, $angle) = @_;
    die "abstract method setFrameToAngle";
}


sub adjustFrameToAngle {
    my ($self, $newAngle) = @_;
    die "abstract method adjustFrameToAngle";
}


sub adjustFrame {
    my ($self, $angle) = @_;
    die "abstract method adjustFrame";
}

use org::allbinary::math::Angle;

1;

