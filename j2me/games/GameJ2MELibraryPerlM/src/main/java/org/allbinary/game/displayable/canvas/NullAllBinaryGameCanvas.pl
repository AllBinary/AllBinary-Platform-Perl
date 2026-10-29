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

package org::allbinary::game::displayable::canvas::NullAllBinaryGameCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::AllBinaryGameCanvasInterface';

our $NULL_ALLBINARY_GAME_CANVAS = 'org::allbinary::game::displayable::canvas::NullAllBinaryGameCanvas'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getLayerManager {
    my ($self) = @_;
        die ("RuntimeException");
}


sub addCommand {
    my ($self, $cmd) = @_;
        die ("RuntimeException");
}


sub getHeight {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getWidth {
    my ($self) = @_;
        die ("RuntimeException");
}


sub removeCommand {
    my ($self, $cmd) = @_;
        die ("RuntimeException");
}


sub setCommandListener {
    my ($self, $l) = @_;
        die ("RuntimeException");
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvasInterface;

1;

