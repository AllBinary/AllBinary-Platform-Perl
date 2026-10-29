# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::business::advertisement::GameAdStateBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{adConfigurationP} = undef;
    $self->{advertisementsP} = 'org::allbinary::business::advertisement::Advertisements'->new();
    $self->{okayToShowAdsP} = 0;
}


sub new {
    my ($class, $adConfiguration) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{adConfigurationP} = $adConfiguration;
    return $self;
}


sub initViewArray {
    my ($self, $viewArray) = @_;
}


sub onStart {
    my ($self, $anyType) = @_;
        $self->init();
}


sub init {
    my ($self) = @_;
}


sub isShowingAtLocation {
    my ($self, $location) = @_;
        return 0;
}


sub isShowingAt {
    my ($self) = @_;
        return 0;
}


sub show {
    my ($self) = @_;
}


sub hide {
    my ($self) = @_;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub processAdState {
    my ($self, $gameState, $gameType) = @_;
}


sub processPageAdState {
    my ($self) = @_;
}


# throws Exception
sub playingAdState {
    my ($self) = @_;
}


# throws Exception
sub playingAdStateWH {
    my ($self, $width, $height) = @_;
}


# throws Exception
sub notPlayingAdState {
    my ($self) = @_;
}


sub setGameIsReady {
    my ($self, $gameIsReady) = @_;
}


sub isGameIsReady {
    my ($self) = @_;
        return 0;
}


sub getAdvertisements {
    my ($self) = @_;
        return $self->{advertisementsP};
}


sub getAdConfiguration {
    my ($self) = @_;
        return $self->{adConfigurationP};
}


sub isOkayToShowPageAd {
    my ($self) = @_;
        return 0;
}


sub setOkayToShowAds {
    my ($self, $okayToShowAds) = @_;
        $self->{okayToShowAdsP} = $okayToShowAds;
}


sub isOkayToShowAds {
    my ($self) = @_;
        return $self->{okayToShowAdsP};
}


sub isEnabled {
    my ($self) = @_;
        return 0;
}

use org::allbinary::game::GameType;
use org::allbinary::game::state::GameState;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::business::advertisement::Advertisements;

1;

