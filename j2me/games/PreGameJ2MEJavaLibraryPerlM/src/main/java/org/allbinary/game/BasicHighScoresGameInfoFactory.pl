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

package org::allbinary::game::BasicHighScoresGameInfoFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::game::BasicHighScoresGameInfoFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{MULTI_PLAYER_SERVER} = 'org::allbinary::game::GameInfo'->new('org::allbinary::game::GameTypeFactory'->getInstance()->{MULTI_PLAYER}, $org::allbinary::game::GameMode::SERVER, 'org::allbinary::game::PlayerTypesFactory'->getInstance()->{PLAYER_TYPE_ONE}, 0, 0);
    $self->{SINGLE_PLAYER_SERVER} = 'org::allbinary::game::GameInfo'->new('org::allbinary::game::GameTypeFactory'->getInstance()->{SINGLE_PLAYER}, $org::allbinary::game::GameMode::SERVER, 'org::allbinary::game::PlayerTypesFactory'->getInstance()->{PLAYER_TYPE_ONE}, 0, 0);
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::BasicHighScoresGameInfoFactory::SINGLETON;
}

use org::allbinary::game::GameInfo;
use org::allbinary::game::GameTypeFactory;
use org::allbinary::game::GameMode;
use org::allbinary::game::PlayerTypesFactory;

1;

