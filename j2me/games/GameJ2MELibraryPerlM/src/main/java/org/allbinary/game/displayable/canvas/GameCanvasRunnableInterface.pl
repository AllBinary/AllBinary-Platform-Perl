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
package org::allbinary::game::displayable::canvas::GameCanvasRunnableInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::thread::RunnableInterface','org::allbinary::graphics::paint::PaintableInterface','javax::microedition::lcdui::ItemStateListener','org::allbinary::game::state::GameStateCompositeInterface';



sub getTitle {
    my ($self) = @_;
    die "abstract method getTitle";
}


sub isInitialized {
    my ($self) = @_;
    die "abstract method isInitialized";
}


sub isPaused {
    my ($self) = @_;
    die "abstract method isPaused";
}


sub unPause {
    my ($self) = @_;
    die "abstract method unPause";
}


sub pause {
    my ($self) = @_;
    die "abstract method pause";
}


sub isHighScoreSubmitted {
    my ($self) = @_;
    die "abstract method isHighScoreSubmitted";
}


# throws Exception
sub setHighScoreSubmitted {
    my ($self, $highScoreSubmitted) = @_;
    die "abstract method setHighScoreSubmitted";
}


# throws Exception
sub processGameOver {
    my ($self) = @_;
    die "abstract method processGameOver";
}


sub isGameOver {
    my ($self) = @_;
    die "abstract method isGameOver";
}


sub initCommands {
    my ($self, $cmdListener) = @_;
    die "abstract method initCommands";
}


# throws Exception
sub getCurrentStateHashtable {
    my ($self) = @_;
    die "abstract method getCurrentStateHashtable";
}


# throws Exception
sub getLoadStateHashtable {
    my ($self) = @_;
    die "abstract method getLoadStateHashtable";
}


# throws Exception
sub setLoadStateHashtable {
    my ($self, $hashtable) = @_;
    die "abstract method setLoadStateHashtable";
}


sub getType {
    my ($self) = @_;
    die "abstract method getType";
}

# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::ItemStateListener;
use org::allbinary::game::state::GameStateCompositeInterface;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::thread::RunnableInterface;
use org::allbinary::util::ABHashtable;

1;

