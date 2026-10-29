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

package org::allbinary::game::GameTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::GameTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NULL_GAME_TYPE_ARRAY} = [(undef) x (0)];
    $self->{NONE} = 'org::allbinary::game::GameType'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{NULL_STRING});
    $self->{SINGLE_PLAYER} = 'org::allbinary::game::GameType'->new("Single Player");
    $self->{MULTI_PLAYER} = 'org::allbinary::game::GameType'->new("Multi Player");
    $self->{BOT} = 'org::allbinary::game::GameType'->new("Artificial Player");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::GameTypeFactory::instance;
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::game::GameType;

1;

