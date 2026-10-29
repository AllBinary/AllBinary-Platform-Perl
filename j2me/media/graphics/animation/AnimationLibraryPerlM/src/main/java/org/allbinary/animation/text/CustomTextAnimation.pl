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

package org::allbinary::animation::text::CustomTextAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::text::TextAnimation','org::allbinary::animation::text::TextInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{fontDebugFactory} = 'org::allbinary::graphics::font::FontDebugFactory'->getInstance();
    $self->{fontSize} = undef;
    $self->{font} = undef;
    $self->{lastText} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{INIT_STRING};
    $self->{hasChanged} = 1;
    $self->{textWidth} = 0;
}


sub new {
    my ($class, $text, $fontSize, $animationBehavior) = @_;
    my $self = $class->SUPER::new($text, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{fontSize} = $fontSize;
        $self->{font} = 'javax::microedition::lcdui::Font'->getFont($javax::microedition::lcdui::Font::FACE_SYSTEM, $javax::microedition::lcdui::Font::STYLE_PLAIN, $fontSize);
    return $self;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $existingFont = $graphics->getFont();
        $self->{fontDebugFactory}->setFont($self->{font}, $graphics);
        $self->SUPER::paintXYNoUpdate($graphics, $x, $y);
        $self->{fontDebugFactory}->setFont($existingFont, $graphics);
}


sub setScale {
    my ($self, $scaleX, $scaleY) = @_;
        if ($scaleX != $scaleY) {
            die ("RuntimeException");
        }
        $self->{hasChanged} = 1;
        $self->{font} = 'javax::microedition::lcdui::Font'->getFont($javax::microedition::lcdui::Font::FACE_SYSTEM, $javax::microedition::lcdui::Font::STYLE_PLAIN, int(($self->{fontSize} * $scaleX)));
}


sub setText {
    my ($self, $text) = @_;
        if ($self->{lastText} ne $text) {
            $self->{hasChanged} = 1;
            $self->{lastText} = $text;
            $self->SUPER::setText($text);
        }
}


sub getText {
    my ($self) = @_;
        return $self->{lastText};
}


sub getWidth {
    my ($self) = @_;
        if ($self->{hasChanged}) {
            $self->{textWidth} = $self->{font}->stringWidth($self->{textArrayP}->[0]);
            $self->{hasChanged} = 0;
        }
        return $self->{textWidth};
}


sub getFontHeight {
    my ($self) = @_;
        return $self->{font}->getHeight();
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::graphics::font::FontDebugFactory;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::animation::text::TextAnimation;
use org::allbinary::animation::text::TextInterface;

1;

