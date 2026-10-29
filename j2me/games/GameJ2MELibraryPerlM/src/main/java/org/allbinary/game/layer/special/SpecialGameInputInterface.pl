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
package org::allbinary::game::layer::special::SpecialGameInputInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::PaintableInterface';



# throws Exception
sub up {
    my ($self) = @_;
    die "abstract method up";
}


# throws Exception
sub down {
    my ($self) = @_;
    die "abstract method down";
}


# throws Exception
sub right {
    my ($self) = @_;
    die "abstract method right";
}


# throws Exception
sub left {
    my ($self) = @_;
    die "abstract method left";
}


# throws Exception
sub strafeLeft {
    my ($self) = @_;
    die "abstract method strafeLeft";
}


# throws Exception
sub strafeRight {
    my ($self) = @_;
    die "abstract method strafeRight";
}


# throws Exception
sub fire {
    my ($self, $layerManager, $gameKeyEvent) = @_;
    die "abstract method fire";
}


# throws Exception
sub special1 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
    die "abstract method special1";
}


# throws Exception
sub special2 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
    die "abstract method special2";
}


# throws Exception
sub special3 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
    die "abstract method special3";
}


# throws Exception
sub special4 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
    die "abstract method special4";
}


# throws Exception
sub special5 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
    die "abstract method special5";
}

use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::layer::AllBinaryLayerManager;

1;

