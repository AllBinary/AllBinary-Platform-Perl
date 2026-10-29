# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::score::HighScoresHelperBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::HighScoresHelperBaseInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{highScoresArrayP} = 'org::allbinary::game::score::LastFetchHighScoresFactory'->getInstance()->{highScoresArray};
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub setHighScoresArray {
    my ($self, $highScoresArrayP) = @_;
        if (defined($highScoresArrayP)) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($commonStrings->{START})->appendint(scalar(@{$highScoresArrayP}))->toString(), $self, "setHighScoresArray");
        } else {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{START}, $self, "setHighScoresArray");
        }
        $self->{highScoresArrayP} = $highScoresArrayP;
}


sub getNextHighScores {
    my ($self) = @_;
        return 'org::allbinary::game::score::NullHighScoresSingletonFactory'->getInstance();
}


sub isAnyHighScores {
    my ($self) = @_;
        die ("RuntimeException");
}


sub setSelectedHighScores {
    my ($self, $selectedHighScores) = @_;
}


sub getSelectedHighScores {
    my ($self) = @_;
        return 'org::allbinary::game::score::NullHighScoresSingletonFactory'->getInstance();
}


sub getHighScoresArray {
    my ($self) = @_;
        return $self->{highScoresArrayP};
}


sub selectHighScores {
    my ($self) = @_;
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::score::HighScoresHelperBaseInterface;
use org::allbinary::game::score::LastFetchHighScoresFactory;
use org::allbinary::game::score::NullHighScoresSingletonFactory;

1;

