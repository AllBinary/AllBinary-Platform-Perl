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

package org::allbinary::game::input::GameKeyMappingFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{intKeyToGameKey} = [(undef) x ('org::allbinary::game::input::InputFactory'->getInstance()->{MAX})];
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::input::GameKeyMappingFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::input::GameKeyMappingFactory::instance = 'org::allbinary::game::input::GameKeyMappingFactory'->new();
        }
        return $org::allbinary::game::input::GameKeyMappingFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $gameKeyFactory = 'org::allbinary::game::input::GameKeyFactory'->getInstance();
        $self->setGameKey($gameKeyFactory->{NONE});
        $self->setGameKey($gameKeyFactory->{UP});
        $self->setGameKey($gameKeyFactory->{DOWN});
        $self->setGameKey($gameKeyFactory->{LEFT});
        $self->setGameKey($gameKeyFactory->{RIGHT});
        $self->setGameKey($gameKeyFactory->{KEY_POUND});
        $self->setGameKey($gameKeyFactory->{KEY_STAR});
        $self->setGameKey($gameKeyFactory->{KEY_NUM0});
        $self->setGameKey($gameKeyFactory->{KEY_NUM1});
        $self->setGameKey($gameKeyFactory->{KEY_NUM2});
        $self->setGameKey($gameKeyFactory->{KEY_NUM3});
        $self->setGameKey($gameKeyFactory->{KEY_NUM4});
        $self->setGameKey($gameKeyFactory->{KEY_NUM5});
        $self->setGameKey($gameKeyFactory->{KEY_NUM6});
        $self->setGameKey($gameKeyFactory->{KEY_NUM7});
        $self->setGameKey($gameKeyFactory->{KEY_NUM8});
        $self->setGameKey($gameKeyFactory->{KEY_NUM9});
        $self->setGameKey($gameKeyFactory->{GAME_A});
        $self->setGameKey($gameKeyFactory->{GAME_B});
        $self->setGameKey($gameKeyFactory->{GAME_C});
        $self->setGameKey($gameKeyFactory->{GAME_D});
        $self->setGameKey($gameKeyFactory->{FIRE});
        $self->setGameKey($gameKeyFactory->{LEVEL_DOWN});
        $self->setGameKey($gameKeyFactory->{LEVEL_UP});
    return $self;
}


sub getGameKey {
    my ($self, $key) = @_;
        return $self->{intKeyToGameKey}->[$key];
}


sub setGameKey {
    my ($self, $gameKey) = @_;
        $self->{intKeyToGameKey}->[$gameKey->getId()] = $gameKey;
}

use org::allbinary::logic::NullUtil;
use org::allbinary::game::input::InputFactory;
use org::allbinary::game::input::GameKeyFactory;

1;

