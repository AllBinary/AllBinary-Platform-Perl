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

package org::allbinary::game::score::HighScoresHelper2;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::HighScoresHelperBase';


sub _init_fields {
    my ($self) = @_;
    $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstanceAt(0, 0);
    $self->{selectedHighScores} = 'org::allbinary::game::score::NullHighScoresSingletonFactory'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub setSelectedHighScores {
    my ($self, $selectedHighScores) = @_;
        $self->{selectedHighScores} = $selectedHighScores;
}


sub getSelectedHighScores {
    my ($self) = @_;
        return $self->{selectedHighScores};
}


sub setHighScoresArray {
    my ($self, $highScoresArrayP) = @_;
        $self->SUPER::setHighScoresArray($highScoresArrayP);
        $self->{circularIndexUtil}->setSize(scalar(@{$self->{highScoresArrayP}}));
        $self->selectHighScores();
}


sub selectHighScores {
    my ($self) = @_;
        if (scalar(@{$self->{highScoresArrayP}}) == 0) {
            $self->setSelectedHighScores('org::allbinary::game::score::NullHighScoresSingletonFactory'->getInstance());
            return;
        }
        $self->{circularIndexUtil}->next();
        my $highScores = $self->{highScoresArrayP}->[$self->{circularIndexUtil}->getIndex()];
        my $index = 0;
        while ($highScores->getTotal() < 1 && $index < scalar(@{$self->{highScoresArrayP}})) {
            $highScores = $self->{highScoresArrayP}->[$self->{circularIndexUtil}->next()];
            $index++;
        }
        $self->setSelectedHighScores($highScores);
}

use org::allbinary::util::CircularIndexUtil;
use org::allbinary::game::score::HighScoresHelperBase;
use org::allbinary::game::score::NullHighScoresSingletonFactory;

1;

