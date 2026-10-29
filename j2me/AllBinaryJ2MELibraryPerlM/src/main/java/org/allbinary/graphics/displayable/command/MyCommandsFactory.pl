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

package org::allbinary::graphics::displayable::command::MyCommandsFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::displayable::command::MyCommandsFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NO_COMMAND} = 'javax::microedition::lcdui::Command'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, -1, -1);
    $self->{GAUGE_CHANGE} = 'javax::microedition::lcdui::Command'->new("GAUGE_CHANGE", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::ITEM, 1);
    $self->{SET_DISPLAYABLE} = 'javax::microedition::lcdui::Command'->new("Display", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 2);
    $self->{PAUSE_COMMAND} = 'javax::microedition::lcdui::Command'->new("Pause", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 0);
    $self->{RESUME_COMMAND} = 'javax::microedition::lcdui::Command'->new("Resume", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 0);
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::displayable::command::MyCommandsFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}

# use javax::microedition::lcdui::Command;
use org::allbinary::logic::string::StringUtil;

1;

