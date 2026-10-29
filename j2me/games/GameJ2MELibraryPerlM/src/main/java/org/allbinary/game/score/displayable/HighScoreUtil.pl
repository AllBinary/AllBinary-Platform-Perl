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

package org::allbinary::game::score::displayable::HighScoreUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::HighScoresResultsListener';

our $SUBMIT_TEXTBOX_COMMAND = 'javax::microedition::lcdui::Command'->new("Submit", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{highScoresFactoryInterface} = undef;
    $self->{highScoresArray} = undef;
    $self->{highScore} = undef;
    $self->{abeClientInformation} = undef;
    $self->{gameInfo} = undef;
    $self->{highScoresHelper} = undef;
    $self->{firstTime} = 1;
}


sub new {
    my ($class, $highScoresFactoryInterface, $highScoresHelper, $abeClientInformation, $gameInfo, $cmdListener, $name, $highScore) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{highScoresFactoryInterface} = $highScoresFactoryInterface;
        $self->{highScoresHelper} = $highScoresHelper;
        $self->{highScoresArray} = $self->{highScoresHelper}->getHighScoresArray();
        $self->{highScore} = $highScore;
        $self->{abeClientInformation} = $abeClientInformation;
        $self->{gameInfo} = $gameInfo;
    return $self;
}


sub setHighScoresArray {
    my ($self, $highScoresArray) = @_;
        $self->{highScoresArray} = $highScoresArray;
        $self->{firstTime} = 0;
        $self->saveHighScore();
}


sub update {
    my ($self, $name) = @_;
        'org::allbinary::game::score::HighScoreNamePersistanceSingleton'->getInstance()->save($self->{abeClientInformation}, $self->{gameInfo}, $name);
        $self->{highScore}->setName($name);
}


sub saveHighScore {
    my ($self) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{START})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->{highScore}))->toString(), $self, "saveHighScore");
        my $size = scalar(@{$self->{highScoresArray}});
        if ($self->{firstTime} && $size == 0) {
            $self->{logUtil}->putF("Games canvas did not give us any HighScores", $self, "saveHighScore");
            $self->{highScoresFactoryInterface}->fetchHighScores($self->{gameInfo}, $self);
            return;
        }
        my $highScores = undef;
        my $highScoresAsString = undef;
        for (my $index = 0; $index < $size; $index++) {
            $highScores = $self->{highScoresArray}->[$index];
            $highScores->addHighScore($self->{highScore});
            $highScoresAsString = $highScores->toString();
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Added/Adding Score: ")->append($highScoresAsString)->toString(), $self, "saveHighScore");
        }
        $self->{highScoresHelper}->setHighScoresArray($self->{highScoresArray});
}


sub submit {
    my ($self, $myCanvas) = @_;
        my $commandListener = $myCanvas->getCustomCommandListener();
        $commandListener->commandAction($org::allbinary::game::score::displayable::HighScoreUtil::SUBMIT_TEXTBOX_COMMAND, $myCanvas);
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
use org::allbinary::game::GameInfo;
use org::allbinary::game::score::HighScore;
use org::allbinary::game::score::HighScoreNamePersistanceSingleton;
use org::allbinary::game::score::HighScores;
use org::allbinary::game::score::HighScoresFactoryInterface;
use org::allbinary::game::score::HighScoresHelperBaseInterface;
use org::allbinary::game::score::HighScoresResultsListener;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonStrings;

1;

