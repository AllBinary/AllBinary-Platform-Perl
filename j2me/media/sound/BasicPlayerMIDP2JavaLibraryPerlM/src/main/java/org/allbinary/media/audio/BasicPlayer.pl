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

#BasicPlayerMIDP2JavaLibrary
package org::allbinary::media::audio::BasicPlayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::media::Player','org::allbinary::media::audio::TimeBaseInterface','org::allbinary::media::audio::Controllable2';

our $CONTROL_TYPE = "ToneControl";

sub _init_fields {
    my ($self) = @_;
    $self->{listenersList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{timeBase} = undef;
    $self->{stateP} = 0;
    $self->{loopCountP} = 0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setLoopCount(0);
        $self->setState($javax::microedition::media::Player::UNREALIZED);
    return $self;
}


sub getContentType {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub getControl {
    my ($self, $controlType) = @_;
        return 'org::allbinary::media::audio::NullControl'->new();
}


sub getControls {
    my ($self) = @_;
        return [(undef) x (0)];
}


sub close {
    my ($self) = @_;
}


sub addPlayerListener {
    my ($self, $playerListener) = @_;
        if (!$self->{listenersList}->contains($playerListener)) {
            $self->{listenersList}->add($playerListener);
        }
}


sub removePlayerListener {
    my ($self, $playerListener) = @_;
        $self->{listenersList}->remove($playerListener);
}


sub getState {
    my ($self) = @_;
        return $self->{stateP};
}


sub setState {
    my ($self, $state) = @_;
        $self->{stateP} = $state;
}


sub getDuration {
    my ($self) = @_;
        return 0;
}


sub getMediaTime {
    my ($self) = @_;
        return 0;
}


sub getTimeBase {
    my ($self) = @_;
        return $self->{timeBase};
}


sub setTimeBase {
    my ($self, $timeBase) = @_;
        $self->{timeBase} = $timeBase;
}


sub deallocate {
    my ($self) = @_;
}


# throws MediaException
sub prefetch {
    my ($self) = @_;
}


# throws MediaException
sub realize {
    my ($self) = @_;
}


sub setLoopCount {
    my ($self, $count) = @_;
        $self->{loopCountP} = $count;
}


sub getLoopCount {
    my ($self) = @_;
        return $self->{loopCountP};
}


# throws MediaException
sub setMediaTime {
    my ($self, $now) = @_;
        return 0;
}


# throws MediaException
sub start {
    my ($self) = @_;
        $self->setState($javax::microedition::media::Player::STARTED);
}


# throws MediaException
sub stop {
    my ($self) = @_;
        $self->setState($javax::microedition::media::Player::PREFETCHED);
}


sub setVolume {
    my ($self, $leftVolume, $rightVolume) = @_;
}

# use javax::microedition::media::Control;
# use javax::microedition::media::MediaException;
# use javax::microedition::media::Player;
# use javax::microedition::media::PlayerListener;
# use javax::microedition::media::TimeBase;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::media::audio::TimeBaseInterface;
use org::allbinary::media::audio::Controllable2;
use org::allbinary::media::audio::NullControl;

1;

