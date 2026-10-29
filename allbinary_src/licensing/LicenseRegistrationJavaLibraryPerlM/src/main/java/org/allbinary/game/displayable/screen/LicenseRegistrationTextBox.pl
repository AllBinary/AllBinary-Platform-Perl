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

package org::allbinary::game::displayable::screen::LicenseRegistrationTextBox;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::CustomTextBox';

our $DISPLAY_COMMAND = 'javax::microedition::lcdui::Command'->new("Register", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 3);
our $SUBMIT_COMMAND = 'javax::microedition::lcdui::Command'->new("Submit", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 3);

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{pleaseWaitPaintable} = 'org::allbinary::graphics::paint::SimpleTextPaintable'->new($self->{commonStrings}->{PLEASE_WAIT}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
    $self->{paintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
}


sub new {
    my ($class, $cmdListener, $backgrounBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($cmdListener, "Enter Registration Code:", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 60, $javax::microedition::lcdui::TextField::ANY, 'javax::microedition::lcdui::Font'->getDefaultFont(), $backgrounBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        $self->removeAllCommands();
        $self->addCommand('org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{CLOSE_AND_SHOW_GAME_CANVAS});
        $self->addCommand('org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{TOGGLE_KEYBOARD});
        $self->addCommand($SUBMIT_COMMAND);
        $self->setCommandListener($cmdListener);
}


sub open {
    my ($self) = @_;
        try {
            my $virtualKeyboardEventHandler = 'org::allbinary::input::event::VirtualKeyboardEventHandler'->getInstance();
            $virtualKeyboardEventHandler->fireEvent($virtualKeyboardEventHandler->{SHOW_EVENT});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "open", $e);
        }
        $self->SUPER::open();
        $self->{paintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
        $self->repaint();
}


# throws Exception
sub close {
    my ($self) = @_;
        try {
            my $virtualKeyboardEventHandler = 'org::allbinary::input::event::VirtualKeyboardEventHandler'->getInstance();
            $virtualKeyboardEventHandler->fireEvent($virtualKeyboardEventHandler->{HIDE_EVENT});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "open", $e);
        }
        $self->{paintable} = $self->{pleaseWaitPaintable};
        $self->repaint();
        $self->SUPER::close();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paint($graphics);
        $self->{paintable}->paint($graphics);
}


sub submit {
    my ($self) = @_;
        my $commandListener = $self->getCustomCommandListener();
        $commandListener->commandAction($SUBMIT_COMMAND, $self);
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::TextField;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::form::item::CustomTextBox;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::graphics::paint::SimpleTextPaintable;
use org::allbinary::input::event::VirtualKeyboardEventHandler;

1;

