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

package org::allbinary::game::multiplayer::layer::MultiplayerBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_MULTIPLAYER_BEHAVIOR = 'org::allbinary::game::multiplayer::layer::MultiplayerBehavior'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});


sub new {
    my ($class, $username) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub startTick {
    my ($self) = @_;
}


sub endTick {
    my ($self) = @_;
}


sub getApproximateElapsed {
    my ($self) = @_;
        return 0;
}

use org::allbinary::logic::string::StringUtil;

1;

