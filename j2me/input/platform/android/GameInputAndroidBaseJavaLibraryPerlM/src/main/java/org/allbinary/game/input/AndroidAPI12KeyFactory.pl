# Generated Code Do Not Modify

package org::allbinary::game::input::AndroidAPI12KeyFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::AndroidAPI9KeyFactory';

our $instance12 = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};


sub getAPI12Instance {
    my ($class) = @_;
        if ($org::allbinary::game::input::AndroidAPI12KeyFactory::instance12 == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::input::AndroidAPI12KeyFactory::instance12 = 'org::allbinary::game::input::AndroidAPI12KeyFactory'->new();
        }
        return $org::allbinary::game::input::AndroidAPI12KeyFactory::instance12;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        $self->{KEYCODE_BUTTON_1} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_1, "BUTTON 1");
        $self->{KEYCODE_BUTTON_10} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_10, "BUTTON 10");
        $self->{KEYCODE_BUTTON_11} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_11, "BUTTON 11");
        $self->{KEYCODE_BUTTON_12} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_12, "BUTTON 12");
        $self->{KEYCODE_BUTTON_13} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_13, "BUTTON 13");
        $self->{KEYCODE_BUTTON_14} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_14, "BUTTON 14");
        $self->{KEYCODE_BUTTON_15} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_15, "BUTTON 15");
        $self->{KEYCODE_BUTTON_16} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_16, "BUTTON 16");
        $self->{KEYCODE_BUTTON_2} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_2, "BUTTON 2");
        $self->{KEYCODE_BUTTON_3} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_3, "BUTTON 3");
        $self->{KEYCODE_BUTTON_4} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_4, "BUTTON 4");
        $self->{KEYCODE_BUTTON_5} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_5, "BUTTON 5");
        $self->{KEYCODE_BUTTON_6} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_6, "BUTTON 6");
        $self->{KEYCODE_BUTTON_7} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_7, "BUTTON 7");
        $self->{KEYCODE_BUTTON_8} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_8, "BUTTON 8");
        $self->{KEYCODE_BUTTON_9} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_9, "BUTTON 9");
    return $self;
}

use android::view::KeyEvent;
use org::allbinary::logic::NullUtil;
use org::allbinary::game::input::AndroidAPI9KeyFactory;
use org::allbinary::game::input::AndroidGameKey;

1;

