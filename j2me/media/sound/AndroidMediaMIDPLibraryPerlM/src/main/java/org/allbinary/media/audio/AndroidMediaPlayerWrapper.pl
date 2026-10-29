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

package org::allbinary::media::audio::AndroidMediaPlayerWrapper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::audio::BasicPlayer';

our $NULL_ANDROID_MEDIA_PLAYER_WRAPPER = 'org::allbinary::media::audio::AndroidMediaPlayerWrapper'->createPlayerWrapper();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{mediaPlayer} = $org::allbinary::android::NullAndroidCanvas::NULL_MEDIA_PLAYER;
}


sub createPlayerWrapper {
    my ($class) = @_;
        try {
            return 'org::allbinary::media::audio::AndroidMediaPlayerWrapper'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        } catch ($e) {
            die ("RuntimeException");
        }
}


sub new {
    my ($class, $resource) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        try {
            if ($resource eq 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}) {
            } else {
                my $resourceUtil = 'org::allbinary::data::resource::ResourceUtil'->getInstance();
                my $mediaPlayer = 'android::media::MediaPlayer'->create($resourceUtil->getContext(), int($resourceUtil->getResourceId($resource)));
                if (!defined($mediaPlayer)) {
                    die ('org::allbinary::logic::string::StringMaker'->new()->append("Failed to create media player for: ")->append($resource)->append(" with id: ")->append($resourceUtil->getResourceId($resource)->toString())->toString());
                }
                $self->setMediaPlayer($mediaPlayer);
                $self->{mediaPlayer}->setLooping(0);
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION_LABEL} . $resource, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
            die $e;
        }
    return $self;
}


sub setLoopCount {
    my ($self, $count) = @_;
        $self->SUPER::setLoopCount($count);
        if ($self->{mediaPlayer} != $org::allbinary::android::NullAndroidCanvas::NULL_MEDIA_PLAYER && defined($self->{mediaPlayer})) {
            if ($count == 0) {
                $self->{mediaPlayer}->setLooping(0);
            } else {
            }
        }
}


sub addPlayerListener {
    my ($self, $playerListener) = @_;
        $self->SUPER::addPlayerListener($playerListener);
}


sub removePlayerListener {
    my ($self, $playerListener) = @_;
        $self->SUPER::removePlayerListener($playerListener);
}


sub getState {
    my ($self) = @_;
        if ($self->{mediaPlayer}->isPlaying()) {
            return $javax::microedition::media::Player::STARTED;
        } else {
            return $javax::microedition::media::Player::PREFETCHED;
        }
}


sub close {
    my ($self) = @_;
        try {
            $self->{mediaPlayer}->release();
            $self->{mediaPlayer} = $org::allbinary::android::NullAndroidCanvas::NULL_MEDIA_PLAYER;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CLOSE}, $e);
        }
}


# throws MediaException
sub start {
    my ($self) = @_;
        try {
            if ($self->{mediaPlayer}->isPlaying()) {
                $self->{mediaPlayer}->pause();
                $self->{mediaPlayer}->seekTo(0);
            }
            $self->{mediaPlayer}->start();
            $self->SUPER::start();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{START_METHOD_NAME}, $e);
        }
}


# throws MediaException
sub stop {
    my ($self) = @_;
        try {
            $self->{mediaPlayer}->stop();
            $self->{mediaPlayer}->prepare();
            $self->SUPER::stop();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "stop", $e);
        }
}


sub update {
    my ($self, $event) = @_;
        $self->{logUtil}->putF("LineEvent: " . $event, $self, $self->{commonStrings}->{UPDATE});
        my $size = $self->{listenersList}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $listener = $self->{listenersList}->{objectArray}->[$index];
            $listener->playerUpdate($self, $event, 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
        }
}


sub setVolume {
    my ($self, $leftVolume, $rightVolume) = @_;
        $self->{mediaPlayer}->setVolume(($leftVolume) / 100.0, ($rightVolume) / 100.0);
}


sub getDuration {
    my ($self) = @_;
        return int($self->{mediaPlayer}->getDuration());
}


sub setMediaPlayer {
    my ($self, $mediaPlayer) = @_;
        $self->{mediaPlayer} = $mediaPlayer;
}


sub getMediaPlayer {
    my ($self) = @_;
        return $self->{mediaPlayer};
}

# use javax::microedition::media::MediaException;
# use javax::microedition::media::Player;
# use javax::microedition::media::PlayerListener;
use android::media::MediaPlayer;
use org::allbinary::android::NullAndroidCanvas;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::audio::BasicPlayer;

1;

