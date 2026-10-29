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

package org::allbinary::game::input::mapping::GameInputMapping;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{gameKey} = $org::allbinary::game::input::GameKey::NULL_GAME_KEY;
}


sub new {
    my ($class, $name, $gameKey) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName($name);
        $self->setGameKey($gameKey);
    return $self;
}


sub setGameKey {
    my ($self, $gameKey) = @_;
        $self->{gameKey} = $gameKey;
}


sub getGameKey {
    my ($self) = @_;
        return $self->{gameKey};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}

use org::allbinary::game::input::GameKey;
use org::allbinary::logic::string::StringUtil;

1;

