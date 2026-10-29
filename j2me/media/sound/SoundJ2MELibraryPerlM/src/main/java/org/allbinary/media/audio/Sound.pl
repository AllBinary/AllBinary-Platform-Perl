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

package org::allbinary::media::audio::Sound;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::audio::SoundInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{resource} = undef;
    $self->{player} = $org::allbinary::media::audio::NoPlayer::NO_PLAYER;
}


sub new {
    my ($class, $resource) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{resource} = $resource;
    return $self;
}


sub getResource {
    my ($self) = @_;
        return $self->{resource};
}


sub getPlayerP {
    my ($self) = @_;
        return $self->{player};
}


sub setPlayerP {
    my ($self, $player) = @_;
        $self->{player} = $player;
}


# throws Exception
sub init {
    my ($self) = @_;
}


sub getDuration {
    my ($self) = @_;
        return -1;
}


sub run {
    my ($self) = @_;
        try {
            $self->{player}->start();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN});
        }
}

# use javax::microedition::media::Player;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::audio::SoundInterface;
use org::allbinary::media::audio::NoPlayer;

1;

