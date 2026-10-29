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

package org::allbinary::game::PlayerTypesFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::game::PlayerTypesFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{PLAYER_TYPE_ONE} = 'org::allbinary::game::PlayerType'->new("Player Type One", 0);
    $self->{PLAYER_TYPE_TWO} = 'org::allbinary::game::PlayerType'->new("Player Type Two", 1);
    $self->{PLAYER_TYPE_THREE} = 'org::allbinary::game::PlayerType'->new("Player Type Three", 2);
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::PlayerTypesFactory::SINGLETON;
}

use org::allbinary::game::PlayerType;

1;

