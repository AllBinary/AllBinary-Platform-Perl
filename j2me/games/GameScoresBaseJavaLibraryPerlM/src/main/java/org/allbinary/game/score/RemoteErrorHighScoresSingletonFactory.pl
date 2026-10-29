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

package org::allbinary::game::score::RemoteErrorHighScoresSingletonFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::game::score::HighScores'->new('org::allbinary::string::CommonStrings'->getInstance()->{LOADING}, "Remote High Scores Did Not Load", 'org::allbinary::string::CommonStrings'->getInstance()->{PERIODS});

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::score::RemoteErrorHighScoresSingletonFactory::SINGLETON;
}

use org::allbinary::string::CommonStrings;
use org::allbinary::game::score::HighScores;

1;

