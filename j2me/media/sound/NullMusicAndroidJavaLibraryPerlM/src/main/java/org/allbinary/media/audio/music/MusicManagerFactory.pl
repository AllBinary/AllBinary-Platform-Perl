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

package org::allbinary::media::audio::music::MusicManagerFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub createMusicManager {
    my ($class, $soundList) = @_;
        return 'org::allbinary::media::audio::music::MusicManager'->new('org::allbinary::media::audio::music::MusicService', $soundList);
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::media::audio::music::MusicManager;

1;

