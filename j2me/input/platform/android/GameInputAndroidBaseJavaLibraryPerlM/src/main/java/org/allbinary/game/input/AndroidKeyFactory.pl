# Generated Code Do Not Modify

package org::allbinary::game::input::AndroidKeyFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::ActivityFractureUtil';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{UNKNOWN} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_UNKNOWN, "UNKNOWN");
    $self->{KEYCODE_BUTTON_L1} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_R1} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_THUMBR} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_THUMBL} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_START} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_MODE} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_B} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_A} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_X} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_Y} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_L2} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_R2} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_SELECT} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_C} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_Z} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_1} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_10} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_11} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_12} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_13} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_14} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_15} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_16} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_2} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_3} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_4} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_5} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_6} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_7} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_8} = $self->{UNKNOWN};
    $self->{KEYCODE_BUTTON_9} = $self->{UNKNOWN};
    $self->{SOFT_LEFT} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_SOFT_LEFT, "SOFT_LEFT");
    $self->{SOFT_RIGHT} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_SOFT_RIGHT, "SOFT_RIGHT");
    $self->{HOME} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_HOME, "HOME");
    $self->{BACK} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BACK, "BACK");
    $self->{CALL} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_CALL, "CALL");
    $self->{ENDCALL} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_ENDCALL, "ENDCALL");
    $self->{ZERO} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_0, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
    $self->{ONE} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_1, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{ONE});
    $self->{TWO} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_2, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{TWO});
    $self->{THREE} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_3, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{THREE});
    $self->{FOUR} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_4, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{FOUR});
    $self->{FIVE} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_5, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{FIVE});
    $self->{SIX} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_6, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{SIX});
    $self->{SEVEN} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_7, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{SEVEN});
    $self->{EIGHT} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_8, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{EIGHT});
    $self->{NINE} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_9, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{NINE});
    $self->{STAR} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_STAR, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{STAR});
    $self->{POUND} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_POUND, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{POUND});
    $self->{DPAD_UP} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_DPAD_UP, "UP");
    $self->{DPAD_DOWN} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_DPAD_DOWN, "DOWN");
    $self->{DPAD_LEFT} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_DPAD_LEFT, "LEFT");
    $self->{DPAD_RIGHT} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_DPAD_RIGHT, "RIGHT");
    $self->{DPAD_CENTER} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_DPAD_CENTER, "CENTER");
    $self->{VOLUME_UP} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_VOLUME_UP, "VOLUME_UP");
    $self->{VOLUME_DOWN} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_VOLUME_DOWN, "VOLUME_DOWN");
    $self->{POWER} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_POWER, "POWER");
    $self->{CAMERA} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_CAMERA, "CAMERA");
    $self->{CLEAR} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_CLEAR, "CLEAR");
    $self->{A} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_A, "A");
    $self->{B} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_B, "B");
    $self->{C} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_C, "C");
    $self->{D} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_D, "D");
    $self->{E} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_E, "E");
    $self->{F} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_F, "F");
    $self->{G} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_G, "G");
    $self->{H} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_H, "H");
    $self->{I} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_I, "I");
    $self->{J} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_J, "J");
    $self->{K} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_K, "K");
    $self->{L} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_L, "L");
    $self->{M} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_M, "M");
    $self->{N} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_N, "N");
    $self->{O} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_O, "O");
    $self->{P} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_P, "P");
    $self->{Q} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_Q, "Q");
    $self->{R} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_R, "R");
    $self->{S} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_S, "S");
    $self->{T} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_T, "T");
    $self->{U} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_U, "U");
    $self->{V} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_V, "V");
    $self->{W} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_W, "W");
    $self->{X} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_X, "X");
    $self->{Y} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_Y, "Y");
    $self->{Z} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_Z, "Z");
    $self->{COMMA} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_COMMA, "COMMA");
    $self->{PERIOD} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_PERIOD, 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP});
    $self->{ALT_LEFT} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_ALT_LEFT, "ALT_LEFT");
    $self->{ALT_RIGHT} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_ALT_RIGHT, "ALT_RIGHT");
    $self->{SHIFT_LEFT} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_SHIFT_LEFT, "SHIFT_LEFT");
    $self->{SHIFT_RIGHT} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_SHIFT_RIGHT, "SHIFT_RIGHT");
    $self->{TAB} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_TAB, "TAB");
    $self->{SPACE} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_SPACE, "SPACE");
    $self->{SYM} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_SYM, "SYM");
    $self->{EXPLORER} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_EXPLORER, "EXPLORER");
    $self->{ENVELOPE} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_ENVELOPE, "ENVELOPE");
    $self->{ENTER} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_ENTER, "ENTER");
    $self->{DEL} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_DEL, "DEL");
    $self->{GRAVE} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_GRAVE, "GRAVE");
    $self->{MINUS} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_MINUS, "MINUS");
    $self->{EQUALS} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_EQUALS, "EQUALS");
    $self->{LEFT_BRACKET} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_LEFT_BRACKET, "LEFT_BRACKET");
    $self->{RIGHT_BRACKET} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_RIGHT_BRACKET, "RIGHT_BRACKET");
    $self->{BACKSLASH} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BACKSLASH, "BACKSLASH");
    $self->{SEMICOLON} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_SEMICOLON, "SEMICOLON");
    $self->{APOSTROPHE} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_APOSTROPHE, "APOSTROPHE");
    $self->{SLASH} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_SLASH, "SLASH");
    $self->{AT} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_AT, "AT");
    $self->{NUM} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_NUM, "NUM");
    $self->{HEADSETHOOK} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_HEADSETHOOK, "HEADSETHOOK");
    $self->{FOCUS} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_FOCUS, "FOCUS");
    $self->{PLUS} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_PLUS, "PLUS");
    $self->{MENU} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_MENU, "MENU");
    $self->{NOTIFICATION} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_NOTIFICATION, "NOTIFICATION");
    $self->{SEARCH} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_SEARCH, "SEARCH");
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF("Start/End", $self, $commonStrings->{INIT});
}


sub isSubmission {
    my ($self, $input) = @_;
        if ($input == $self->{ENTER}) {
            return 1;
        } elsif ($input == $self->{DPAD_CENTER}) {
            return 1;
        }
        return 0;
}


sub isDelete {
    my ($self, $input) = @_;
        return 0;
}


sub isBackSpace {
    my ($self, $input) = @_;
        if ($input == $self->{DEL}) {
            return 1;
        }
        return 0;
}


sub isLeft {
    my ($self, $input) = @_;
        if ($input == $self->{DPAD_LEFT}) {
            return 1;
        }
        return 0;
}


sub isRight {
    my ($self, $input) = @_;
        if ($input == $self->{DPAD_RIGHT}) {
            return 1;
        }
        return 0;
}


sub isUp {
    my ($self, $input) = @_;
        if ($input == $self->{DPAD_UP}) {
            return 1;
        }
        return 0;
}


sub isDown {
    my ($self, $input) = @_;
        if ($input == $self->{DPAD_DOWN}) {
            return 1;
        }
        return 0;
}


sub isEnter {
    my ($self, $input) = @_;
        if ($input == $self->{DPAD_CENTER}) {
            return 1;
        } elsif ($input == $self->{ENTER}) {
            return 1;
        } elsif ($input == $self->{CALL}) {
            return 1;
        }
        return 0;
}

use android::view::KeyEvent;
use org::allbinary::android::ActivityFractureUtil;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::input::AndroidGameKey;

1;

