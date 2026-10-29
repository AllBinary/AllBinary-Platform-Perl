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

package org::allbinary::game::configuration::SaveGameForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::graphics::displayable::screen::CommandForm';

our $FORM = 'org::allbinary::graphics::displayable::screen::CommandForm'->getNullCommandForm();

sub _init_fields {
    my ($self) = @_;
    $self->{meUtil} = 'org::allbinary::logic::MEUtil'->getInstance();
}


# throws Exception
sub createForm {
    my ($class, $commandListener, $title, $backgrounBasicColor, $foregroundBasicColor) = @_;
        $org::allbinary::game::configuration::SaveGameForm::FORM = 'org::allbinary::game::configuration::SaveGameForm'->new($commandListener, $title, $backgrounBasicColor, $foregroundBasicColor);
        return $org::allbinary::game::configuration::SaveGameForm::FORM;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::SaveGameForm::FORM;
}


sub new {
    my ($class, $commandListener, $title, $backgrounBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($commandListener, $title, $backgrounBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        my $timeString = ("" . ('org::allbinary::logic::ABSystemWrapper'->getInstance()->currentTimeMillis()));
        $self->{meUtil}->appendItem($self, 'javax::microedition::lcdui::TextField'->new("Name: ", $timeString, 30, $javax::microedition::lcdui::TextField::ANY));
        $self->initCommands($commandListener);
    return $self;
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        my $gameCommandsFactory = 'org::allbinary::game::commands::GameCommandsFactory'->getInstance();
        $self->removeAllCommands();
        $self->addCommand($gameCommandsFactory->{SAVE});
        $self->addCommand($gameCommandsFactory->{CLOSE_AND_SHOW_GAME_CANVAS});
        $self->setCommandListener($cmdListener);
}

# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::TextField;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::screen::CommandForm;
use org::allbinary::logic::ABSystemWrapper;
use org::allbinary::logic::MEUtil;

1;

