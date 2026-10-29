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

package org::allbinary::game::score::NoScoreable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::Scoreable';

our $SINGLETON = 'org::allbinary::game::score::NoScoreable'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::score::NoScoreable::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(0);
        # super(...) made $self above
    return $self;
}


sub addPoints {
    my ($self, $points) = @_;
}


sub removePoints {
    my ($self, $points) = @_;
}

use org::allbinary::game::score::Scoreable;

1;

