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

package org::allbinary::game::displayable::canvas::GameInputMappingCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::GameCommandCanvas','org::allbinary::game::input::mapping::InputMappingInterface';

our $NAME = "GameInputMappingCanvas";
our $DISPLAY = 'javax::microedition::lcdui::Command'->new("Controls", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 2);
our $DEFAULT = 'javax::microedition::lcdui::Command'->new("Default", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 2);

sub _init_fields {
    my ($self) = @_;
    $self->{paintable} = undef;
    $self->{helpPaintable} = undef;
    $self->{colorFillPaintable} = undef;
    $self->{inputMapping} = undef;
    $self->{NONE} = 'org::allbinary::game::input::GameKeyFactory'->getInstance()->{NONE};
    $self->{abeClientInformation} = undef;
    $self->{selectedGameKey} = $self->{NONE};
    $self->{selectedInput} = $self->{NONE};
    $self->{inputFactory} = 'org::allbinary::game::input::InputFactory'->getInstance();
}


sub new {
    my ($class, $abeClientInformation, $commandListener, $allBinaryGameLayerManager, $helpPaintable) = @_;
    my $self = $class->SUPER::new($commandListener, $org::allbinary::game::displayable::canvas::GameInputMappingCanvas::NAME, $allBinaryGameLayerManager->getBackgroundBasicColor(), $allBinaryGameLayerManager->getForegroundBasicColor());
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        if (!defined($helpPaintable)) {
            die ("Help Paintable Exception");
        }
        $self->{abeClientInformation} = $abeClientInformation;
        $self->{helpPaintable} = $helpPaintable;
        $self->{inputMapping} = 'org::allbinary::game::input::PlatformInputMappingFactory'->getInstance()->getPersistentInputMappingInstance();
        $self->{paintable} = 'org::allbinary::graphics::paint::ProcessPaintable'->new();
        $self->{colorFillPaintable} = 'org::allbinary::game::paint::ColorFillPaintableFactory'->getInstance()->getInstance($allBinaryGameLayerManager->getBackgroundBasicColor(), 0);
    return $self;
}


# throws Exception
sub close {
    my ($self) = @_;
        $self->SUPER::close();
        $self->{paintable}->process();
        $self->{selectedGameKey} = $self->{NONE};
        $self->{selectedInput} = $self->{NONE};
        $self->update();
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        $self->removeAllCommands();
        $self->addCommand('org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{CLOSE_AND_SHOW_GAME_CANVAS});
        $self->addCommand($org::allbinary::game::displayable::canvas::GameInputMappingCanvas::DEFAULT);
        $self->addCommand($org::allbinary::game::displayable::canvas::GameInputMappingInstructionsCanvas::DISPLAY);
        $self->setCommandListener($cmdListener);
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
        $self->addGameKey($keyCode, 0);
        $self->SUPER::keyPressedByDevice($keyCode, 0);
}


sub addGameKey {
    my ($self, $keyCode, $repeated) = @_;
        try {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Raw Device Key Code: ")->append(sprintf("%x", $keyCode))->toString(), $self, $self->{gameInputStrings}->{ADD_KEY_EVENT});
            my $gameKey = $self->{inputToGameKeyMapping}->getInstanceForCanvas($self, $keyCode);
            my $input = $self->{inputFactory}->getInstanceById($keyCode);
            $self->processInputMapping($gameKey, $input);
        } catch ($e) {
            $self->{logUtil}->put("Key Event Error", $self, $self->{gameInputStrings}->{ADD_KEY_EVENT}, $e);
        }
}


# throws Exception
sub processInputMapping {
    my ($self, $gameKey, $input) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Start Passed GameKey: ");
        $stringBuffer->append($self->{stringUtil}->toString($gameKey));
        $stringBuffer->append(" Input: ");
        $stringBuffer->append($self->{stringUtil}->toString($input));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{PROCESS});
        if ($self->{selectedGameKey} != $self->{NONE}) {
            $self->gameActionCrud($gameKey, $input);
        } else {
            $self->setSelectedAction($gameKey);
        }
}


sub setSelectedAction {
    my ($self, $gameKey) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Selected GameKey: ")->append($self->{stringUtil}->toString($gameKey))->toString(), $self, "setSelectedAction");
        $self->{selectedGameKey} = $gameKey;
        $self->{selectedInput} = $self->{NONE};
        $self->{helpPaintable}->update($self->{selectedGameKey}, $self->{selectedInput});
        $self->{repaintBehavior}->onChangeRepaint($self);
}


# throws Exception
sub gameActionCrud {
    my ($self, $gameKey, $input) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Start GameKey: ");
        $stringBuffer->append($self->{stringUtil}->toString($self->{selectedGameKey}));
        $stringBuffer->append(" Input: ");
        $stringBuffer->append($self->{stringUtil}->toString($self->{selectedInput}));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "gameActionCrud");
        if ($self->{selectedInput} == $self->{NONE}) {
            my $list = $self->{inputMapping}->getInputMapping()->getMappedInput($self->{selectedGameKey});
            my $isInputAlreadyMappedToSelectedAction = $list->contains($input);
            if ($isInputAlreadyMappedToSelectedAction) {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Already Mapped Input: ")->append($self->{stringUtil}->toString($input))->toString(), $self, "gameActionCrud");
                $self->{selectedInput} = $input;
                $self->{helpPaintable}->update($self->{selectedGameKey}, $self->{selectedInput});
                $self->{repaintBehavior}->onChangeRepaint($self);
            } else {
                $self->addNewMapping($gameKey, $input);
            }
        } elsif ($self->{inputMapping}->isDelete($input)) {
            $self->deleteCurrentMapping();
        } else {
            $self->setSelectedAction($gameKey);
        }
}


# throws Exception
sub addNewMapping {
    my ($self, $gameKey, $input) = @_;
        my $METHOD_NAME = "addNewMapping";
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $METHOD_NAME);
        my $isInputAlreadyMapped = $self->{inputMapping}->getInputMapping()->isMapped($input);
        if (!$isInputAlreadyMapped && !$self->{inputMapping}->isSystemInput($input)) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Add Key Mapping : GameKey: ");
            $stringBuffer->append($self->{stringUtil}->toString($self->{selectedGameKey}));
            $stringBuffer->append(" Input: ");
            $stringBuffer->append($self->{stringUtil}->toString($self->{selectedInput}));
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $METHOD_NAME);
            $self->{inputMapping}->getInputMapping()->add($self->{selectedGameKey}, $input);
            $self->{selectedInput} = $input;
            $self->update();
        } else {
            $self->{logUtil}->putF("Unable to add Mapping since one already exists or is MENU, HOME, or BACK key and setting selected action to what it is already mapped to", $self, $METHOD_NAME);
            $self->setSelectedAction($gameKey);
        }
}


# throws Exception
sub deleteCurrentMapping {
    my ($self) = @_;
        my $METHOD_NAME = "deleteCurrentMapping";
        my $list = $self->{inputMapping}->getInputMapping()->getMappedInput($self->{selectedGameKey});
        if ($list->size() > 1) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Start GameKey: ");
            $stringBuffer->append("Remove Key Mapping: GameKey: ");
            $stringBuffer->append($self->{stringUtil}->toString($self->{selectedGameKey}));
            $stringBuffer->append(" Input: ");
            $stringBuffer->append($self->{stringUtil}->toString($self->{selectedInput}));
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $METHOD_NAME);
            $self->{inputMapping}->getInputMapping()->remove($self->{selectedGameKey}, $self->{selectedInput});
            $self->{selectedInput} = $self->{NONE};
            $self->update();
        } else {
            $self->{logUtil}->putF("Can't Remove Last Key Mapping", $self, $METHOD_NAME);
        }
}


# throws Exception
sub setDefault {
    my ($self) = @_;
        $self->{inputMapping}->setDefault($self->{abeClientInformation});
        $self->{helpPaintable}->update($self->{NONE}, $self->{NONE});
        $self->{repaintBehavior}->onChangeRepaint($self);
}


# throws Exception
sub update {
    my ($self) = @_;
        $self->{inputMapping}->update($self->{abeClientInformation});
        $self->{helpPaintable}->update($self->{selectedGameKey}, $self->{selectedInput});
        $self->{repaintBehavior}->onChangeRepaint($self);
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{colorFillPaintable}->paint($graphics);
        $self->{helpPaintable}->paint($graphics);
        $self->{paintable}->paint($graphics);
        $self->SUPER::paint($graphics);
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::input::GameKey;
use org::allbinary::game::input::GameKeyFactory;
use org::allbinary::game::input::Input;
use org::allbinary::game::input::InputFactory;
use org::allbinary::game::input::PlatformInputMappingFactory;
use org::allbinary::game::input::mapping::InputMappingInterface;
use org::allbinary::game::input::mapping::PersistentInputMapping;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::paint::ColorFillBasePaintable;
use org::allbinary::game::paint::ColorFillPaintableFactory;
use org::allbinary::game::paint::help::HelpPaintable;
use org::allbinary::game::paint::help::InputMappingHelpPaintable;
use org::allbinary::graphics::paint::ProcessPaintable;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::displayable::canvas::GameCommandCanvas;
use org::allbinary::game::displayable::canvas::GameInputMappingInstructionsCanvas;

1;

