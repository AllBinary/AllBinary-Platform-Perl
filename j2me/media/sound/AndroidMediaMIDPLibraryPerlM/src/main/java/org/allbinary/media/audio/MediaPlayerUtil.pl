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

package org::allbinary::media::audio::MediaPlayerUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();

our $instance = 'org::allbinary::media::audio::MediaPlayerUtil'->new();

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
        return $org::allbinary::media::audio::MediaPlayerUtil::instance;
}


# throws Exception
sub waitForMediaPlayer {
    my ($self, $mediaPlayer) = @_;
        my $MESSAGE = "Not Stopped Waiting";
        my $METHOD_NAME = "wait";
        my $index = 0;
        while ($mediaPlayer->isPlaying() && $index < 50) {
            $self->{logUtil}->putF($MESSAGE, $self, $METHOD_NAME);
            Time::HiRes::sleep((100) / 1000);
            $index++;
        }
}

use android::media::MediaPlayer;
use org::allbinary::logic::communication::log::LogUtil;
use java::lang::Thread;

1;

