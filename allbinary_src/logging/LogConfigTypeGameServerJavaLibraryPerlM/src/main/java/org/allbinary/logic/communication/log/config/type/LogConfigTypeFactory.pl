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

package org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NO_DESCRIPTION} = "No Description";
    $self->{INIT_SERVER} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Init Server", $self->{NO_DESCRIPTION});
    $self->{LOBBY_SERVER} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Lobby Server", $self->{NO_DESCRIPTION});
    $self->{GAME_SERVER} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Game Server", $self->{NO_DESCRIPTION});
    $self->{GAME_SIMULATOR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Game Simulator", $self->{NO_DESCRIPTION});
    $self->{CUSTOM_TYPES} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Custom Types", $self->{NO_DESCRIPTION});
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->add($self->{INIT_SERVER});
    return $self;
}

use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigType;

1;

