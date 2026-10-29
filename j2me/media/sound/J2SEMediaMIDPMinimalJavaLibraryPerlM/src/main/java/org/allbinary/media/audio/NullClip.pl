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

package org::allbinary::media::audio::NullClip;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::sound::sampled::Clip';

our $NULL_CONTROL = 'org::allbinary::media::audio::NullJ2SEControl'->new($javax::sound::sampled::BooleanControl::Type->{MUTE});

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws LineUnavailableException
sub open {
    my ($self, $format, $data, $offset, $bufferSize) = @_;
}


# throws LineUnavailableException, IOException
# Java overloaded method: Perl keeps the last definition
sub open {
    my ($self, $stream) = @_;
}


sub getFrameLength {
    my ($self) = @_;
        return 0;
}


sub getMicrosecondLength {
    my ($self) = @_;
        return 0;
}


sub setFramePosition {
    my ($self, $frames) = @_;
}


sub setMicrosecondPosition {
    my ($self, $microseconds) = @_;
}


sub setLoopPoints {
    my ($self, $start, $end) = @_;
}


sub loop {
    my ($self, $count) = @_;
}


sub drain {
    my ($self) = @_;
}


sub flush {
    my ($self) = @_;
}


sub start {
    my ($self) = @_;
}


sub stop {
    my ($self) = @_;
}


sub isRunning {
    my ($self) = @_;
        return 0;
}


sub isActive {
    my ($self) = @_;
        return 0;
}


sub getFormat {
    my ($self) = @_;
        return $org::allbinary::media::audio::NullAudioFormat::NULL_AUDIO_FORMAT;
}


sub getBufferSize {
    my ($self) = @_;
        return 0;
}


sub available {
    my ($self) = @_;
        return 0;
}


sub getFramePosition {
    my ($self) = @_;
        return 0;
}


sub getLongFramePosition {
    my ($self) = @_;
        return 0;
}


sub getMicrosecondPosition {
    my ($self) = @_;
        return 0;
}


sub getLevel {
    my ($self) = @_;
        return 0.0;
}


sub getLineInfo {
    my ($self) = @_;
        return 'javax::sound::sampled::Line::Info'->new(ref($self), $org::allbinary::media::audio::NullAudioFormat::NULL_AUDIO_FORMAT);
}


# throws LineUnavailableException
# Java overloaded method: Perl keeps the last definition
sub open {
    my ($self) = @_;
}


sub close {
    my ($self) = @_;
}


sub isOpen {
    my ($self) = @_;
        return 0;
}


sub getControls {
    my ($self) = @_;
        return [(undef) x (0)];
}


sub isControlSupported {
    my ($self, $control) = @_;
        return 0;
}


sub getControl {
    my ($self, $control) = @_;
        return $org::allbinary::media::audio::NullClip::NULL_CONTROL;
}


sub addLineListener {
    my ($self, $listener) = @_;
}


sub removeLineListener {
    my ($self, $listener) = @_;
}

# use java::io::IOException;
# use javax::sound::sampled::AudioFormat;
# use javax::sound::sampled::AudioInputStream;
# use javax::sound::sampled::BooleanControl;
# use javax::sound::sampled::Clip;
# use javax::sound::sampled::Control;
# use javax::sound::sampled::Control::Type;
# use javax::sound::sampled::Line::Info;
# use javax::sound::sampled::LineListener;
# use javax::sound::sampled::LineUnavailableException;
use org::allbinary::media::audio::NullJ2SEControl;
use org::allbinary::media::audio::NullAudioFormat;

1;

