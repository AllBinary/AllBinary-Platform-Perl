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

package org::allbinary::input::KeyUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub isNormallyDisplayed {
    my ($class, $keyCode) = @_;
        for my $switch_value ($keyCode) {
            if ($switch_value == $java::awt::event::KeyEvent::VK_SPACE || $switch_value == $java::awt::event::KeyEvent::VK_COMMA || $switch_value == $java::awt::event::KeyEvent::VK_MINUS || $switch_value == $java::awt::event::KeyEvent::VK_PERIOD || $switch_value == $java::awt::event::KeyEvent::VK_SLASH || $switch_value == $java::awt::event::KeyEvent::VK_0 || $switch_value == $java::awt::event::KeyEvent::VK_1 || $switch_value == $java::awt::event::KeyEvent::VK_2 || $switch_value == $java::awt::event::KeyEvent::VK_3 || $switch_value == $java::awt::event::KeyEvent::VK_4 || $switch_value == $java::awt::event::KeyEvent::VK_5 || $switch_value == $java::awt::event::KeyEvent::VK_6 || $switch_value == $java::awt::event::KeyEvent::VK_7 || $switch_value == $java::awt::event::KeyEvent::VK_8 || $switch_value == $java::awt::event::KeyEvent::VK_9 || $switch_value == $java::awt::event::KeyEvent::VK_SEMICOLON || $switch_value == $java::awt::event::KeyEvent::VK_EQUALS || $switch_value == $java::awt::event::KeyEvent::VK_A || $switch_value == $java::awt::event::KeyEvent::VK_B || $switch_value == $java::awt::event::KeyEvent::VK_C || $switch_value == $java::awt::event::KeyEvent::VK_D || $switch_value == $java::awt::event::KeyEvent::VK_E || $switch_value == $java::awt::event::KeyEvent::VK_F || $switch_value == $java::awt::event::KeyEvent::VK_G || $switch_value == $java::awt::event::KeyEvent::VK_H || $switch_value == $java::awt::event::KeyEvent::VK_I || $switch_value == $java::awt::event::KeyEvent::VK_J || $switch_value == $java::awt::event::KeyEvent::VK_K || $switch_value == $java::awt::event::KeyEvent::VK_L || $switch_value == $java::awt::event::KeyEvent::VK_M || $switch_value == $java::awt::event::KeyEvent::VK_N || $switch_value == $java::awt::event::KeyEvent::VK_O || $switch_value == $java::awt::event::KeyEvent::VK_P || $switch_value == $java::awt::event::KeyEvent::VK_Q || $switch_value == $java::awt::event::KeyEvent::VK_R || $switch_value == $java::awt::event::KeyEvent::VK_S || $switch_value == $java::awt::event::KeyEvent::VK_T || $switch_value == $java::awt::event::KeyEvent::VK_U || $switch_value == $java::awt::event::KeyEvent::VK_V || $switch_value == $java::awt::event::KeyEvent::VK_W || $switch_value == $java::awt::event::KeyEvent::VK_X || $switch_value == $java::awt::event::KeyEvent::VK_Y || $switch_value == $java::awt::event::KeyEvent::VK_Z || $switch_value == $java::awt::event::KeyEvent::VK_OPEN_BRACKET || $switch_value == $java::awt::event::KeyEvent::VK_BACK_SLASH || $switch_value == $java::awt::event::KeyEvent::VK_CLOSE_BRACKET || $switch_value == $java::awt::event::KeyEvent::VK_NUMPAD0 || $switch_value == $java::awt::event::KeyEvent::VK_NUMPAD1 || $switch_value == $java::awt::event::KeyEvent::VK_NUMPAD2 || $switch_value == $java::awt::event::KeyEvent::VK_NUMPAD3 || $switch_value == $java::awt::event::KeyEvent::VK_NUMPAD4 || $switch_value == $java::awt::event::KeyEvent::VK_NUMPAD5 || $switch_value == $java::awt::event::KeyEvent::VK_NUMPAD6 || $switch_value == $java::awt::event::KeyEvent::VK_NUMPAD7 || $switch_value == $java::awt::event::KeyEvent::VK_NUMPAD8 || $switch_value == $java::awt::event::KeyEvent::VK_NUMPAD9 || $switch_value == $java::awt::event::KeyEvent::VK_MULTIPLY || $switch_value == $java::awt::event::KeyEvent::VK_ADD || $switch_value == $java::awt::event::KeyEvent::VK_SEPARATER || $switch_value == $java::awt::event::KeyEvent::VK_SUBTRACT || $switch_value == $java::awt::event::KeyEvent::VK_DECIMAL || $switch_value == $java::awt::event::KeyEvent::VK_DIVIDE) {
                return 1;
            }
            {
                return 0;
            }
        }
}

# use java::awt::event::KeyEvent;

1;

