# Generated Code Do Not Modify

package org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $androidtoJavaMicroEditionKeyMap = [(0) x (17)];


sub init {
    my ($class) = @_;
        $org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey::androidtoJavaMicroEditionKeyMap->[$android::view::KeyEvent::KEYCODE_0] = $javax::microedition::lcdui::Canvas::KEY_NUM0;
        $org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey::androidtoJavaMicroEditionKeyMap->[$android::view::KeyEvent::KEYCODE_1] = $javax::microedition::lcdui::Canvas::KEY_NUM1;
        $org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey::androidtoJavaMicroEditionKeyMap->[$android::view::KeyEvent::KEYCODE_2] = $javax::microedition::lcdui::Canvas::KEY_NUM2;
        $org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey::androidtoJavaMicroEditionKeyMap->[$android::view::KeyEvent::KEYCODE_3] = $javax::microedition::lcdui::Canvas::KEY_NUM3;
        $org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey::androidtoJavaMicroEditionKeyMap->[$android::view::KeyEvent::KEYCODE_4] = $javax::microedition::lcdui::Canvas::KEY_NUM4;
        $org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey::androidtoJavaMicroEditionKeyMap->[$android::view::KeyEvent::KEYCODE_5] = $javax::microedition::lcdui::Canvas::KEY_NUM5;
        $org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey::androidtoJavaMicroEditionKeyMap->[$android::view::KeyEvent::KEYCODE_6] = $javax::microedition::lcdui::Canvas::KEY_NUM6;
        $org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey::androidtoJavaMicroEditionKeyMap->[$android::view::KeyEvent::KEYCODE_7] = $javax::microedition::lcdui::Canvas::KEY_NUM7;
        $org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey::androidtoJavaMicroEditionKeyMap->[$android::view::KeyEvent::KEYCODE_8] = $javax::microedition::lcdui::Canvas::KEY_NUM8;
        $org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey::androidtoJavaMicroEditionKeyMap->[$android::view::KeyEvent::KEYCODE_9] = $javax::microedition::lcdui::Canvas::KEY_NUM9;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getKey {
    my ($class, $key) = @_;
        if ($key < scalar(@{$org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey::androidtoJavaMicroEditionKeyMap})) {
            my $value = $org::allbinary::game::input::AndroidNumberKeyToJ2MECanvasNumberKey::androidtoJavaMicroEditionKeyMap->[$key];
            if ($value != 0) {
                return $value;
            }
        }
        return $key;
}

# use javax::microedition::lcdui::Canvas;
use android::view::KeyEvent;

1;

