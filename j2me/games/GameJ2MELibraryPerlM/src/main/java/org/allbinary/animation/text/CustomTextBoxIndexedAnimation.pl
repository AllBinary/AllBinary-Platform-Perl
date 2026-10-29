# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::animation::text::CustomTextBoxIndexedAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation','org::allbinary::game::input::event::RawKeyEventListener','org::allbinary::graphics::font::UpdateMyFontInterface','org::allbinary::animation::text::TextInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{customTextBox} = undef;
    $self->{lastText} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{INIT_STRING};
    $self->{hasChanged} = 1;
    $self->{textChangeListener} = 'org::allbinary::animation::text::TextChangeListener'->getInstance();
}


sub new {
    my ($class, $customTextBox) = @_;
    my $self = $class->SUPER::new('org::allbinary::animation::AnimationBehavior'->getInstance());
    $self->_init_fields();
        # super(...) made $self above
        $self->{customTextBox} = $customTextBox;
    return $self;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{customTextBox}->getTextFieldItem()->setForegroundBasicColorP($basicColor);
}


sub setBackgroundBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{customTextBox}->getTextFieldItem()->setBackgroundBasicColorP($basicColor);
}


sub setTextWithOnMeasure {
    my ($self, $text, $textChangeListener) = @_;
        $self->setText($text);
        $self->{textChangeListener} = $textChangeListener;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{textChangeListener}->onMeasure();
        $self->{textChangeListener} = 'org::allbinary::animation::text::TextChangeListener'->getInstance();
}


sub setText {
    my ($self, $text) = @_;
        if ($self->{lastText} ne $text) {
            $self->{hasChanged} = 1;
            $self->{lastText} = $text;
            $self->{customTextBox}->getTextFieldItem()->setString($text);
        }
}


sub getText {
    my ($self) = @_;
        return $self->{customTextBox}->getTextFieldItem()->getString();
}


sub onEventRaw {
    my ($self, $keyCode, $deviceId, $repeated) = @_;
        $self->{customTextBox}->onEventRaw($keyCode, $deviceId, $repeated);
}


sub getFontHeight {
    my ($self) = @_;
        return $self->{customTextBox}->getTextFieldItem()->getFontHeight();
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{customTextBox}->paintXY($graphics, $x, $y);
}


sub paintThreedXYZ {
    my ($self, $graphics, $x, $y, $z) = @_;
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::game::input::event::RawKeyEventListener;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::form::item::CustomTextBox;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::animation::text::TextInterface;
use org::allbinary::animation::text::TextChangeListener;

1;

