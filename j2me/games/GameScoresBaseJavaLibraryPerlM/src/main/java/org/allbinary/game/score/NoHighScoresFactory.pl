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

package org::allbinary::game::score::NoHighScoresFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::HighScoresBase';

our $instance = 'org::allbinary::game::score::NoHighScoresFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{NO_HIGH_SCORES} = [(undef) x (0)];
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::score::NoHighScoresFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub fetchHighScores {
    my ($self, $gameInfo, $highScoresResultsListener) = @_;
        $self->{logUtil}->putF("Getting No HighScores", $self, "fetchHighScores");
        $highScoresResultsListener->setHighScoresArray($self->{NO_HIGH_SCORES});
}


sub createHighScoresHelper {
    my ($self) = @_;
        return 'org::allbinary::game::score::HighScoresHelperBase'->new();
}

use org::allbinary::game::GameInfo;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::score::HighScoresBase;
use org::allbinary::game::score::HighScoresHelperBase;

1;

