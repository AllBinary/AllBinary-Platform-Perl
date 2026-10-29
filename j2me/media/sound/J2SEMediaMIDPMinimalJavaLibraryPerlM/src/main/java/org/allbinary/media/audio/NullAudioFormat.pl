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

package org::allbinary::media::audio::NullAudioFormat;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_AUDIO_FORMAT = 'javax::sound::sampled::AudioFormat'->new($javax::sound::sampled::AudioFormat::Encoding->{PCM_UNSIGNED}, 0.0, 0, 0, 0, 0.0, 0);

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}

# use javax::sound::sampled::AudioFormat;

1;

