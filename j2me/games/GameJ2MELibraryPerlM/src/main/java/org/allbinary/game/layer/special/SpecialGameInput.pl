# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::game::layer::special::SpecialGameInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::special::SpecialGameInputInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub up {
    my ($self) = @_;
}


# throws Exception
sub down {
    my ($self) = @_;
}


# throws Exception
sub right {
    my ($self) = @_;
}


# throws Exception
sub left {
    my ($self) = @_;
}


# throws Exception
sub strafeLeft {
    my ($self) = @_;
}


# throws Exception
sub strafeRight {
    my ($self) = @_;
}


# throws Exception
sub fire {
    my ($self, $layerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub special1 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub special2 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub special3 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub special4 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub special5 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
}


sub paint {
    my ($self, $graphics) = @_;
}


sub paintThreed {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::game::layer::special::SpecialGameInputInterface;

1;

