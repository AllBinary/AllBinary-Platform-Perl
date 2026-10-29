# Generated Code Do Not Modify

package org::allbinary::game::score::BasicHighScoresFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::HighScoresBase';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abeClientInformation} = undef;
    $self->{highScoresArray} = [(undef) x (1)];
    $self->{TOP} = "Top";
    $self->{SCORES} = "Scores";
    $self->{PERSONAL_HIGH_SCORES} = "Personal Top Scores";
    $self->{FETCH} = "fetchHighScores";
}


sub new {
    my ($class, $abeClientInformation, $softwareInformation) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{abeClientInformation} = $abeClientInformation;
    return $self;
}


sub fetchHighScores {
    my ($self, $gameInfo, $highScoresResultsListener) = @_;
        $self->{logUtil}->putF("Getting Local HighScores", $self, $self->{FETCH});
        $self->fetchHighScoresPreload($gameInfo, $highScoresResultsListener, 1);
}


sub fetchHighScoresPreload {
    my ($self, $gameInfo, $highScoresResultsListener, $preload) = @_;
        try {
            $self->{highScoresArray}->[0] = 'org::allbinary::game::score::RecordStoreHighScores'->getInstance($self->{abeClientInformation}, $gameInfo, $self->{TOP}, $self->{PERSONAL_HIGH_SCORES}, $self->{SCORES}, 'org::allbinary::game::score::ScoreComparator'->new(1));
            $highScoresResultsListener->setHighScoresArray($self->{highScoresArray});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{FETCH}, $e);
        }
}


sub createHighScoresHelper {
    my ($self) = @_;
        return 'org::allbinary::game::score::HighScoresHelper2'->new();
}


sub loaded {
    my ($class, $index2) = @_;
        if ($index2 >= 0) {
            return 1;
        }
        return 0;
}

use org::allbinary::game::GameInfo;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::SoftwareInformation;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::game::score::HighScoresBase;
use org::allbinary::game::score::RecordStoreHighScores;
use org::allbinary::game::score::ScoreComparator;
use org::allbinary::game::score::HighScoresHelper2;

1;

