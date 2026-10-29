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

package org::allbinary::game::input::GameKeyFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{NONE} = 'org::allbinary::game::input::GameKey'->new('org::allbinary::game::input::InputFactory'->getInstance()->{MAX} - 1, "None");
    $self->{UP} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::UP, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{UP});
    $self->{DOWN} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::DOWN, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{DOWN});
    $self->{LEFT} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::LEFT, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{LEFT});
    $self->{RIGHT} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::RIGHT, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{RIGHT});
    $self->{KEY_POUND} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_POUND, "POUND");
    $self->{KEY_STAR} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_STAR, "STAR");
    $self->{KEY_NUM0} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_NUM0, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
    $self->{KEY_NUM1} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_NUM1, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{ONE});
    $self->{KEY_NUM2} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_NUM2, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{TWO});
    $self->{KEY_NUM3} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_NUM3, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{THREE});
    $self->{KEY_NUM4} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_NUM4, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{FOUR});
    $self->{KEY_NUM5} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_NUM5, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{FIVE});
    $self->{KEY_NUM6} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_NUM6, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{SIX});
    $self->{KEY_NUM7} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_NUM7, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{SEVEN});
    $self->{KEY_NUM8} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_NUM8, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{EIGHT});
    $self->{KEY_NUM9} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_NUM9, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{NINE});
    $self->{GAME_A} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::GAME_A, "Game A");
    $self->{GAME_B} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::GAME_B, "Game B");
    $self->{GAME_C} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::GAME_C, "Game C");
    $self->{GAME_D} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::GAME_D, "Game D");
    $self->{FIRE} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::FIRE, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{FIRE});
    $self->{LEVEL_DOWN} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_NUM9 + 1, "Cheat Level Up");
    $self->{LEVEL_UP} = 'org::allbinary::game::input::GameKey'->new($javax::microedition::lcdui::Canvas::KEY_NUM9 + 2, "Cheat Level Down");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::input::GameKeyFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::input::GameKeyFactory::instance = 'org::allbinary::game::input::GameKeyFactory'->new();
        }
        return $org::allbinary::game::input::GameKeyFactory::instance;
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::logic::NullUtil;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::game::input::GameKey;
use org::allbinary::game::input::InputFactory;

1;

