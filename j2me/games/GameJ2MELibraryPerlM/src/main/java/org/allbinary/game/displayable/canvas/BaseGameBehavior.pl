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

package org::allbinary::game::displayable::canvas::BaseGameBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::DemoGameBehavior';

our $instanceC = 'org::allbinary::game::displayable::canvas::BaseGameBehavior'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::displayable::canvas::BaseGameBehavior::instanceC;
}


# throws Exception
sub init {
    my ($self) = @_;
        my $gameAdState = 'org::allbinary::business::advertisement::GameAdStateFactory'->getInstance()->getCurrentInstance();
        $gameAdState->playingAdState();
}


sub pause {
    my ($self, $allBinaryGameCanvas) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL_AS_GAME_THREAD})) {
            my $currentDisplayableFactory = 'org::allbinary::graphics::opengles::CurrentDisplayableFactory'->getInstance();
            $currentDisplayableFactory->setRunnable($allBinaryGameCanvas->{gamePauseRunnable});
        }
}


sub unPause {
    my ($self, $allBinaryGameCanvas) = @_;
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL_AS_GAME_THREAD})) {
            my $currentDisplayableFactory = 'org::allbinary::graphics::opengles::CurrentDisplayableFactory'->getInstance();
            $currentDisplayableFactory->setRunnable($allBinaryGameCanvas->{gameRunnable});
            $currentDisplayableFactory->setDisplayable($allBinaryGameCanvas);
        }
}


# throws Exception
sub updateTouch {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->updateTouch2();
}


# throws Exception
sub updateScreenButtonPaintable {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->updateScreenButtonPaintable2();
}


# throws Exception
sub setGameState {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->updateGameState();
}


sub removeAllGameKeyInputListeners {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->removeAllGameKeyInputListeners2();
}


# throws Exception
sub updateEndGameProcessor {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->updateEndGameProcessor2();
}


# throws Exception
sub buildGame {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->buildGame2();
}


# throws Exception
sub run {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->run2();
}


# throws Exception
sub setHighScore {
    my ($self, $abeClientInformation, $allBinaryGameCanvas, $name, $score, $autoSubmit, $isLast) = @_;
        $allBinaryGameCanvas->setHighScore2($abeClientInformation, $name, $score, $autoSubmit, $isLast);
}

use org::allbinary::business::advertisement::GameAdStateFactory;
use org::allbinary::game::GameAdState;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::graphics::opengles::CurrentDisplayableFactory;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::game::displayable::canvas::DemoGameBehavior;

1;

