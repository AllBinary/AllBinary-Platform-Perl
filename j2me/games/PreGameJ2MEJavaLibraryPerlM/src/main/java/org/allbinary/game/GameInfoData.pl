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

package org::allbinary::game::GameInfoData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::GameInfoData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{GAME_TYPE} = "GAME_TYPE";
    $self->{GAME_MODE} = "GAME_MODE";
    $self->{PLAYER_TYPE} = "PLAYER_TYPE";
    $self->{HIGHEST_LEVEL} = "HIGHEST_LEVEL";
    $self->{CURRENT_LEVEL} = "CURRENT_LEVEL";
    $self->{SOFTWARE_INFORMATION} = "SOFTWARE_INFORMATION";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::GameInfoData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

