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

package org::allbinary::media::audio::ErrorSound;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::audio::CompositeSound';

our $soundInterface = 'org::allbinary::media::audio::ErrorSound'->new();


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new("resource:/wav/error.wav");
        # super(...) made $self above
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::audio::ErrorSound::soundInterface;
}

use org::allbinary::media::audio::CompositeSound;

1;

