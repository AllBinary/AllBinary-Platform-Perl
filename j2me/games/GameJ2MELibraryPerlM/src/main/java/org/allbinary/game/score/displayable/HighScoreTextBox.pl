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

package org::allbinary::game::score::displayable::HighScoreTextBox;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::CustomTextBox';


sub _init_fields {
    my ($self) = @_;
    $self->{virtualKeyboardEventHandler} = 'org::allbinary::input::event::VirtualKeyboardEventHandler'->getInstance();
    $self->{highScoreUtil} = undef;
    $self->{pleaseWait} = 'org::allbinary::graphics::paint::SimpleTextPaintable'->new($self->{commonStrings}->{PLEASE_WAIT}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
    $self->{paintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{submitted} = 0;
}


sub new {
    my ($class, $highScoresFactoryInterface, $highScoresHelper, $abeClientInformation, $gameInfo, $cmdListener, $name, $highScore, $backgrounBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($cmdListener, "New High Score Enter Name:", $name, 12, $javax::microedition::lcdui::TextField::ANY, 'javax::microedition::lcdui::Font'->getDefaultFont(), $backgrounBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{highScoreUtil} = 'org::allbinary::game::score::displayable::HighScoreUtil'->new($highScoresFactoryInterface, $highScoresHelper, $abeClientInformation, $gameInfo, $cmdListener, $name, $highScore);
        my $operatingSystemInterface = 'org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
        if ($operatingSystemInterface->isOverScan()) {
            my $username = 'org::allbinary::logic::system::security::licensing::InApplicationPurchaseFactory'->getInstance()->getUserName();
            if (defined($username)) {
                $self->getTextFieldItem()->setString($username);
            } else {
                $self->getTextFieldItem()->setString("NoGamerInfo");
            }
        }
    return $self;
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        $self->removeAllCommands();
        'org::allbinary::PostGameCommandFactory'->getInstance()->addCommands($self);
        $self->addCommand($org::allbinary::game::score::displayable::HighScoreUtil::SUBMIT_TEXTBOX_COMMAND);
        $self->setCommandListener($cmdListener);
}


sub open {
    my ($self) = @_;
        $self->{virtualKeyboardEventHandler}->open();
        $self->{paintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
        $self->SUPER::open();
}


# throws Exception
sub close {
    my ($self) = @_;
        $self->{virtualKeyboardEventHandler}->close();
        $self->{paintable} = $self->{pleaseWait};
        $self->{repaintBehavior}->onChangeRepaint($self);
        $self->SUPER::close();
        $self->removeCommand($org::allbinary::game::score::displayable::HighScoreUtil::SUBMIT_TEXTBOX_COMMAND);
        $self->update();
        if ($self->{submitted}) {
            $self->{highScoreUtil}->saveHighScore();
        } else {
        }
        $self->{paintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
        $self->{repaintBehavior}->onChangeRepaint($self);
}


# throws Exception
sub update {
    my ($self) = @_;
        my $name = $self->getTextFieldItem()->getString();
        $self->{highScoreUtil}->update($name);
        $self->SUPER::update();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paint($graphics);
        $self->{paintable}->paint($graphics);
}


sub saveHighScore {
    my ($self) = @_;
        $self->{highScoreUtil}->saveHighScore();
}


sub submit {
    my ($self) = @_;
        $self->{highScoreUtil}->submit($self);
}

# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::TextField;
use org::allbinary::PostGameCommandFactory;
use org::allbinary::game::GameInfo;
use org::allbinary::game::score::HighScore;
use org::allbinary::game::score::HighScoresHelperBaseInterface;
use org::allbinary::game::score::HighScoresFactoryInterface;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::form::item::CustomTextBox;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::graphics::paint::SimpleTextPaintable;
use org::allbinary::input::event::VirtualKeyboardEventHandler;
use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::logic::system::os::OperatingSystemFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::InApplicationPurchaseFactory;
use org::allbinary::game::score::displayable::HighScoreUtil;

1;

