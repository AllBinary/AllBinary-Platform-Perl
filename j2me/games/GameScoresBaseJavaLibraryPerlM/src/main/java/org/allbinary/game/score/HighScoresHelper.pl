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

package org::allbinary::game::score::HighScoresHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::HighScoresHelperBase';


sub _init_fields {
    my ($self) = @_;
    $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstanceAt(0, 0);
    $self->{lastIndex} = -1;
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub setHighScoresArray {
    my ($self, $highScoresArrayP) = @_;
        $self->SUPER::setHighScoresArray($highScoresArrayP);
        $self->{circularIndexUtil}->setSize(scalar(@{$self->{highScoresArrayP}}));
}


sub getNextHighScores {
    my ($self) = @_;
        my $highScores = $self->{highScoresArrayP}->[$self->{circularIndexUtil}->getIndex()];
        my $index = 0;
        while (($highScores->getTotal() < 1 || $self->{lastIndex} == $self->{circularIndexUtil}->getIndex()) && $index < scalar(@{$self->{highScoresArrayP}})) {
            $self->{circularIndexUtil}->next();
            $highScores = $self->{highScoresArrayP}->[$self->{circularIndexUtil}->getIndex()];
            $index++;
        }
        $self->{lastIndex} = $self->{circularIndexUtil}->getIndex();
        return $highScores;
}


sub isAnyHighScores {
    my ($self) = @_;
        if (scalar(@{$self->{highScoresArrayP}}) < 1) {
            return 0;
        }
        my $anyScores = 0;
        my $highScores = undef;
        for (my $index = scalar(@{$self->{highScoresArrayP}}) - 1; $index >= 0; $index--) {
            $highScores = $self->{highScoresArrayP}->[$index];
            if ($highScores->getTotal() > 0) {
                $anyScores = 1;
            }
        }
        return $anyScores;
}

use org::allbinary::util::CircularIndexUtil;
use org::allbinary::game::score::HighScoresHelperBase;

1;

