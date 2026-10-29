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
package org::allbinary::graphics::j2me::workarea::WorkAreaJPanelInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::awt::event::KeyListener';



sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub deselect {
    my ($self) = @_;
    die "abstract method deselect";
}


sub select {
    my ($self) = @_;
    die "abstract method select";
}


sub changeZoom {
    my ($self, $factor) = @_;
    die "abstract method changeZoom";
}


sub explodeAll {
    my ($self) = @_;
    die "abstract method explodeAll";
}


# throws Exception
sub autoRotate {
    my ($self, $increments, $totalAngle) = @_;
    die "abstract method autoRotate";
}


# throws Exception
sub autoExplode {
    my ($self, $numberOfFrames, $explodeType) = @_;
    die "abstract method autoExplode";
}


# throws Exception
sub autoMirror {
    my ($self) = @_;
    die "abstract method autoMirror";
}


sub play {
    my ($self) = @_;
    die "abstract method play";
}


sub stop {
    my ($self) = @_;
    die "abstract method stop";
}


sub isPlaying {
    my ($self) = @_;
    die "abstract method isPlaying";
}


# throws Exception
sub toDocument {
    my ($self) = @_;
    die "abstract method toDocument";
}

use org::w3c::dom::Document;

1;

