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

package org::allbinary::game::score::remote::RemoteHighScores;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::HighScores';

our $hashTable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{enumerationUtil} = 'org::allbinary::util::EnumerationUtil'->getInstance();
    $self->{abeClientInformation} = undef;
    $self->{softwareInformation} = undef;
    $self->{ascending} = undef;
    $self->{ASCENDING} = "ASCENDING";
}


sub new {
    my ($class, $abeClientInformation, $softwareInformation, $gameInfo, $heading, $columnTwoHeading, $ascending, $preload) = @_;
    my $self = $class->SUPER::new($gameInfo->toString(), $heading, $columnTwoHeading);
    $self->_init_fields();
        # super(...) made $self above
        $self->{abeClientInformation} = $abeClientInformation;
        $self->{softwareInformation} = $softwareInformation;
        $self->setAscending($ascending);
        if ($preload) {
            'org::allbinary::game::score::remote::RemoteHighScoresProcessorFactory'->getInstance()->process($self, $self->{abeClientInformation}, $gameInfo);
        }
    return $self;
}


sub getInstance {
    my ($class, $abeClientInformation, $softwareInformation, $gameInfo, $heading, $columnTwoHeading, $isAscending) = @_;
        return 'org::allbinary::game::score::remote::RemoteHighScores'->getInstancePreload($abeClientInformation, $softwareInformation, $gameInfo, $heading, $columnTwoHeading, $isAscending, 1);
}


sub getInstancePreload {
    my ($class, $abeClientInformation, $softwareInformation, $gameInfo, $heading, $columnTwoHeading, $isAscending, $preload) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            my $highScores = $org::allbinary::game::score::remote::RemoteHighScores::hashTable->get($gameInfo);
            if (!defined($highScores)) {
                $highScores = 'org::allbinary::game::score::remote::RemoteHighScores'->new($abeClientInformation, $softwareInformation, $gameInfo, $heading, $columnTwoHeading, $isAscending, $preload);
                $org::allbinary::game::score::remote::RemoteHighScores::hashTable->put($gameInfo, $highScores);
            }
            return $highScores;
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $logUtil->put($commonStrings->{EXCEPTION}, 'org::allbinary::game::score::RemoteErrorHighScoresSingletonFactory'->getInstance(), $commonStrings->{GET_INSTANCE}, $e);
            return 'org::allbinary::game::score::RemoteErrorHighScoresSingletonFactory'->getInstance();
        }
}


sub addHighScore {
    my ($self, $newHighScore) = @_;
        'org::allbinary::game::score::remote::RemoteHighScoresSubmissionProcessorFactory'->getInstance()->process($self, $self->{abeClientInformation}, $newHighScore);
}


sub update {
    my ($self, $hashtable) = @_;
        $self->getList()->clear();
        my $vector = $hashtable->get('org::allbinary::game::score::remote::RemoteHighScoresData'->getInstance()->{HIGH_SCORES});
        if (defined($vector)) {
            my $size = $vector->size();
            for (my $index = 0; $index < $size; $index++) {
                my $highScoreVector = $vector->get($index);
                my $displayName = $highScoreVector->get(0);
                my $score = $highScoreVector->get(1);
                my $longScore = int($score);
                my $highScore = 'org::allbinary::game::score::HighScore'->new(-1, $displayName, undef, $longScore);
                $self->getList()->add($highScore);
            }
        } else {
            my $NEXT_ELEMENT = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{NEXT})->append("Element: ")->toString();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            my $enumeration = $hashtable->elements();
            my $nextElement = undef;
            while ($self->{enumerationUtil}->hasMoreElements($enumeration)) {
                $nextElement = $self->{enumerationUtil}->nextElement($enumeration);
                $self->{logUtil}->putF($NEXT_ELEMENT . $nextElement, $self, $commonStrings->{PROCESS});
            }
        }
}


sub setAscending {
    my ($self, $ascending) = @_;
        $self->{ascending} = $ascending;
}


sub getAscending {
    my ($self) = @_;
        return $self->{ascending};
}


sub getSoftwareInformation {
    my ($self) = @_;
        return $self->{softwareInformation};
}

use java::util::Enumeration;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::GameInfo;
use org::allbinary::game::score::HighScore;
use org::allbinary::game::score::HighScores;
use org::allbinary::game::score::RemoteErrorHighScoresSingletonFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::SoftwareInformation;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::EnumerationUtil;
use org::allbinary::game::score::remote::RemoteHighScoresProcessorFactory;
use org::allbinary::game::score::remote::RemoteHighScoresSubmissionProcessorFactory;
use org::allbinary::game::score::remote::RemoteHighScoresData;

1;

