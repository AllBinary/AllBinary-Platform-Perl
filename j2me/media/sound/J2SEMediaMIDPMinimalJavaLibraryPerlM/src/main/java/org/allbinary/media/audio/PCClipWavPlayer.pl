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

package org::allbinary::media::audio::PCClipWavPlayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();
use parent -norequire,'org::allbinary::media::audio::BasicPlayer','javax::sound::sampled::LineListener';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{audioInputStream} = undef;
    $self->{clip} = undef;
}


sub new {
    my ($class, $inputStream) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $audioInputStream = 'javax::sound::sampled::AudioInputStream'->new('java::io::ByteArrayInputStream'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_BYTE_ARRAY}), $org::allbinary::media::audio::NullAudioFormat::NULL_AUDIO_FORMAT, 0);
        my $clip = 'org::allbinary::media::audio::NullClip'->new();
        try {
            $audioInputStream = 'javax::sound::sampled::AudioSystem'->getAudioInputStream($inputStream);
            $clip = $self->create($audioInputStream);
            if (!defined($clip)) {
                $self->{logUtil}->put("Clip was null", $self, $self->{commonStrings}->{CONSTRUCTOR}, ("Exception"));
                die ("RuntimeException");
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
        }
        $self->{audioInputStream} = $audioInputStream;
        $self->{clip} = $clip;
    return $self;
}


sub close {
    my ($self) = @_;
        'org::allbinary::thread::MusicThreadPool'->getInstance()->runTask(do {
            package org::allbinary::thread::ARunnable::AnonymousN66744 { our @ISA = ('org::allbinary::thread::ARunnable');
            

            sub run {
                my ($self) = @_;
                try {
                    $self->close2();
                } catch ($e) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
                }
            }
            }
            'org::allbinary::thread::ARunnable::AnonymousN66744'->can('new') ? 'org::allbinary::thread::ARunnable::AnonymousN66744'->new() : bless({}, 'org::allbinary::thread::ARunnable::AnonymousN66744')
        });
}


# throws Exception
sub close2 {
    my ($self) = @_;
        $self->{clip}->drain();
        $self->{clip}->flush();
        $self->{clip}->close();
}


sub getContentType {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


# throws MediaException
sub start {
    my ($self) = @_;
        'org::allbinary::thread::MusicThreadPool'->getInstance()->runTask(do {
            package org::allbinary::thread::ARunnable::AnonymousN67156 { our @ISA = ('org::allbinary::thread::ARunnable');
            

            sub run {
                my ($self) = @_;
                try {
                    $self->start2();
                } catch ($e) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
                }
            }
            }
            'org::allbinary::thread::ARunnable::AnonymousN67156'->can('new') ? 'org::allbinary::thread::ARunnable::AnonymousN67156'->new() : bless({}, 'org::allbinary::thread::ARunnable::AnonymousN67156')
        });
}


# throws Exception
sub start2 {
    my ($self) = @_;
        $self->{clip}->setFramePosition(0);
        $self->{clip}->loop($self->getLoopCount());
        $self->{clip}->start();
        $self->SUPER::start();
}


# throws Exception
sub create {
    my ($self, $audioInputStream) = @_;
        my $clip = 'javax::sound::sampled::AudioSystem'->getClip();
        $clip->addLineListener($self);
        $clip->open($audioInputStream);
        return $clip;
}


# throws MediaException
sub stop {
    my ($self) = @_;
        'org::allbinary::thread::MusicThreadPool'->getInstance()->runTask(do {
            package org::allbinary::thread::ARunnable::AnonymousN67738 { our @ISA = ('org::allbinary::thread::ARunnable');
            

            sub run {
                my ($self) = @_;
                try {
                    $self->stop2();
                } catch ($e) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
                }
            }
            }
            'org::allbinary::thread::ARunnable::AnonymousN67738'->can('new') ? 'org::allbinary::thread::ARunnable::AnonymousN67738'->new() : bless({}, 'org::allbinary::thread::ARunnable::AnonymousN67738')
        });
}


# throws Exception
sub stop2 {
    my ($self) = @_;
        $self->{clip}->stop();
        $self->SUPER::stop();
}


sub getControl {
    my ($self, $controlType) = @_;
        return 'org::allbinary::media::audio::NullControl'->new();
}


sub getControls {
    my ($self) = @_;
        return [(undef) x (0)];
}


sub setVolume {
    my ($self, $leftVolume, $rightVolume) = @_;
        $self->setVolumeF(($leftVolume) / 100.0);
}


sub getVolume {
    my ($self) = @_;
        my $masterGainFloatControl = $self->{clip}->getControl($javax::sound::sampled::FloatControl::Type->{MASTER_GAIN});
        return ((10) ** ($masterGainFloatControl->getValue() / 20));
}


sub setVolumeF {
    my ($self, $volume) = @_;
        if ($volume < 0 || $volume > 1) {
            die ("Volume: " . $volume);
        }
        my $masterGainFloatControl = $self->{clip}->getControl($javax::sound::sampled::FloatControl::Type->{MASTER_GAIN});
        $masterGainFloatControl->setValue(20 * 'Math'->log10($volume));
}


sub getDuration {
    my ($self) = @_;
        return $self->{clip}->getMicrosecondLength() / 1000;
}


sub update {
    my ($self, $event) = @_;
        if ($event->getType()->equals($javax::sound::sampled::LineEvent::Type->{STOP})) {
            my $size = $self->{listenersList}->size();
            for (my $index = 0; $index < $size; $index++) {
                my $listener = $self->{listenersList}->get($size);
                $listener->playerUpdate($self, $javax::microedition::media::PlayerListener::END_OF_MEDIA, undef);
            }
        }
}

use org::allbinary::thread::ARunnable;
# use java::io::ByteArrayInputStream;
# use java::io::InputStream;
# use javax::microedition::media::Control;
# use javax::microedition::media::MediaException;
# use javax::microedition::media::PlayerListener;
# use javax::sound::sampled::AudioInputStream;
# use javax::sound::sampled::AudioSystem;
# use javax::sound::sampled::Clip;
# use javax::sound::sampled::FloatControl;
# use javax::sound::sampled::LineEvent;
# use javax::sound::sampled::LineListener;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::thread::MusicThreadPool;
use org::allbinary::media::audio::BasicPlayer;
use org::allbinary::media::audio::NullAudioFormat;
use org::allbinary::media::audio::NullClip;
use org::allbinary::media::audio::NullControl;

1;

