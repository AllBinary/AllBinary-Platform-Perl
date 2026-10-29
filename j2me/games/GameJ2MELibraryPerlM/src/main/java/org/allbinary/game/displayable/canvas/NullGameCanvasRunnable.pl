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

package org::allbinary::game::displayable::canvas::NullGameCanvasRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::GameCanvasRunnableInterface';

our $NULL_GAME_CANVAS_RUNNABLE = 'org::allbinary::game::displayable::canvas::NullGameCanvasRunnable'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{gameStateFactory} = 'org::allbinary::game::state::GameStateFactory'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getTitle {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub isInitialized {
    my ($self) = @_;
        return 0;
}


sub isPaused {
    my ($self) = @_;
        return 0;
}


sub unPause {
    my ($self) = @_;
}


sub pause {
    my ($self) = @_;
}


sub isHighScoreSubmitted {
    my ($self) = @_;
        return 0;
}


# throws Exception
sub setHighScoreSubmitted {
    my ($self, $highScoreSubmitted) = @_;
}


# throws Exception
sub processGameOver {
    my ($self) = @_;
}


sub isGameOver {
    my ($self) = @_;
        return 0;
}


sub initCommands {
    my ($self, $cmdListener) = @_;
}


# throws Exception
sub getCurrentStateHashtable {
    my ($self) = @_;
        return 'org::allbinary::logic::StdUtil'->getInstance()->{NULL_TABLE};
}


# throws Exception
sub getLoadStateHashtable {
    my ($self) = @_;
        return 'org::allbinary::logic::StdUtil'->getInstance()->{NULL_TABLE};
}


# throws Exception
sub setLoadStateHashtable {
    my ($self, $hashtable) = @_;
}


sub getType {
    my ($self) = @_;
        return -1;
}


# throws Exception
sub setGameState {
    my ($self, $gameState) = @_;
}


sub getGameState {
    my ($self) = @_;
        return $self->{gameStateFactory}->{NO_GAME_STATE};
}


sub itemStateChanged {
    my ($self, $item) = @_;
}


sub paint {
    my ($self, $graphics) = @_;
}


sub paintThreed {
    my ($self, $graphics) = @_;
}


sub isRunning {
    my ($self) = @_;
        return 0;
}


sub setRunning {
    my ($self, $isRunning) = @_;
}


# throws Exception
sub setThread {
    my ($self, $thread) = @_;
}


sub run {
    my ($self) = @_;
}

# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Item;
use org::allbinary::game::state::GameState;
use org::allbinary::game::state::GameStateFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::displayable::canvas::GameCanvasRunnableInterface;

1;

