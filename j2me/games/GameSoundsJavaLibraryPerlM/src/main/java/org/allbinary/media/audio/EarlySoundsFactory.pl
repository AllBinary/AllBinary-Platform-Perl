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

package org::allbinary::media::audio::EarlySoundsFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::audio::BaseSoundsFactory';

our $instance = 'org::allbinary::media::audio::EarlySoundsFactory'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws Exception
sub getSoundInterfaceArray {
    my ($self) = @_;
        my $soundInterfaceArray = [(undef) x (2)];
        my $index = 0;
        $soundInterfaceArray->[$index++] = 'org::allbinary::media::audio::SelectSound'->getInstance();
        $soundInterfaceArray->[$index++] = 'org::allbinary::media::audio::ErrorSound'->getInstance();
        return $soundInterfaceArray;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::audio::EarlySoundsFactory::instance;
}

use org::allbinary::media::audio::BaseSoundsFactory;
use org::allbinary::media::audio::SelectSound;
use org::allbinary::media::audio::ErrorSound;

1;

