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
    $self->{UNKNOWN} = 'org::allbinary::game::input::PCGameKey'->new(254, "UNKNOWN");
    $self->{ENTER} = 'org::allbinary::game::input::PCGameKey'->new(13, "Enter");
    $self->{_A} = 'org::allbinary::game::input::PCGameKey'->new(65, "A");
    $self->{_B} = 'org::allbinary::game::input::PCGameKey'->new(66, "B");
    $self->{_C} = 'org::allbinary::game::input::PCGameKey'->new(67, "C");
    $self->{_D} = 'org::allbinary::game::input::PCGameKey'->new(68, "D");
    $self->{_E} = 'org::allbinary::game::input::PCGameKey'->new(69, "E");
    $self->{_F} = 'org::allbinary::game::input::PCGameKey'->new(70, "F");
    $self->{_G} = 'org::allbinary::game::input::PCGameKey'->new(71, "G");
    $self->{_H} = 'org::allbinary::game::input::PCGameKey'->new(72, "H");
    $self->{_I} = 'org::allbinary::game::input::PCGameKey'->new(73, "I");
    $self->{_J} = 'org::allbinary::game::input::PCGameKey'->new(74, "J");
    $self->{_K} = 'org::allbinary::game::input::PCGameKey'->new(75, "K");
    $self->{_L} = 'org::allbinary::game::input::PCGameKey'->new(76, "L");
    $self->{_M} = 'org::allbinary::game::input::PCGameKey'->new(77, "M");
    $self->{_N} = 'org::allbinary::game::input::PCGameKey'->new(78, "N");
    $self->{_O} = 'org::allbinary::game::input::PCGameKey'->new(79, "O");
    $self->{_P} = 'org::allbinary::game::input::PCGameKey'->new(80, "P");
    $self->{_Q} = 'org::allbinary::game::input::PCGameKey'->new(81, "Q");
    $self->{_R} = 'org::allbinary::game::input::PCGameKey'->new(82, "R");
    $self->{_S} = 'org::allbinary::game::input::PCGameKey'->new(83, "S");
    $self->{_T} = 'org::allbinary::game::input::PCGameKey'->new(84, "T");
    $self->{_U} = 'org::allbinary::game::input::PCGameKey'->new(85, "U");
    $self->{_V} = 'org::allbinary::game::input::PCGameKey'->new(86, "V");
    $self->{_W} = 'org::allbinary::game::input::PCGameKey'->new(87, "W");
    $self->{_X} = 'org::allbinary::game::input::PCGameKey'->new(88, "X");
    $self->{_Y} = 'org::allbinary::game::input::PCGameKey'->new(89, "Y");
    $self->{_Z} = 'org::allbinary::game::input::PCGameKey'->new(90, "Z");
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
    $self->{ZERO} = 'org::allbinary::game::input::PCGameKey'->new(48, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
    $self->{ONE} = 'org::allbinary::game::input::PCGameKey'->new(49, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{ONE});
    $self->{TWO} = 'org::allbinary::game::input::PCGameKey'->new(50, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{TWO});
    $self->{THREE} = 'org::allbinary::game::input::PCGameKey'->new(51, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{THREE});
    $self->{FOUR} = 'org::allbinary::game::input::PCGameKey'->new(52, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{FOUR});
    $self->{FIVE} = 'org::allbinary::game::input::PCGameKey'->new(53, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{FIVE});
    $self->{SIX} = 'org::allbinary::game::input::PCGameKey'->new(54, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{SIX});
    $self->{SEVEN} = 'org::allbinary::game::input::PCGameKey'->new(55, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{SEVEN});
    $self->{EIGHT} = 'org::allbinary::game::input::PCGameKey'->new(56, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{EIGHT});
    $self->{NINE} = 'org::allbinary::game::input::PCGameKey'->new(57, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{NINE});
    $self->{DPAD_UP} = 'org::allbinary::game::input::PCGameKey'->new(38, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{UP});
    $self->{DPAD_DOWN} = 'org::allbinary::game::input::PCGameKey'->new(40, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{DOWN});
    $self->{DPAD_LEFT} = 'org::allbinary::game::input::PCGameKey'->new(37, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{LEFT});
    $self->{DPAD_RIGHT} = 'org::allbinary::game::input::PCGameKey'->new(39, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{RIGHT});
    $self->{DPAD_UP2} = $self->{DPAD_UP};
    $self->{DPAD_DOWN2} = $self->{DPAD_DOWN};
    $self->{DPAD_LEFT2} = $self->{DPAD_LEFT};
    $self->{DPAD_RIGHT2} = $self->{DPAD_RIGHT};
    $self->{COMMA} = 'org::allbinary::game::input::PCGameKey'->new(44, "COMMA");
    $self->{SPACE} = 'org::allbinary::game::input::PCGameKey'->new(32, "SPACE");
    $self->{DEL} = 'org::allbinary::game::input::PCGameKey'->new(46, "DEL");
    $self->{STAR} = 'org::allbinary::game::input::PCGameKey'->new(42, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{STAR});
    $self->{QUESTION} = 'org::allbinary::game::input::PCGameKey'->new(47, "?");
    $self->{PERIOD} = 'org::allbinary::game::input::PCGameKey'->new(46, 'org::allbinary::string::CommonSeps'->getInstance()->{PERIOD});
    $self->{ESCAPE} = 'org::allbinary::game::input::PCGameKey'->new(27, "Esc");
    $self->{BACK_SPACE} = 'org::allbinary::game::input::PCGameKey'->new(8, "Backspace");
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
use org::allbinary::game::input::PCGameKey;

1;

