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

package org::allbinary::game::configuration::LoadGameForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::displayable::screen::CommandForm';


sub _init_fields {
    my ($self) = @_;
    $self->{meUtil} = 'org::allbinary::logic::MEUtil'->getInstance();
    $self->{areChoices} = 0;
}


sub new {
    my ($class, $commandListener, $title, $backgrounBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($commandListener, $title, $backgrounBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->update();
        $self->initCommands($commandListener);
    return $self;
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        my $gameCommandsFactory = 'org::allbinary::game::commands::GameCommandsFactory'->getInstance();
        $self->removeAllCommands();
        $self->addCommand($gameCommandsFactory->{LOAD_FILE});
        $self->addCommand($gameCommandsFactory->{DELETE_FILE});
        $self->addCommand($gameCommandsFactory->{CLOSE_AND_SHOW_GAME_CANVAS});
        $self->setCommandListener($cmdListener);
}


# throws Exception
sub update {
    my ($self) = @_;
        my $list = 'org::allbinary::game::configuration::persistance::GamePersistanceSingleton'->getInstance()->getIds();
        $self->deleteAll();
        if ($list->size() > 0) {
            $self->add($list, "Select A Saved Game", $javax::microedition::lcdui::Choice::EXCLUSIVE);
            $self->{areChoices} = 1;
        } else {
            $self->{meUtil}->appendItem($self, 'javax::microedition::lcdui::StringItem'->new("No Saved Games", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Item::PLAIN));
            $self->{areChoices} = 0;
        }
        $self->SUPER::update();
}


sub add {
    my ($self, $list, $name, $option) = @_;
        my $choiceGroup = $self->getChoiceGroup($list, $name, $option);
        if ($list->size() > 0) {
            $choiceGroup->setSelectedIndex(0, 1);
        }
        $self->{meUtil}->appendItem($self, $choiceGroup);
}


sub getChoiceGroup {
    my ($self, $list, $name, $option) = @_;
        my $METHOD_NAME = "getChoiceGroup";
        my $ADDING_CHOICE = "Adding Choice: ";
        my $choiceGroup = 'javax::microedition::lcdui::ChoiceGroup'->new($name, $option, 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance(), $javax::microedition::lcdui::NullImage::NULL_IMAGE_ARRAY);
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            my $anyType = $list->{objectArray}->[$index];
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($ADDING_CHOICE)->append($anyType->toString())->toString(), $self, $METHOD_NAME);
            $choiceGroup->append($anyType->toString(), $javax::microedition::lcdui::NullImage::NULL_IMAGE);
        }
        return $choiceGroup;
}


sub getSelectedId {
    my ($self) = @_;
        if ($self->{areChoices}) {
            my $choiceGroup = $self->get(0);
            return $choiceGroup->getSelectedIndex();
        } else {
            return -1;
        }
}


sub getSelectedText {
    my ($self) = @_;
        if ($self->{areChoices}) {
            my $choiceGroup = $self->get(0);
            my $value = int(("" . ($choiceGroup->getString($choiceGroup->getSelectedIndex()))));
            return $value;
        } else {
            return -1;
        }
}

# use javax::microedition::lcdui::Choice;
# use javax::microedition::lcdui::ChoiceGroup;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Item;
# use javax::microedition::lcdui::NullImage;
# use javax::microedition::lcdui::StringItem;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::configuration::persistance::GamePersistanceSingleton;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::screen::CommandForm;
use org::allbinary::logic::MEUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;

1;

