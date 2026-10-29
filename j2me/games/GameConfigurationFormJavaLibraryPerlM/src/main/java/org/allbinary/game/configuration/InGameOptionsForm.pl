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

package org::allbinary::game::configuration::InGameOptionsForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::displayable::screen::CommandForm';

our $DISPLAY = 'javax::microedition::lcdui::Command'->new("Options In Game", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
our $SAVE = 'javax::microedition::lcdui::Command'->new("Save", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
our $DEFAULT = 'javax::microedition::lcdui::Command'->new("Default", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);


sub new {
    my ($class, $commandListener, $title, $backgrounBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($commandListener, $title, $backgrounBasicColor, $foregroundBasicColor);
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        my $gameFeatureFormUtil = 'org::allbinary::game::configuration::feature::GameFeatureFormUtil'->getInstance();
        $gameFeatureFormUtil->addChoiceGroup($self, 'org::allbinary::game::configuration::feature::InGameFeatureChoiceGroups'->getExclusiveInstance()->get(), $javax::microedition::lcdui::Choice::EXCLUSIVE);
        $gameFeatureFormUtil->addChoiceGroup($self, 'org::allbinary::game::configuration::feature::InGameFeatureChoiceGroups'->getMultipleInstance()->get(), $javax::microedition::lcdui::Choice::MULTIPLE);
        $self->initCommands($commandListener);
    return $self;
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        $self->removeAllCommands();
        $self->addCommand('org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{CLOSE_AND_SHOW_GAME_CANVAS});
        $self->addCommand($org::allbinary::game::configuration::InGameOptionsForm::DEFAULT);
        $self->setCommandListener($cmdListener);
}

# use javax::microedition::lcdui::Choice;
# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::configuration::feature::GameFeatureFormUtil;
use org::allbinary::game::configuration::feature::InGameFeatureChoiceGroups;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::screen::CommandForm;
use org::allbinary::logic::string::StringUtil;

1;

