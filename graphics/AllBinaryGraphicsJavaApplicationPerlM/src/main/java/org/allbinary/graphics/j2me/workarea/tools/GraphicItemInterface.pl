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
package org::allbinary::graphics::j2me::workarea::tools::GraphicItemInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub setColor {
    my ($self, $color) = @_;
    die "abstract method setColor";
}


sub getTreeNode {
    my ($self) = @_;
    die "abstract method getTreeNode";
}


sub getPointsInterface {
    my ($self) = @_;
    die "abstract method getPointsInterface";
}


sub setPointsInterface {
    my ($self, $points) = @_;
    die "abstract method setPointsInterface";
}


sub isValid {
    my ($self) = @_;
    die "abstract method isValid";
}


sub isActive {
    my ($self) = @_;
    die "abstract method isActive";
}


sub deactivate {
    my ($self) = @_;
    die "abstract method deactivate";
}


sub activate {
    my ($self) = @_;
    die "abstract method activate";
}


sub setFulcrumPoint {
    my ($self, $point) = @_;
    die "abstract method setFulcrumPoint";
}


# throws Exception
sub translate {
    my ($self, $x, $y) = @_;
    die "abstract method translate";
}


sub setRotate {
    my ($self, $theta) = @_;
    die "abstract method setRotate";
}


sub addRotate {
    my ($self, $theta) = @_;
    die "abstract method addRotate";
}


sub setAngle {
    my ($self, $angle) = @_;
    die "abstract method setAngle";
}


sub addAngle {
    my ($self, $angle) = @_;
    die "abstract method addAngle";
}


sub getAngle {
    my ($self) = @_;
    die "abstract method getAngle";
}


sub paint {
    my ($self, $g, $canvasAngle, $dimension, $x, $y) = @_;
    die "abstract method paint";
}


# throws Exception
sub toDom {
    my ($self, $canvasDom) = @_;
    die "abstract method toDom";
}


sub removePoint {
    my ($self) = @_;
    die "abstract method removePoint";
}


sub addPoint {
    my ($self, $point) = @_;
    die "abstract method addPoint";
}


sub mouseClicked {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
    die "abstract method mouseClicked";
}


sub mouseEntered {
    my ($self, $mouseEvent) = @_;
    die "abstract method mouseEntered";
}


sub mouseExited {
    my ($self, $mouseEvent) = @_;
    die "abstract method mouseExited";
}


sub mousePressed {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
    die "abstract method mousePressed";
}


sub mouseReleased {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
    die "abstract method mouseReleased";
}


sub mouseDragged {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
    die "abstract method mouseDragged";
}


sub mouseMoved {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
    die "abstract method mouseMoved";
}


sub keyPressed {
    my ($self, $keyEvent) = @_;
    die "abstract method keyPressed";
}


sub keyReleased {
    my ($self, $keyEvent) = @_;
    die "abstract method keyReleased";
}


sub keyTyped {
    my ($self, $keyEvent) = @_;
    die "abstract method keyTyped";
}


# throws Exception
sub duplicate {
    my ($self) = @_;
    die "abstract method duplicate";
}

# use java::awt;
# use javax::swing::tree::MutableTreeNode;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::j2me::workarea::canvas::CanvasDom;
use org::allbinary::graphics::j2me::workarea::canvas::IntegerDimension;
use org::w3c::dom::Node;

1;

