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

package org::allbinary::media::audio::NoPlayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::audio::BasicPlayer';

our $NO_PLAYER = 'org::allbinary::media::audio::NoPlayer'->new();


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub close {
    my ($self) = @_;
}


sub getContentType {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{NULL_STRING};
}


sub getControl {
    my ($self, $controlType) = @_;
        return 'org::allbinary::media::audio::NullControl'->new();
}


sub getControls {
    my ($self) = @_;
        return [(undef) x (0)];
}

# use javax::microedition::media::Control;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::audio::BasicPlayer;
use org::allbinary::media::audio::NullControl;

1;

