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

package org::allbinary::game::commands::GameCommandsFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{TOGGLE_FULLSCREEN} = 'javax::microedition::lcdui::Command'->new("Toggle FullScreen", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{TOGGLE_KEYBOARD} = 'javax::microedition::lcdui::Command'->new("Keyboard", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{SET_MENU_DISPLAYABLE} = 'javax::microedition::lcdui::Command'->new("Set Menu Displayable", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{APPLICATION_UPDATE} = 'javax::microedition::lcdui::Command'->new('org::allbinary::string::CommonStrings'->getInstance()->{UPDATE}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{DISPLAY_ABOUT} = 'javax::microedition::lcdui::Command'->new('org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{ABOUT}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 2);
    $self->{OPEN_WEB_URL} = 'javax::microedition::lcdui::Command'->new("Open Web URL", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 2);
    $self->{CLOSE_OPTIONS} = 'javax::microedition::lcdui::Command'->new("Back", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{DISPLAY_OPTIONS} = 'javax::microedition::lcdui::Command'->new('org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{OPTIONS}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 2);
    $self->{START_TRACE} = 'javax::microedition::lcdui::Command'->new("Start Trace", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{STOP_TRACE} = 'javax::microedition::lcdui::Command'->new("Stop Trace", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{DEFAULT_OPTIONS} = 'javax::microedition::lcdui::Command'->new("Default", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{SHOW_GAME_CANVAS} = 'javax::microedition::lcdui::Command'->new("Back to Game", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{CLOSE_AND_SHOW_GAME_CANVAS} = 'javax::microedition::lcdui::Command'->new("Back", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{QUIT_COMMAND} = 'javax::microedition::lcdui::Command'->new("Quit", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::STOP, 1);
    $self->{RESTART_COMMAND} = 'javax::microedition::lcdui::Command'->new("Restart", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 0);
    $self->{DISPLAY_SAVE_FORM} = 'javax::microedition::lcdui::Command'->new("Save To", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 3);
    $self->{SAVE} = 'javax::microedition::lcdui::Command'->new("Save", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 3);
    $self->{DISPLAY_LOAD_FORM} = 'javax::microedition::lcdui::Command'->new("Load", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 3);
    $self->{LOAD_FILE} = 'javax::microedition::lcdui::Command'->new("Load File", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 3);
    $self->{DELETE_FILE} = 'javax::microedition::lcdui::Command'->new("Delete File", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{EXIT_COMMAND} = 'javax::microedition::lcdui::Command'->new("Exit", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::EXIT, 2);
    $self->{EXIT_WITHOUT_PROGRESS_COMMAND} = 'javax::microedition::lcdui::Command'->new("Exit Without Progress", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::EXIT, 2);
    $self->{START_COMMAND} = 'javax::microedition::lcdui::Command'->new('org::allbinary::string::CommonStrings'->getInstance()->{START}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{CONTINUE_COMMAND} = 'javax::microedition::lcdui::Command'->new("Continue", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{SELECT_COMMAND} = 'javax::microedition::lcdui::Command'->new("Select", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{FEATURE_UPDATE} = 'javax::microedition::lcdui::Command'->new("Feature Update", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{BUY_COMMAND} = 'javax::microedition::lcdui::Command'->new("BUY", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::commands::GameCommandsFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::commands::GameCommandsFactory::instance = 'org::allbinary::game::commands::GameCommandsFactory'->new();
        }
        return $org::allbinary::game::commands::GameCommandsFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}

# use javax::microedition::lcdui::Command;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;

1;

