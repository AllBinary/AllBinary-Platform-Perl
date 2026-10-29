# 
# AllBinary Open License Version 1 
# Copyright (c) 2002 AllBinary 
#  
# By agreeing to this license you and any business entity you represent are 
# legally bound to the AllBinary Open License Version 1 legal agreement. 
#  
# You may obtain the AllBinary Open License Version 1 legal agreement from 
# AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
#  
# Created By: Travis Berthelot  
# Generated Code Do Not Modify

package org::allbinary::media::audio::UpgradeSound;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::audio::CompositeSound';

our $soundInterface = 'org::allbinary::media::audio::UpgradeSound'->new();


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new("resource:/wav/upgrade.wav");
        # super(...) made $self above
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::audio::UpgradeSound::soundInterface;
}

use org::allbinary::media::audio::CompositeSound;
use org::allbinary::media::audio::Sound;

1;

