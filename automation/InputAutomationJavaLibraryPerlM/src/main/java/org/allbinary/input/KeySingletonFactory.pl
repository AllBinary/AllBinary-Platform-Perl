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

package org::allbinary::input::KeySingletonFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $keyStringHashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
our $keyArray = [$java::awt::event::KeyEvent::VK_0, $java::awt::event::KeyEvent::VK_1, $java::awt::event::KeyEvent::VK_2, $java::awt::event::KeyEvent::VK_3, $java::awt::event::KeyEvent::VK_4, $java::awt::event::KeyEvent::VK_5, $java::awt::event::KeyEvent::VK_6, $java::awt::event::KeyEvent::VK_7, $java::awt::event::KeyEvent::VK_8, $java::awt::event::KeyEvent::VK_9, $java::awt::event::KeyEvent::VK_A, $java::awt::event::KeyEvent::VK_B, $java::awt::event::KeyEvent::VK_C, $java::awt::event::KeyEvent::VK_D, $java::awt::event::KeyEvent::VK_E, $java::awt::event::KeyEvent::VK_F, $java::awt::event::KeyEvent::VK_G, $java::awt::event::KeyEvent::VK_H, $java::awt::event::KeyEvent::VK_I, $java::awt::event::KeyEvent::VK_J, $java::awt::event::KeyEvent::VK_K, $java::awt::event::KeyEvent::VK_L, $java::awt::event::KeyEvent::VK_M, $java::awt::event::KeyEvent::VK_N, $java::awt::event::KeyEvent::VK_O, $java::awt::event::KeyEvent::VK_Q, $java::awt::event::KeyEvent::VK_R, $java::awt::event::KeyEvent::VK_S, $java::awt::event::KeyEvent::VK_T, $java::awt::event::KeyEvent::VK_U, $java::awt::event::KeyEvent::VK_V, $java::awt::event::KeyEvent::VK_W, $java::awt::event::KeyEvent::VK_X, $java::awt::event::KeyEvent::VK_Y, $java::awt::event::KeyEvent::VK_Z, $java::awt::event::KeyEvent::VK_NUMPAD0, $java::awt::event::KeyEvent::VK_NUMPAD1, $java::awt::event::KeyEvent::VK_NUMPAD2, $java::awt::event::KeyEvent::VK_NUMPAD3, $java::awt::event::KeyEvent::VK_NUMPAD4, $java::awt::event::KeyEvent::VK_NUMPAD5, $java::awt::event::KeyEvent::VK_NUMPAD6, $java::awt::event::KeyEvent::VK_NUMPAD7, $java::awt::event::KeyEvent::VK_NUMPAD8, $java::awt::event::KeyEvent::VK_NUMPAD9, $java::awt::event::KeyEvent::VK_NUM_LOCK, $java::awt::event::KeyEvent::VK_F1, $java::awt::event::KeyEvent::VK_F2, $java::awt::event::KeyEvent::VK_F3, $java::awt::event::KeyEvent::VK_F4, $java::awt::event::KeyEvent::VK_F5, $java::awt::event::KeyEvent::VK_F6, $java::awt::event::KeyEvent::VK_F7, $java::awt::event::KeyEvent::VK_F8, $java::awt::event::KeyEvent::VK_F9, $java::awt::event::KeyEvent::VK_F10, $java::awt::event::KeyEvent::VK_F11, $java::awt::event::KeyEvent::VK_F12, $java::awt::event::KeyEvent::VK_F13, $java::awt::event::KeyEvent::VK_F14, $java::awt::event::KeyEvent::VK_F15, $java::awt::event::KeyEvent::VK_F16, $java::awt::event::KeyEvent::VK_F17, $java::awt::event::KeyEvent::VK_F18, $java::awt::event::KeyEvent::VK_F19, $java::awt::event::KeyEvent::VK_F20, $java::awt::event::KeyEvent::VK_F21, $java::awt::event::KeyEvent::VK_F22, $java::awt::event::KeyEvent::VK_F23, $java::awt::event::KeyEvent::VK_F24, $java::awt::event::KeyEvent::VK_ACCEPT, $java::awt::event::KeyEvent::VK_ADD, $java::awt::event::KeyEvent::VK_AGAIN, $java::awt::event::KeyEvent::VK_ALL_CANDIDATES, $java::awt::event::KeyEvent::VK_ALPHANUMERIC, $java::awt::event::KeyEvent::VK_ALT, $java::awt::event::KeyEvent::VK_ALT_GRAPH, $java::awt::event::KeyEvent::VK_AMPERSAND, $java::awt::event::KeyEvent::VK_ASTERISK, $java::awt::event::KeyEvent::VK_AT, $java::awt::event::KeyEvent::VK_BACK_QUOTE, $java::awt::event::KeyEvent::VK_BACK_SLASH, $java::awt::event::KeyEvent::VK_BACK_SPACE, $java::awt::event::KeyEvent::VK_BEGIN, $java::awt::event::KeyEvent::VK_BRACELEFT, $java::awt::event::KeyEvent::VK_BRACERIGHT, $java::awt::event::KeyEvent::VK_CANCEL, $java::awt::event::KeyEvent::VK_CAPS_LOCK, $java::awt::event::KeyEvent::VK_CIRCUMFLEX, $java::awt::event::KeyEvent::VK_CLEAR, $java::awt::event::KeyEvent::VK_CLOSE_BRACKET, $java::awt::event::KeyEvent::VK_CODE_INPUT, $java::awt::event::KeyEvent::VK_COLON, $java::awt::event::KeyEvent::VK_COMMA, $java::awt::event::KeyEvent::VK_COMPOSE, $java::awt::event::KeyEvent::VK_CONTEXT_MENU, $java::awt::event::KeyEvent::VK_CONTROL, $java::awt::event::KeyEvent::VK_CONVERT, $java::awt::event::KeyEvent::VK_COPY, $java::awt::event::KeyEvent::VK_CUT, $java::awt::event::KeyEvent::VK_DEAD_ABOVEDOT, $java::awt::event::KeyEvent::VK_DEAD_ABOVERING, $java::awt::event::KeyEvent::VK_DEAD_ACUTE, $java::awt::event::KeyEvent::VK_DEAD_BREVE, $java::awt::event::KeyEvent::VK_DEAD_CARON, $java::awt::event::KeyEvent::VK_DEAD_CEDILLA, $java::awt::event::KeyEvent::VK_DEAD_CIRCUMFLEX, $java::awt::event::KeyEvent::VK_DEAD_DIAERESIS, $java::awt::event::KeyEvent::VK_DEAD_DOUBLEACUTE, $java::awt::event::KeyEvent::VK_DEAD_GRAVE, $java::awt::event::KeyEvent::VK_DEAD_IOTA, $java::awt::event::KeyEvent::VK_DEAD_MACRON, $java::awt::event::KeyEvent::VK_DEAD_OGONEK, $java::awt::event::KeyEvent::VK_DEAD_SEMIVOICED_SOUND, $java::awt::event::KeyEvent::VK_DEAD_TILDE, $java::awt::event::KeyEvent::VK_DEAD_VOICED_SOUND, $java::awt::event::KeyEvent::VK_DECIMAL, $java::awt::event::KeyEvent::VK_DELETE, $java::awt::event::KeyEvent::VK_DIVIDE, $java::awt::event::KeyEvent::VK_DOLLAR, $java::awt::event::KeyEvent::VK_DOWN, $java::awt::event::KeyEvent::VK_END, $java::awt::event::KeyEvent::VK_ENTER, $java::awt::event::KeyEvent::VK_EQUALS, $java::awt::event::KeyEvent::VK_ESCAPE, $java::awt::event::KeyEvent::VK_EURO_SIGN, $java::awt::event::KeyEvent::VK_EXCLAMATION_MARK, $java::awt::event::KeyEvent::VK_FINAL, $java::awt::event::KeyEvent::VK_FIND, $java::awt::event::KeyEvent::VK_FULL_WIDTH, $java::awt::event::KeyEvent::VK_GREATER, $java::awt::event::KeyEvent::VK_HALF_WIDTH, $java::awt::event::KeyEvent::VK_HELP, $java::awt::event::KeyEvent::VK_HIRAGANA, $java::awt::event::KeyEvent::VK_HOME, $java::awt::event::KeyEvent::VK_INPUT_METHOD_ON_OFF, $java::awt::event::KeyEvent::VK_INSERT, $java::awt::event::KeyEvent::VK_INVERTED_EXCLAMATION_MARK, $java::awt::event::KeyEvent::VK_JAPANESE_HIRAGANA, $java::awt::event::KeyEvent::VK_JAPANESE_KATAKANA, $java::awt::event::KeyEvent::VK_JAPANESE_ROMAN, $java::awt::event::KeyEvent::VK_KANA, $java::awt::event::KeyEvent::VK_KANA_LOCK, $java::awt::event::KeyEvent::VK_KANJI, $java::awt::event::KeyEvent::VK_KATAKANA, $java::awt::event::KeyEvent::VK_KP_DOWN, $java::awt::event::KeyEvent::VK_KP_LEFT, $java::awt::event::KeyEvent::VK_KP_RIGHT, $java::awt::event::KeyEvent::VK_KP_UP, $java::awt::event::KeyEvent::VK_LEFT, $java::awt::event::KeyEvent::VK_LEFT_PARENTHESIS, $java::awt::event::KeyEvent::VK_LESS, $java::awt::event::KeyEvent::VK_META, $java::awt::event::KeyEvent::VK_MINUS, $java::awt::event::KeyEvent::VK_MODECHANGE, $java::awt::event::KeyEvent::VK_MULTIPLY, $java::awt::event::KeyEvent::VK_NONCONVERT, $java::awt::event::KeyEvent::VK_NUMBER_SIGN, $java::awt::event::KeyEvent::VK_OPEN_BRACKET, $java::awt::event::KeyEvent::VK_PAGE_DOWN, $java::awt::event::KeyEvent::VK_PAGE_UP, $java::awt::event::KeyEvent::VK_PASTE, $java::awt::event::KeyEvent::VK_PAUSE, $java::awt::event::KeyEvent::VK_PERIOD, $java::awt::event::KeyEvent::VK_PLUS, $java::awt::event::KeyEvent::VK_PREVIOUS_CANDIDATE, $java::awt::event::KeyEvent::VK_PRINTSCREEN, $java::awt::event::KeyEvent::VK_PROPS, $java::awt::event::KeyEvent::VK_QUOTE, $java::awt::event::KeyEvent::VK_QUOTEDBL, $java::awt::event::KeyEvent::VK_RIGHT, $java::awt::event::KeyEvent::VK_RIGHT_PARENTHESIS, $java::awt::event::KeyEvent::VK_SCROLL_LOCK, $java::awt::event::KeyEvent::VK_SEMICOLON, $java::awt::event::KeyEvent::VK_SEPARATER, $java::awt::event::KeyEvent::VK_SEPARATOR, $java::awt::event::KeyEvent::VK_SHIFT, $java::awt::event::KeyEvent::VK_SLASH, $java::awt::event::KeyEvent::VK_SPACE, $java::awt::event::KeyEvent::VK_STOP, $java::awt::event::KeyEvent::VK_SUBTRACT, $java::awt::event::KeyEvent::VK_TAB, $java::awt::event::KeyEvent::VK_UNDEFINED, $java::awt::event::KeyEvent::VK_UNDERSCORE, $java::awt::event::KeyEvent::VK_UNDO, $java::awt::event::KeyEvent::VK_UP, $java::awt::event::KeyEvent::VK_WINDOWS];

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


{ # Java static initializer
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $STATIC_BLOCK = "Static Block";
        try {
            for (my $index = 0; $index < scalar(@{$keyArray}); $index++) {
                my $keyAsString = 'java::awt::event::KeyEvent'->getKeyText($keyArray->[$index]);
                $org::allbinary::input::KeySingletonFactory::keyStringHashtable->put($keyAsString, $keyArray->[$index]);
            }
        } catch ($e) {
            $logUtil->put($commonStrings->{EXCEPTION}, "KeySingleFactory", $STATIC_BLOCK, $e);
        }
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getHashtable {
    my ($class) = @_;
        return $org::allbinary::input::KeySingletonFactory::keyStringHashtable;
}


sub getInstance {
    my ($class, $index) = @_;
        return ("" . ($index));
}


sub getArray {
    my ($class) = @_;
        return $org::allbinary::input::KeySingletonFactory::keyArray;
}

# use java::awt::event::KeyEvent;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;

1;

