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

package org::allbinary::audio::AudioContentTypeDataFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::audio::AudioContentTypeDataFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{MIME_AUDIO_TONE} = 'org::allbinary::audio::AudioContentTypeData'->new("audio/x-tone-seq");
    $self->{MIME_AUDIO_AMR} = 'org::allbinary::audio::AudioContentTypeData'->new("audio/amr");
    $self->{MIME_AUDIO_AMR_WB} = 'org::allbinary::audio::AudioContentTypeData'->new("audio/amr-wb");
    $self->{MIME_AUDIO_WAV} = 'org::allbinary::audio::AudioContentTypeData'->new("audio/x-wav");
    $self->{MIME_AUDIO_MIDI} = 'org::allbinary::audio::AudioContentTypeData'->new("audio/midi");
    $self->{MIME_AUDIO_SP_MIDI} = 'org::allbinary::audio::AudioContentTypeData'->new("audio/sp-midi");
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::audio::AudioContentTypeDataFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}

use org::allbinary::audio::AudioContentTypeData;

1;

