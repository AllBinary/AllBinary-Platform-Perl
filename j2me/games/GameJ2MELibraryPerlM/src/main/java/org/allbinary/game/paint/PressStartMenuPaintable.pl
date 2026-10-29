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

package org::allbinary::game::paint::PressStartMenuPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::paint::Paintable','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{displayInfo} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{PRESS_START} = "Press Screen To Start";
    $self->{KEY_START} = "Press or Click F2 To Begin";
    $self->{MENU_START} = "Press Start From The Menu To Begin";
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{startString} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(1100);
    $self->{flash} = 0;
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
    $self->{beginWidth} = 0;
    $self->{line} = 0;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        if ('org::allbinary::input::motion::button::TouchScreenFactory'->getInstance()->isTouch()) {
            $self->{startString} = $self->{PRESS_START};
        } elsif ('org::allbinary::AppletUtil'->isAppletLoader($self)) {
            $self->{startString} = $self->{KEY_START};
        } else {
            $self->{startString} = $self->{MENU_START};
        }
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{beginWidth} = (POSIX::floor(($graphics->getFont()->stringWidth($self->{startString})) / (2 ** (1))));
        $self->{line} = (4 * 'org::allbinary::graphics::font::MyFontProcessor'->defaultCharWidth($font)) + (POSIX::floor(($font->getHeight()) / (2 ** (1))));
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub paint {
    my ($self, $graphics) = @_;
        if ($self->{timeDelayHelper}->isTimeTNT()) {
            if ($self->isFlash()) {
                $self->setFlash(0);
            } else {
                $self->setFlash(1);
            }
        }
        if ($self->isFlash()) {
            $self->{myFontProcessor}->process($graphics);
            $graphics->drawString($self->{startString}, $self->{displayInfo}->getLastHalfWidth() - $self->{beginWidth}, $self->{displayInfo}->getLastHeight() - $self->{line}, $self->{anchor});
        }
}


sub setFlash {
    my ($self, $flash) = @_;
        $self->{flash} = $flash;
}


sub isFlash {
    my ($self) = @_;
        return $self->{flash};
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::AppletUtil;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::input::motion::button::TouchScreenFactory;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::time::TimeDelayHelper;

1;

