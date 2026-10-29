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

package org::allbinary::game::input::PCKeyFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::game::input::PCKeyFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{keyEventWrapper} = 'org::allbinary::game::input::ABKeyEventWrapper'->getInstance();
    $self->{UNKNOWN} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_UNDEFINED}, "UNKNOWN");
    $self->{ENTER} = 'org::allbinary::game::input::PCGameKey'->new(5, "Enter");
    $self->{_A} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_A}, "A");
    $self->{_B} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_B}, "B");
    $self->{_C} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_C}, "C");
    $self->{_D} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_D}, "D");
    $self->{_E} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_E}, "E");
    $self->{_F} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_F}, "F");
    $self->{_G} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_G}, "G");
    $self->{_H} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_H}, "H");
    $self->{_I} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_I}, "I");
    $self->{_J} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_J}, "J");
    $self->{_K} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_K}, "K");
    $self->{_L} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_L}, "L");
    $self->{_M} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_M}, "M");
    $self->{_N} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_N}, "N");
    $self->{_O} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_O}, "O");
    $self->{_P} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_P}, "P");
    $self->{_Q} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_Q}, "Q");
    $self->{_R} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_R}, "R");
    $self->{_S} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_S}, "S");
    $self->{_T} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_T}, "T");
    $self->{_U} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_U}, "U");
    $self->{_V} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_V}, "V");
    $self->{_W} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_W}, "W");
    $self->{_X} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_X}, "X");
    $self->{_Y} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_Y}, "Y");
    $self->{_Z} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_Z}, "Z");
    $self->{a} = 'org::allbinary::game::input::PCGameKey'->new(97, "a");
    $self->{b} = 'org::allbinary::game::input::PCGameKey'->new(98, "b");
    $self->{c} = 'org::allbinary::game::input::PCGameKey'->new(99, "c");
    $self->{d} = 'org::allbinary::game::input::PCGameKey'->new(100, "d");
    $self->{e} = 'org::allbinary::game::input::PCGameKey'->new(101, "e");
    $self->{f} = 'org::allbinary::game::input::PCGameKey'->new(102, "f");
    $self->{g} = 'org::allbinary::game::input::PCGameKey'->new(103, "g");
    $self->{h} = 'org::allbinary::game::input::PCGameKey'->new(104, "h");
    $self->{i} = 'org::allbinary::game::input::PCGameKey'->new(105, "i");
    $self->{j} = 'org::allbinary::game::input::PCGameKey'->new(106, "j");
    $self->{k} = 'org::allbinary::game::input::PCGameKey'->new(107, "k");
    $self->{l} = 'org::allbinary::game::input::PCGameKey'->new(108, "l");
    $self->{m} = 'org::allbinary::game::input::PCGameKey'->new(109, "m");
    $self->{n} = 'org::allbinary::game::input::PCGameKey'->new(110, "n");
    $self->{o} = 'org::allbinary::game::input::PCGameKey'->new(111, "o");
    $self->{p} = 'org::allbinary::game::input::PCGameKey'->new(112, "p");
    $self->{q} = 'org::allbinary::game::input::PCGameKey'->new(113, "q");
    $self->{r} = 'org::allbinary::game::input::PCGameKey'->new(114, "r");
    $self->{s} = 'org::allbinary::game::input::PCGameKey'->new(115, "s");
    $self->{t} = 'org::allbinary::game::input::PCGameKey'->new(116, "t");
    $self->{u} = 'org::allbinary::game::input::PCGameKey'->new(117, "u");
    $self->{v} = 'org::allbinary::game::input::PCGameKey'->new(118, "v");
    $self->{w} = 'org::allbinary::game::input::PCGameKey'->new(119, "w");
    $self->{x} = 'org::allbinary::game::input::PCGameKey'->new(120, 'org::allbinary::math::PositionStrings'->getInstance()->{X});
    $self->{y} = 'org::allbinary::game::input::PCGameKey'->new(121, 'org::allbinary::math::PositionStrings'->getInstance()->{Y});
    $self->{z} = 'org::allbinary::game::input::PCGameKey'->new(122, "z");
    $self->{ZERO} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_0}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
    $self->{ONE} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_1}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{ONE});
    $self->{TWO} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_2}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{TWO});
    $self->{THREE} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_3}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{THREE});
    $self->{FOUR} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_4}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{FOUR});
    $self->{FIVE} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_5}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{FIVE});
    $self->{SIX} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_6}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{SIX});
    $self->{SEVEN} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_7}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{SEVEN});
    $self->{EIGHT} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_8}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{EIGHT});
    $self->{NINE} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_9}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{NINE});
    $self->{DPAD_UP} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_UP}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{UP});
    $self->{DPAD_DOWN} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_DOWN}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{DOWN});
    $self->{DPAD_LEFT} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_LEFT}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{LEFT});
    $self->{DPAD_RIGHT} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_RIGHT}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{RIGHT});
    $self->{DPAD_UP2} = $self->{DPAD_UP};
    $self->{DPAD_DOWN2} = $self->{DPAD_DOWN};
    $self->{DPAD_LEFT2} = $self->{DPAD_LEFT};
    $self->{DPAD_RIGHT2} = $self->{DPAD_RIGHT};
    $self->{COMMA} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_COMMA}, "COMMA");
    $self->{SPACE} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_SPACE}, "SPACE");
    $self->{DEL} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_DELETE}, "DEL");
    $self->{STAR} = 'org::allbinary::game::input::PCGameKey'->new(42, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{STAR});
    $self->{QUESTION} = 'org::allbinary::game::input::PCGameKey'->new(47, "?");
    $self->{PERIOD} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_PERIOD}, 'org::allbinary::string::CommonSeps'->getInstance()->{PERIOD});
    $self->{ESCAPE} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_ESCAPE}, "Esc");
    $self->{BACK_SPACE} = 'org::allbinary::game::input::PCGameKey'->new($self->{keyEventWrapper}->{VK_BACK_SPACE}, "Backspace");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::PCKeyFactory::SINGLETON;
}


sub isSubmission {
    my ($self, $input) = @_;
        if ($input == $self->{ENTER}) {
            return 1;
        }
        return 0;
}


sub isDelete {
    my ($self, $input) = @_;
        if ($input == $self->{DEL}) {
            return 1;
        }
        return 0;
}


sub isBackSpace {
    my ($self, $input) = @_;
        if ($input == $self->{BACK_SPACE}) {
            return 1;
        }
        return 0;
}


sub isUp {
    my ($self, $input) = @_;
        if ($input == $self->{DPAD_UP} || $input == $self->{DPAD_UP2}) {
            return 1;
        }
        return 0;
}


sub isDown {
    my ($self, $input) = @_;
        if ($input == $self->{DPAD_DOWN} || $input == $self->{DPAD_DOWN2}) {
            return 1;
        }
        return 0;
}


sub isLeft {
    my ($self, $input) = @_;
        if ($input == $self->{DPAD_LEFT} || $input == $self->{DPAD_LEFT2}) {
            return 1;
        }
        return 0;
}


sub isRight {
    my ($self, $input) = @_;
        if ($input == $self->{DPAD_RIGHT} || $input == $self->{DPAD_RIGHT2}) {
            return 1;
        }
        return 0;
}


sub isEnter {
    my ($self, $input) = @_;
        if ($input == $self->{ENTER}) {
            return 1;
        }
        return 0;
}

use org::allbinary::math::PositionStrings;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::game::input::ABKeyEventWrapper;
use org::allbinary::game::input::PCGameKey;

1;

