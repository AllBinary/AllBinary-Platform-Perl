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

package org::allbinary::game::configuration::GameDifficultyOptions;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::displayable::screen::CommandForm';


sub _init_fields {
    my ($self) = @_;
    $self->{meUtil} = 'org::allbinary::logic::MEUtil'->getInstance();
    $self->{list} = undef;
}


sub new {
    my ($class, $commandListener, $title, $list, $backgrounBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($commandListener, $title, $backgrounBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{list} = $list;
        $self->update();
        $self->initCommands($commandListener);
        my $gameDifficultyFactory = 'org::allbinary::game::configuration::persistance::GameDifficultyFactory'->getInstance();
        $self->setSelectedId($gameDifficultyFactory->getLevel());
    return $self;
}


sub open {
    my ($self) = @_;
        $self->SUPER::open();
}


# throws Exception
sub close {
    my ($self) = @_;
        $self->SUPER::close();
        $self->save();
}


# throws Exception
sub save {
    my ($self) = @_;
        my $gameDifficultyFactory = 'org::allbinary::game::configuration::persistance::GameDifficultyFactory'->getInstance();
        $gameDifficultyFactory->setLevel($self->getSelectedId());
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        my $gameCommandsFactory = 'org::allbinary::game::commands::GameCommandsFactory'->getInstance();
        $self->removeAllCommands();
        $self->addCommand($gameCommandsFactory->{CLOSE_AND_SHOW_GAME_CANVAS});
        $self->setCommandListener($cmdListener);
}


# throws Exception
sub update {
    my ($self) = @_;
        $self->deleteAll();
        $self->add($self->{list}, "Difficulty", $javax::microedition::lcdui::Choice::EXCLUSIVE);
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
        my $METHOD_NAME = "addChoiceGroup";
        my $NAME = "Adding Choice: ";
        my $choiceGroup = 'javax::microedition::lcdui::ChoiceGroup'->new($name, $option, 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance(), $javax::microedition::lcdui::NullImage::NULL_IMAGE_ARRAY);
        my $size = $list->size();
        my $anyType = undef;
        for (my $index = 0; $index < $size; $index++) {
            $anyType = $list->{objectArray}->[$index];
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($NAME)->append($anyType->toString())->toString(), $self, $METHOD_NAME);
            $choiceGroup->append($anyType->toString(), $javax::microedition::lcdui::NullImage::NULL_IMAGE);
        }
        return $choiceGroup;
}


sub setSelectedId {
    my ($self, $id) = @_;
        my $choiceGroup = $self->get(0);
        $choiceGroup->setSelectedIndex($id, 1);
}


sub getSelectedId {
    my ($self) = @_;
        my $choiceGroup = $self->get(0);
        return $choiceGroup->getSelectedIndex();
}


sub getSelectedText {
    my ($self) = @_;
        my $choiceGroup = $self->get(0);
        my $value = int(("" . ($choiceGroup->getString($choiceGroup->getSelectedIndex()))));
        return $value;
}

# use javax::microedition::lcdui::Choice;
# use javax::microedition::lcdui::ChoiceGroup;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::configuration::persistance::GameDifficultyFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::screen::CommandForm;
use org::allbinary::logic::MEUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;

1;

