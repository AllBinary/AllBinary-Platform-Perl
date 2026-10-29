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
    $self->{softwareInformation} = undef;
    $self->{highScoresArray} = [(undef) x (2)];
    $self->{TOP} = "Top";
    $self->{SCORES} = "Scores";
    $self->{PERSONAL_HIGH_SCORES} = "Personal Top Scores";
    $self->{WORLD_TOP_SCORES} = "World Top Scores";
    $self->{FETCH} = "fetchHighScores";
}


sub new {
    my ($class, $abeClientInformation, $softwareInformation) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{abeClientInformation} = $abeClientInformation;
        $self->{softwareInformation} = $softwareInformation;
    return $self;
}


sub fetchHighScores {
    my ($self, $gameInfo, $highScoresResultsListener) = @_;
        $self->{logUtil}->putF("Getting Remote/Local HighScores", $self, $self->{FETCH});
        $self->fetchHighScoresPreload($gameInfo, $highScoresResultsListener, 1);
}


sub fetchHighScoresPreload {
    my ($self, $gameInfo, $highScoresResultsListener, $preload) = @_;
        'org::allbinary::thread::SecondaryThreadPool'->getInstance()->runTask(do {
            package org::allbinary::thread::ARunnable::AnonymousN66612 { our @ISA = ('org::allbinary::thread::ARunnable');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                try {
                    $logUtil->putF($self->{commonStrings}->{START}, $self, $self->{FETCH});
                    $self->{highScoresArray}->[0] = 'org::allbinary::game::score::RecordStoreHighScores'->getInstance($self->{abeClientInformation}, $gameInfo, $self->{TOP}, $self->{PERSONAL_HIGH_SCORES}, $self->{SCORES}, 'org::allbinary::game::score::ScoreComparator'->new(1));
                    my $gameType = $gameInfo->getGameType();
                    my $gameTypeFactory = 'org::allbinary::game::GameTypeFactory'->getInstance();
                    my $gameInfo2 = $gameInfo;
                    if ($gameType == $gameTypeFactory->{SINGLE_PLAYER} || $gameType == $gameTypeFactory->{BOT}) {
                        $gameInfo2 = 'org::allbinary::game::BasicHighScoresGameInfoFactory'->getInstance()->{SINGLE_PLAYER_SERVER};
                    } elsif ($gameType == $gameTypeFactory->{MULTI_PLAYER}) {
                        $gameInfo2 = 'org::allbinary::game::BasicHighScoresGameInfoFactory'->getInstance()->{MULTI_PLAYER_SERVER};
                    }
                    $self->{highScoresArray}->[1] = 'org::allbinary::game::score::remote::RemoteHighScores'->getInstancePreload($self->{abeClientInformation}, $self->{softwareInformation}, $gameInfo2, $self->{WORLD_TOP_SCORES}, $self->{SCORES}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE}, $preload);
                    $logUtil->putF($self->{commonStrings}->{END}, $self, $self->{FETCH});
                    'org::allbinary::game::score::LastFetchHighScoresFactory'->getInstance()->{highScoresArray} = $self->{highScoresArray};
                    $highScoresResultsListener->setHighScoresArray($self->{highScoresArray});
                } catch ($e) {
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{FETCH}, $e);
                }
            }
            }
            'org::allbinary::thread::ARunnable::AnonymousN66612'->can('new') ? 'org::allbinary::thread::ARunnable::AnonymousN66612'->new() : bless({}, 'org::allbinary::thread::ARunnable::AnonymousN66612')
        });
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

use org::allbinary::thread::ARunnable;
use org::allbinary::game::BasicHighScoresGameInfoFactory;
use org::allbinary::game::GameInfo;
use org::allbinary::game::GameType;
use org::allbinary::game::GameTypeFactory;
use org::allbinary::game::score::remote::RemoteHighScores;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::system::SoftwareInformation;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::thread::SecondaryThreadPool;
use org::allbinary::game::score::HighScoresBase;
use org::allbinary::game::score::RecordStoreHighScores;
use org::allbinary::game::score::ScoreComparator;
use org::allbinary::game::score::LastFetchHighScoresFactory;
use org::allbinary::game::score::HighScoresHelper2;

1;

