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
package org::allbinary::layer::LayerInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::NamedInterface','org::allbinary::graphics::paint::PaintableInterface','org::allbinary::game::identification::GroupInterfaceCompositeInterface','org::allbinary::layer::PositionInterface';



sub getHeight {
    my ($self) = @_;
    die "abstract method getHeight";
}


sub getWidth {
    my ($self) = @_;
    die "abstract method getWidth";
}


sub getHalfHeight {
    my ($self) = @_;
    die "abstract method getHalfHeight";
}


sub getHalfWidth {
    my ($self) = @_;
    die "abstract method getHalfWidth";
}


sub getXP {
    my ($self) = @_;
    die "abstract method getXP";
}


sub getYP {
    my ($self) = @_;
    die "abstract method getYP";
}


sub getZP {
    my ($self) = @_;
    die "abstract method getZP";
}


sub getX2 {
    my ($self) = @_;
    die "abstract method getX2";
}


sub getY2 {
    my ($self) = @_;
    die "abstract method getY2";
}


sub getZ2 {
    my ($self) = @_;
    die "abstract method getZ2";
}


sub isVisible {
    my ($self) = @_;
    die "abstract method isVisible";
}


sub moveDXYZ {
    my ($self, $dx, $dy, $dz) = @_;
    die "abstract method moveDXYZ";
}


sub setVisible {
    my ($self, $visible) = @_;
    die "abstract method setVisible";
}


sub implmentsTickableInterface {
    my ($self) = @_;
    die "abstract method implmentsTickableInterface";
}


sub implmentsCollidableInterface {
    my ($self) = @_;
    die "abstract method implmentsCollidableInterface";
}


sub implmentsGameInputInterface {
    my ($self) = @_;
    die "abstract method implmentsGameInputInterface";
}


sub implmentsArtificialIntelligenceCompositeInterface {
    my ($self) = @_;
    die "abstract method implmentsArtificialIntelligenceCompositeInterface";
}


sub getType {
    my ($self) = @_;
    die "abstract method getType";
}

use org::allbinary::game::identification::GroupInterfaceCompositeInterface;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::layer::NamedInterface;
use org::allbinary::layer::PositionInterface;

1;

