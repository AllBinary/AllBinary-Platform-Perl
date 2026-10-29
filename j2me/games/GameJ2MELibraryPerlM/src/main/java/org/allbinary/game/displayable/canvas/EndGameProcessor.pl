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

package org::allbinary::game::displayable::canvas::EndGameProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::Processor';


sub _init_fields {
    my ($self) = @_;
    $self->{gameStateFactory} = 'org::allbinary::game::state::GameStateFactory'->getInstance();
    $self->{gameCanvas} = undef;
    $self->{WAIT} = 5000;
}


sub new {
    my ($class, $gameCanvas) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{gameCanvas} = $gameCanvas;
    return $self;
}


# throws Exception
sub process {
    my ($self) = @_;
        if ($self->{gameCanvas}->isHighScoreSubmitted()) {
            if ($self->{gameCanvas}->getGameStateTimeHelper()->isElapsedTNT($self->{WAIT})) {
                if ($self->{gameCanvas}->getGameState() == $self->{gameStateFactory}->{SHOW_END_RESULT_GAME_STATE}) {
                    my $highScoresBase = $self->{gameCanvas}->{highScoresHelper};
                    my $highScores = $highScoresBase->getSelectedHighScores();
                    if ($highScores != 'org::allbinary::game::score::NullHighScoresSingletonFactory'->getInstance()) {
                        $highScoresBase->selectHighScores();
                        $self->{gameCanvas}->getRealHighScoresPaintable()->setHighScores($highScores);
                        $self->{gameCanvas}->setGameState($self->{gameStateFactory}->{SHOW_HIGH_SCORE_GAME_STATE});
                        $self->{gameCanvas}->setHighScoresPaintable($self->{gameCanvas}->getRealHighScoresPaintable());
                    }
                } elsif ($self->{gameCanvas}->getGameState() == $self->{gameStateFactory}->{SHOW_HIGH_SCORE_GAME_STATE}) {
                    $self->{gameCanvas}->setGameState($self->{gameStateFactory}->{SHOW_END_RESULT_GAME_STATE});
                    $self->{gameCanvas}->setHighScoresPaintable('org::allbinary::graphics::paint::NullPaintable'->getInstance());
                }
            }
        }
}

use org::allbinary::canvas::Processor;
use org::allbinary::game::score::HighScores;
use org::allbinary::game::score::HighScoresHelperBase;
use org::allbinary::game::score::NullHighScoresSingletonFactory;
use org::allbinary::game::state::GameStateFactory;
use org::allbinary::graphics::paint::NullPaintable;

1;

