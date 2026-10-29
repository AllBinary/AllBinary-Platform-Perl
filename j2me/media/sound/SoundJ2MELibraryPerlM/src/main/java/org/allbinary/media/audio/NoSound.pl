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

package org::allbinary::media::audio::NoSound;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::audio::Sound';

our $instance = 'org::allbinary::media::audio::NoSound'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::audio::NoSound::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        # super(...) made $self above
        $self->setPlayerP($org::allbinary::media::audio::NoPlayer::NO_PLAYER);
    return $self;
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::audio::Sound;
use org::allbinary::media::audio::NoPlayer;

1;

