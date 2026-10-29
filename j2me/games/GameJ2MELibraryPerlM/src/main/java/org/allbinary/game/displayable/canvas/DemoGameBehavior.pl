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

package org::allbinary::game::displayable::canvas::DemoGameBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::displayable::canvas::DemoGameBehavior'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::displayable::canvas::DemoGameBehavior::instance;
}


# throws Exception
sub init {
    my ($self) = @_;
}


sub pause {
    my ($self, $allBinaryGameCanvas) = @_;
}


sub unPause {
    my ($self, $allBinaryGameCanvas) = @_;
}


# throws Exception
sub updateTouch {
    my ($self, $allBinaryGameCanvas) = @_;
}


# throws Exception
sub updateScreenButtonPaintable {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->setTouchPaintableP('org::allbinary::graphics::paint::NullPaintable'->getInstance());
}


# throws Exception
sub setGameState {
    my ($self, $allBinaryGameCanvas) = @_;
}


sub removeAllGameKeyInputListeners {
    my ($self, $allBinaryGameCanvas) = @_;
}


# throws Exception
sub updateEndGameProcessor {
    my ($self, $allBinaryGameCanvas) = @_;
}


# throws Exception
sub buildGame {
    my ($self, $allBinaryGameCanvas) = @_;
}


# throws Exception
sub run {
    my ($self, $allBinaryGameCanvas) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF('org::allbinary::game::GameTypeFactory'->getInstance()->{BOT}->toString(), $self, $commonStrings->{RUN});
}


# throws Exception
sub setHighScore {
    my ($self, $abeClientInformation, $allBinaryGameCanvas, $name, $score, $autoSubmit, $isLast) = @_;
}

use org::allbinary::game::GameTypeFactory;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonStrings;

1;

