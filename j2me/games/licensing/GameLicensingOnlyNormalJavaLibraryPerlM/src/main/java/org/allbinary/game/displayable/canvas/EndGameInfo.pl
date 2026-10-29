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

package org::allbinary::game::displayable::canvas::EndGameInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{NORMAL_GAME_OVER} = "Game Over";
    $self->{NORMAL_GAME_OVER_WIN} = "You Won";
    $self->{gameOverStr} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{winStr} = $self->{gameOverStr};
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub update {
    my ($self, $gameInfo, $myCanvas) = @_;
        $self->setGameOverStr($self->{NORMAL_GAME_OVER});
        $self->setWinStr($self->{NORMAL_GAME_OVER_WIN});
}


sub getGameOverStr {
    my ($self) = @_;
        return $self->{gameOverStr};
}


sub setGameOverStr {
    my ($self, $gameOverStr) = @_;
        $self->{gameOverStr} = $gameOverStr;
}


sub getWinStr {
    my ($self) = @_;
        return $self->{winStr};
}


sub setWinStr {
    my ($self, $winStr) = @_;
        $self->{winStr} = $winStr;
}

use org::allbinary::game::GameInfo;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::logic::string::StringUtil;

1;

