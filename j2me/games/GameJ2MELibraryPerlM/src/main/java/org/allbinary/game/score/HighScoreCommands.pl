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

package org::allbinary::game::score::HighScoreCommands;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::score::HighScoreCommands'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{DISPLAY} = 'javax::microedition::lcdui::Command'->new("Scores", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{PERSONAL} = 'javax::microedition::lcdui::Command'->new("Personal", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
    $self->{WORLD} = 'javax::microedition::lcdui::Command'->new("World", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::score::HighScoreCommands::instance;
}

# use javax::microedition::lcdui::Command;
use org::allbinary::logic::string::StringUtil;

1;

