# 
# AllBinary Open License Version 1 
# Copyright (c) 2026 AllBinary 
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

package org::allbinary::game::input::ABKeyEventWrapper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::ABKeyEventWrapper'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{VK_ENTER} = $java::awt::event::KeyEvent::VK_ENTER;
    $self->{VK_BACK_SPACE} = $java::awt::event::KeyEvent::VK_BACK_SPACE;
    $self->{VK_TAB} = $java::awt::event::KeyEvent::VK_TAB;
    $self->{VK_CANCEL} = $java::awt::event::KeyEvent::VK_CANCEL;
    $self->{VK_CLEAR} = $java::awt::event::KeyEvent::VK_CLEAR;
    $self->{VK_SHIFT} = $java::awt::event::KeyEvent::VK_SHIFT;
    $self->{VK_CONTROL} = $java::awt::event::KeyEvent::VK_CONTROL;
    $self->{VK_ALT} = $java::awt::event::KeyEvent::VK_ALT;
    $self->{VK_PAUSE} = $java::awt::event::KeyEvent::VK_PAUSE;
    $self->{VK_CAPS_LOCK} = $java::awt::event::KeyEvent::VK_CAPS_LOCK;
    $self->{VK_ESCAPE} = $java::awt::event::KeyEvent::VK_ESCAPE;
    $self->{VK_SPACE} = $java::awt::event::KeyEvent::VK_SPACE;
    $self->{VK_PAGE_UP} = $java::awt::event::KeyEvent::VK_PAGE_UP;
    $self->{VK_PAGE_DOWN} = $java::awt::event::KeyEvent::VK_PAGE_DOWN;
    $self->{VK_END} = $java::awt::event::KeyEvent::VK_END;
    $self->{VK_HOME} = $java::awt::event::KeyEvent::VK_HOME;
    $self->{VK_LEFT} = $java::awt::event::KeyEvent::VK_LEFT;
    $self->{VK_UP} = $java::awt::event::KeyEvent::VK_UP;
    $self->{VK_RIGHT} = $java::awt::event::KeyEvent::VK_RIGHT;
    $self->{VK_DOWN} = $java::awt::event::KeyEvent::VK_DOWN;
    $self->{VK_COMMA} = $java::awt::event::KeyEvent::VK_COMMA;
    $self->{VK_MINUS} = $java::awt::event::KeyEvent::VK_MINUS;
    $self->{VK_PERIOD} = $java::awt::event::KeyEvent::VK_PERIOD;
    $self->{VK_SLASH} = $java::awt::event::KeyEvent::VK_SLASH;
    $self->{VK_0} = $java::awt::event::KeyEvent::VK_0;
    $self->{VK_1} = $java::awt::event::KeyEvent::VK_1;
    $self->{VK_2} = $java::awt::event::KeyEvent::VK_2;
    $self->{VK_3} = $java::awt::event::KeyEvent::VK_3;
    $self->{VK_4} = $java::awt::event::KeyEvent::VK_4;
    $self->{VK_5} = $java::awt::event::KeyEvent::VK_5;
    $self->{VK_6} = $java::awt::event::KeyEvent::VK_6;
    $self->{VK_7} = $java::awt::event::KeyEvent::VK_7;
    $self->{VK_8} = $java::awt::event::KeyEvent::VK_8;
    $self->{VK_9} = $java::awt::event::KeyEvent::VK_9;
    $self->{VK_SEMICOLON} = $java::awt::event::KeyEvent::VK_SEMICOLON;
    $self->{VK_EQUALS} = $java::awt::event::KeyEvent::VK_EQUALS;
    $self->{VK_A} = $java::awt::event::KeyEvent::VK_A;
    $self->{VK_B} = $java::awt::event::KeyEvent::VK_B;
    $self->{VK_C} = $java::awt::event::KeyEvent::VK_C;
    $self->{VK_D} = $java::awt::event::KeyEvent::VK_D;
    $self->{VK_E} = $java::awt::event::KeyEvent::VK_E;
    $self->{VK_F} = $java::awt::event::KeyEvent::VK_F;
    $self->{VK_G} = $java::awt::event::KeyEvent::VK_G;
    $self->{VK_H} = $java::awt::event::KeyEvent::VK_H;
    $self->{VK_I} = $java::awt::event::KeyEvent::VK_I;
    $self->{VK_J} = $java::awt::event::KeyEvent::VK_J;
    $self->{VK_K} = $java::awt::event::KeyEvent::VK_K;
    $self->{VK_L} = $java::awt::event::KeyEvent::VK_L;
    $self->{VK_M} = $java::awt::event::KeyEvent::VK_M;
    $self->{VK_N} = $java::awt::event::KeyEvent::VK_N;
    $self->{VK_O} = $java::awt::event::KeyEvent::VK_O;
    $self->{VK_P} = $java::awt::event::KeyEvent::VK_P;
    $self->{VK_Q} = $java::awt::event::KeyEvent::VK_Q;
    $self->{VK_R} = $java::awt::event::KeyEvent::VK_R;
    $self->{VK_S} = $java::awt::event::KeyEvent::VK_S;
    $self->{VK_T} = $java::awt::event::KeyEvent::VK_T;
    $self->{VK_U} = $java::awt::event::KeyEvent::VK_U;
    $self->{VK_V} = $java::awt::event::KeyEvent::VK_V;
    $self->{VK_W} = $java::awt::event::KeyEvent::VK_W;
    $self->{VK_X} = $java::awt::event::KeyEvent::VK_X;
    $self->{VK_Y} = $java::awt::event::KeyEvent::VK_Y;
    $self->{VK_Z} = $java::awt::event::KeyEvent::VK_Z;
    $self->{VK_OPEN_BRACKET} = $java::awt::event::KeyEvent::VK_OPEN_BRACKET;
    $self->{VK_BACK_SLASH} = $java::awt::event::KeyEvent::VK_BACK_SLASH;
    $self->{VK_CLOSE_BRACKET} = $java::awt::event::KeyEvent::VK_CLOSE_BRACKET;
    $self->{VK_NUMPAD0} = $java::awt::event::KeyEvent::VK_NUMPAD0;
    $self->{VK_NUMPAD1} = $java::awt::event::KeyEvent::VK_NUMPAD1;
    $self->{VK_NUMPAD2} = $java::awt::event::KeyEvent::VK_NUMPAD2;
    $self->{VK_NUMPAD3} = $java::awt::event::KeyEvent::VK_NUMPAD3;
    $self->{VK_NUMPAD4} = $java::awt::event::KeyEvent::VK_NUMPAD4;
    $self->{VK_NUMPAD5} = $java::awt::event::KeyEvent::VK_NUMPAD5;
    $self->{VK_NUMPAD6} = $java::awt::event::KeyEvent::VK_NUMPAD6;
    $self->{VK_NUMPAD7} = $java::awt::event::KeyEvent::VK_NUMPAD7;
    $self->{VK_NUMPAD8} = $java::awt::event::KeyEvent::VK_NUMPAD8;
    $self->{VK_NUMPAD9} = $java::awt::event::KeyEvent::VK_NUMPAD9;
    $self->{VK_MULTIPLY} = $java::awt::event::KeyEvent::VK_MULTIPLY;
    $self->{VK_ADD} = $java::awt::event::KeyEvent::VK_ADD;
    $self->{VK_SEPARATER} = $java::awt::event::KeyEvent::VK_SEPARATER;
    $self->{VK_SEPARATOR} = $java::awt::event::KeyEvent::VK_SEPARATOR;
    $self->{VK_SUBTRACT} = $java::awt::event::KeyEvent::VK_SUBTRACT;
    $self->{VK_DECIMAL} = $java::awt::event::KeyEvent::VK_DECIMAL;
    $self->{VK_DIVIDE} = $java::awt::event::KeyEvent::VK_DIVIDE;
    $self->{VK_DELETE} = $java::awt::event::KeyEvent::VK_DELETE;
    $self->{VK_NUM_LOCK} = $java::awt::event::KeyEvent::VK_NUM_LOCK;
    $self->{VK_SCROLL_LOCK} = $java::awt::event::KeyEvent::VK_SCROLL_LOCK;
    $self->{VK_F1} = $java::awt::event::KeyEvent::VK_F1;
    $self->{VK_F2} = $java::awt::event::KeyEvent::VK_F2;
    $self->{VK_F3} = $java::awt::event::KeyEvent::VK_F3;
    $self->{VK_F4} = $java::awt::event::KeyEvent::VK_F4;
    $self->{VK_F5} = $java::awt::event::KeyEvent::VK_F5;
    $self->{VK_F6} = $java::awt::event::KeyEvent::VK_F6;
    $self->{VK_F7} = $java::awt::event::KeyEvent::VK_F7;
    $self->{VK_F8} = $java::awt::event::KeyEvent::VK_F8;
    $self->{VK_F9} = $java::awt::event::KeyEvent::VK_F9;
    $self->{VK_F10} = $java::awt::event::KeyEvent::VK_F10;
    $self->{VK_F11} = $java::awt::event::KeyEvent::VK_F11;
    $self->{VK_F12} = $java::awt::event::KeyEvent::VK_F12;
    $self->{VK_F13} = $java::awt::event::KeyEvent::VK_F13;
    $self->{VK_F14} = $java::awt::event::KeyEvent::VK_F14;
    $self->{VK_F15} = $java::awt::event::KeyEvent::VK_F15;
    $self->{VK_F16} = $java::awt::event::KeyEvent::VK_F16;
    $self->{VK_F17} = $java::awt::event::KeyEvent::VK_F17;
    $self->{VK_F18} = $java::awt::event::KeyEvent::VK_F18;
    $self->{VK_F19} = $java::awt::event::KeyEvent::VK_F19;
    $self->{VK_F20} = $java::awt::event::KeyEvent::VK_F20;
    $self->{VK_F21} = $java::awt::event::KeyEvent::VK_F21;
    $self->{VK_F22} = $java::awt::event::KeyEvent::VK_F22;
    $self->{VK_F23} = $java::awt::event::KeyEvent::VK_F23;
    $self->{VK_F24} = $java::awt::event::KeyEvent::VK_F24;
    $self->{VK_PRINTSCREEN} = $java::awt::event::KeyEvent::VK_PRINTSCREEN;
    $self->{VK_INSERT} = $java::awt::event::KeyEvent::VK_INSERT;
    $self->{VK_HELP} = $java::awt::event::KeyEvent::VK_HELP;
    $self->{VK_META} = $java::awt::event::KeyEvent::VK_META;
    $self->{VK_BACK_QUOTE} = $java::awt::event::KeyEvent::VK_BACK_QUOTE;
    $self->{VK_QUOTE} = $java::awt::event::KeyEvent::VK_QUOTE;
    $self->{VK_KP_UP} = $java::awt::event::KeyEvent::VK_KP_UP;
    $self->{VK_KP_DOWN} = $java::awt::event::KeyEvent::VK_KP_DOWN;
    $self->{VK_KP_LEFT} = $java::awt::event::KeyEvent::VK_KP_LEFT;
    $self->{VK_KP_RIGHT} = $java::awt::event::KeyEvent::VK_KP_RIGHT;
    $self->{VK_DEAD_GRAVE} = $java::awt::event::KeyEvent::VK_DEAD_GRAVE;
    $self->{VK_DEAD_ACUTE} = $java::awt::event::KeyEvent::VK_DEAD_ACUTE;
    $self->{VK_DEAD_CIRCUMFLEX} = $java::awt::event::KeyEvent::VK_DEAD_CIRCUMFLEX;
    $self->{VK_DEAD_TILDE} = $java::awt::event::KeyEvent::VK_DEAD_TILDE;
    $self->{VK_DEAD_MACRON} = $java::awt::event::KeyEvent::VK_DEAD_MACRON;
    $self->{VK_DEAD_BREVE} = $java::awt::event::KeyEvent::VK_DEAD_BREVE;
    $self->{VK_DEAD_ABOVEDOT} = $java::awt::event::KeyEvent::VK_DEAD_ABOVEDOT;
    $self->{VK_DEAD_DIAERESIS} = $java::awt::event::KeyEvent::VK_DEAD_DIAERESIS;
    $self->{VK_DEAD_ABOVERING} = $java::awt::event::KeyEvent::VK_DEAD_ABOVERING;
    $self->{VK_DEAD_DOUBLEACUTE} = $java::awt::event::KeyEvent::VK_DEAD_DOUBLEACUTE;
    $self->{VK_DEAD_CARON} = $java::awt::event::KeyEvent::VK_DEAD_CARON;
    $self->{VK_DEAD_CEDILLA} = $java::awt::event::KeyEvent::VK_DEAD_CEDILLA;
    $self->{VK_DEAD_OGONEK} = $java::awt::event::KeyEvent::VK_DEAD_OGONEK;
    $self->{VK_DEAD_IOTA} = $java::awt::event::KeyEvent::VK_DEAD_IOTA;
    $self->{VK_DEAD_VOICED_SOUND} = $java::awt::event::KeyEvent::VK_DEAD_VOICED_SOUND;
    $self->{VK_DEAD_SEMIVOICED_SOUND} = $java::awt::event::KeyEvent::VK_DEAD_SEMIVOICED_SOUND;
    $self->{VK_AMPERSAND} = $java::awt::event::KeyEvent::VK_AMPERSAND;
    $self->{VK_ASTERISK} = $java::awt::event::KeyEvent::VK_ASTERISK;
    $self->{VK_QUOTEDBL} = $java::awt::event::KeyEvent::VK_QUOTEDBL;
    $self->{VK_LESS} = $java::awt::event::KeyEvent::VK_LESS;
    $self->{VK_GREATER} = $java::awt::event::KeyEvent::VK_GREATER;
    $self->{VK_BRACELEFT} = $java::awt::event::KeyEvent::VK_BRACELEFT;
    $self->{VK_BRACERIGHT} = $java::awt::event::KeyEvent::VK_BRACERIGHT;
    $self->{VK_AT} = $java::awt::event::KeyEvent::VK_AT;
    $self->{VK_COLON} = $java::awt::event::KeyEvent::VK_COLON;
    $self->{VK_CIRCUMFLEX} = $java::awt::event::KeyEvent::VK_CIRCUMFLEX;
    $self->{VK_DOLLAR} = $java::awt::event::KeyEvent::VK_DOLLAR;
    $self->{VK_EURO_SIGN} = $java::awt::event::KeyEvent::VK_EURO_SIGN;
    $self->{VK_EXCLAMATION_MARK} = $java::awt::event::KeyEvent::VK_EXCLAMATION_MARK;
    $self->{VK_INVERTED_EXCLAMATION_MARK} = $java::awt::event::KeyEvent::VK_INVERTED_EXCLAMATION_MARK;
    $self->{VK_LEFT_PARENTHESIS} = $java::awt::event::KeyEvent::VK_LEFT_PARENTHESIS;
    $self->{VK_NUMBER_SIGN} = $java::awt::event::KeyEvent::VK_NUMBER_SIGN;
    $self->{VK_PLUS} = $java::awt::event::KeyEvent::VK_PLUS;
    $self->{VK_RIGHT_PARENTHESIS} = $java::awt::event::KeyEvent::VK_RIGHT_PARENTHESIS;
    $self->{VK_UNDERSCORE} = $java::awt::event::KeyEvent::VK_UNDERSCORE;
    $self->{VK_WINDOWS} = $java::awt::event::KeyEvent::VK_WINDOWS;
    $self->{VK_CONTEXT_MENU} = $java::awt::event::KeyEvent::VK_CONTEXT_MENU;
    $self->{VK_FINAL} = $java::awt::event::KeyEvent::VK_FINAL;
    $self->{VK_CONVERT} = $java::awt::event::KeyEvent::VK_CONVERT;
    $self->{VK_NONCONVERT} = $java::awt::event::KeyEvent::VK_NONCONVERT;
    $self->{VK_ACCEPT} = $java::awt::event::KeyEvent::VK_ACCEPT;
    $self->{VK_MODECHANGE} = $java::awt::event::KeyEvent::VK_MODECHANGE;
    $self->{VK_KANA} = $java::awt::event::KeyEvent::VK_KANA;
    $self->{VK_KANJI} = $java::awt::event::KeyEvent::VK_KANJI;
    $self->{VK_ALPHANUMERIC} = $java::awt::event::KeyEvent::VK_ALPHANUMERIC;
    $self->{VK_KATAKANA} = $java::awt::event::KeyEvent::VK_KATAKANA;
    $self->{VK_HIRAGANA} = $java::awt::event::KeyEvent::VK_HIRAGANA;
    $self->{VK_FULL_WIDTH} = $java::awt::event::KeyEvent::VK_FULL_WIDTH;
    $self->{VK_HALF_WIDTH} = $java::awt::event::KeyEvent::VK_HALF_WIDTH;
    $self->{VK_ROMAN_CHARACTERS} = $java::awt::event::KeyEvent::VK_ROMAN_CHARACTERS;
    $self->{VK_ALL_CANDIDATES} = $java::awt::event::KeyEvent::VK_ALL_CANDIDATES;
    $self->{VK_PREVIOUS_CANDIDATE} = $java::awt::event::KeyEvent::VK_PREVIOUS_CANDIDATE;
    $self->{VK_CODE_INPUT} = $java::awt::event::KeyEvent::VK_CODE_INPUT;
    $self->{VK_JAPANESE_KATAKANA} = $java::awt::event::KeyEvent::VK_JAPANESE_KATAKANA;
    $self->{VK_JAPANESE_HIRAGANA} = $java::awt::event::KeyEvent::VK_JAPANESE_HIRAGANA;
    $self->{VK_JAPANESE_ROMAN} = $java::awt::event::KeyEvent::VK_JAPANESE_ROMAN;
    $self->{VK_KANA_LOCK} = $java::awt::event::KeyEvent::VK_KANA_LOCK;
    $self->{VK_INPUT_METHOD_ON_OFF} = $java::awt::event::KeyEvent::VK_INPUT_METHOD_ON_OFF;
    $self->{VK_CUT} = $java::awt::event::KeyEvent::VK_CUT;
    $self->{VK_COPY} = $java::awt::event::KeyEvent::VK_COPY;
    $self->{VK_PASTE} = $java::awt::event::KeyEvent::VK_PASTE;
    $self->{VK_UNDO} = $java::awt::event::KeyEvent::VK_UNDO;
    $self->{VK_AGAIN} = $java::awt::event::KeyEvent::VK_AGAIN;
    $self->{VK_FIND} = $java::awt::event::KeyEvent::VK_FIND;
    $self->{VK_PROPS} = $java::awt::event::KeyEvent::VK_PROPS;
    $self->{VK_STOP} = $java::awt::event::KeyEvent::VK_STOP;
    $self->{VK_COMPOSE} = $java::awt::event::KeyEvent::VK_COMPOSE;
    $self->{VK_ALT_GRAPH} = $java::awt::event::KeyEvent::VK_ALT_GRAPH;
    $self->{VK_BEGIN} = $java::awt::event::KeyEvent::VK_BEGIN;
    $self->{VK_UNDEFINED} = $java::awt::event::KeyEvent::VK_UNDEFINED;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::ABKeyEventWrapper::instance;
}

# use java::awt::event::KeyEvent;
# use jsinterop::annotations::JsType;

1;

