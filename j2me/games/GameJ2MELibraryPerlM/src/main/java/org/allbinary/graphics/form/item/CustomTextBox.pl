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

package org::allbinary::graphics::form::item::CustomTextBox;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::GameCommandCanvas','org::allbinary::game::input::event::RawKeyEventListener';


sub _init_fields {
    my ($self) = @_;
    $self->{textFieldItem} = undef;
    $self->{inputFactory} = 'org::allbinary::game::input::InputFactory'->getInstance();
}


sub new {
    my ($class, $cmdListener, $label, $text, $maxSize, $constraints, $font, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($cmdListener, $label, $backgroundBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $textFieldItem = 'org::allbinary::graphics::form::item::ABTextFieldItem'->new($self, 'org::allbinary::graphics::form::item::validation::TextItemVisitor'->new(), $stringUtil->{EMPTY_STRING}, $stringUtil->{EMPTY_STRING}, $maxSize, 0, $stringUtil->{EMPTY_STRING}, $font, $backgroundBasicColor, $foregroundBasicColor);
        $textFieldItem->setString($text);
        $self->{textFieldItem} = $textFieldItem;
        $self->setTitle($label);
    return $self;
}


sub submit {
    my ($self) = @_;
}


sub onEventRaw {
    my ($self, $keyCode, $deviceId, $repeated) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{START})->appendint($keyCode)->toString(), $self, "onEvent");
        $self->keyPressedByDevice($keyCode, $deviceId);
}


sub keyPressed {
    my ($self, $keyCode) = @_;
        $self->keyPressedByDevice($keyCode, 0);
}


sub keyReleased {
    my ($self, $keyCode) = @_;
        $self->keyReleasedByDevice($keyCode, 0);
}


sub keyRepeated {
    my ($self, $keyCode) = @_;
        $self->keyRepeatedByDevice($keyCode, 0);
}


sub keyPressedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
        try {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->appendint($keyCode)->toString(), $self, $self->{gameInputStrings}->{KEY_PRESSED});
            my $platformKeyFactory = 'org::allbinary::game::input::PlatformKeyFactory'->getInstance();
            my $input = $self->{inputFactory}->getInstanceById($keyCode);
            if ($platformKeyFactory->isSubmission($input)) {
                $self->submit();
            } else {
                $self->{textFieldItem}->keyPressed($keyCode);
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{gameInputStrings}->{KEY_PRESSED}, $e);
        }
}


sub keyReleasedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
}


sub paint {
    my ($self, $graphics) = @_;
        $graphics->setColor($self->{backgroundColor});
        $graphics->fillRect(0, 0, $self->{displayInfo}->getLastWidth(), $self->{displayInfo}->getLastHeight());
        $graphics->setColor($self->{foregroundColor});
        if (!'org::allbinary::J2MEUtil'->isJ2ME()) {
            $graphics->drawString($self->getTitle(), 8, 1, 0);
        }
        $self->paintXY($graphics, 8, $graphics->getFont()->getHeight() + 2);
        $self->SUPER::paint($graphics);
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{textFieldItem}->paintXY($graphics, $x, $y);
}


sub getTextFieldItem {
    my ($self) = @_;
        return $self->{textFieldItem};
}

# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::J2MEUtil;
use org::allbinary::game::displayable::canvas::GameCommandCanvas;
use org::allbinary::game::input::Input;
use org::allbinary::game::input::InputFactory;
use org::allbinary::game::input::PlatformKeyFactory;
use org::allbinary::game::input::event::RawKeyEventListener;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::form::item::validation::TextItemVisitor;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::graphics::form::item::ABTextFieldItem;

1;

