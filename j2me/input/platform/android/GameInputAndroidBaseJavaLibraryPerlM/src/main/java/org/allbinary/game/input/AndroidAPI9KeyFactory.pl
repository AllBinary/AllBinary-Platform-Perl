# Generated Code Do Not Modify

package org::allbinary::game::input::AndroidAPI9KeyFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::AndroidKeyFactory';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::input::AndroidAPI9KeyFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::input::AndroidAPI9KeyFactory::instance = 'org::allbinary::game::input::AndroidAPI9KeyFactory'->new();
        }
        return $org::allbinary::game::input::AndroidAPI9KeyFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        $self->{KEYCODE_BUTTON_L1} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_L1, "BUTTON L1");
        $self->{KEYCODE_BUTTON_R1} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_R1, "BUTTON R1");
        $self->{KEYCODE_BUTTON_THUMBR} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_THUMBR, "BUTTON THUMBR");
        $self->{KEYCODE_BUTTON_THUMBL} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_THUMBL, "BUTTON THUMBL");
        $self->{KEYCODE_BUTTON_START} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_START, "BUTTON START");
        $self->{KEYCODE_BUTTON_MODE} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_MODE, "BUTTON MODE");
        $self->{KEYCODE_BUTTON_B} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_B, "BUTTON B");
        $self->{KEYCODE_BUTTON_A} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_A, "BUTTON A");
        $self->{KEYCODE_BUTTON_X} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_X, "BUTTON X");
        $self->{KEYCODE_BUTTON_Y} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_Y, "BUTTON Y");
        $self->{KEYCODE_BUTTON_L2} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_L2, "BUTTON L2");
        $self->{KEYCODE_BUTTON_R2} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_R2, "BUTTON R2");
        $self->{KEYCODE_BUTTON_SELECT} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_SELECT, "BUTTON SELECT");
        $self->{KEYCODE_BUTTON_C} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_C, "BUTTON C");
        $self->{KEYCODE_BUTTON_Z} = 'org::allbinary::game::input::AndroidGameKey'->new($android::view::KeyEvent::KEYCODE_BUTTON_Z, "BUTTON Z");
    return $self;
}

use android::view::KeyEvent;
use org::allbinary::logic::NullUtil;
use org::allbinary::game::input::AndroidKeyFactory;
use org::allbinary::game::input::AndroidGameKey;

1;

