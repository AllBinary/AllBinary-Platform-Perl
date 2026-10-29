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

package org::allbinary::game::score::LastFetchHighScoresFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{highScoresArray} = 'org::allbinary::game::score::NoHighScoresFactory'->getInstance()->{NO_HIGH_SCORES};
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::score::LastFetchHighScoresFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::score::LastFetchHighScoresFactory::instance = 'org::allbinary::game::score::LastFetchHighScoresFactory'->new();
        }
        return $org::allbinary::game::score::LastFetchHighScoresFactory::instance;
}

use org::allbinary::logic::NullUtil;
use org::allbinary::game::score::NoHighScoresFactory;

1;

