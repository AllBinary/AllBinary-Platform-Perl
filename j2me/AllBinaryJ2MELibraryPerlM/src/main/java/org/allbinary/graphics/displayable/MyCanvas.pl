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

package org::allbinary::graphics::displayable::MyCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::lcdui::Canvas','org::allbinary::graphics::displayable::DisplayableInterface','org::allbinary::graphics::displayable::command::MyCommandInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{canvasStrings} = 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance();
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{displayInfo} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{name} = undef;
    $self->{childNameList} = undef;
    $self->{commandStack} = undef;
    $self->{commandListener} = $javax::microedition::lcdui::NullCommandListener::NULL_COMMAND_LISTENER;
    $self->{paused} = 0;
    $self->{touchME} = 'org::allbinary::input::TouchJ2ME'->new();
}


sub new {
    my ($class, $name, $childNameList) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{CONSTRUCTOR}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{displayInfo}->update($self, $self->{canvasStrings}->{CONSTRUCTOR});
        $self->{name} = $name;
        $self->{childNameList} = $childNameList;
        $self->{commandStack} = 'org::allbinary::logic::StdUtil'->getInstance()->createStack();
    return $self;
}


sub setFullScreenMode {
    my ($self, $mode) = @_;
        $self->SUPER::setFullScreenMode($mode);
        $self->{displayInfo}->update($self, $self->{canvasStrings}->{SET_FULL_SCREEN_MODE});
}


sub sizeChanged {
    my ($self, $w, $h) = @_;
        $self->{displayInfo}->update($self, $self->{canvasStrings}->{SIZE_CHANGED});
}


sub getCommandStack {
    my ($self) = @_;
        return $self->{commandStack};
}


sub isCommand {
    my ($self, $command) = @_;
        return $self->{commandStack}->contains($command);
}


sub addCommand {
    my ($self, $command) = @_;
        if (!$self->{commandStack}->contains($command)) {
            $self->{commandStack}->push($command);
            $self->SUPER::addCommand($command);
        }
}


sub removeCommand {
    my ($self, $command) = @_;
        $self->{commandStack}->removeElement($command);
        $self->SUPER::removeCommand($command);
}


sub removeAllCommands {
    my ($self) = @_;
        my $size = $self->{commandStack}->size();
        for (my $index = 0; $index < $size; $index++) {
            $self->SUPER::removeCommand($self->{commandStack}->pop());
        }
}


sub setCommandListener {
    my ($self, $l) = @_;
        $self->SUPER::setCommandListener($l);
        $self->{commandListener} = $l;
}


sub getCustomCommandListener {
    my ($self) = @_;
        return $self->{commandListener};
}


sub isPaused {
    my ($self) = @_;
        return $self->{paused};
}


sub removePauseCommand {
    my ($self) = @_;
        $self->removeCommand('org::allbinary::graphics::displayable::command::MyCommandsFactory'->getInstance()->{PAUSE_COMMAND});
}


sub pause {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{canvasStrings}->{PAUSE});
        $self->removePauseCommand();
        $self->addCommand('org::allbinary::graphics::displayable::command::MyCommandsFactory'->getInstance()->{RESUME_COMMAND});
        $self->setPaused(1);
}


sub unPause {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{canvasStrings}->{UN_PAUSE});
        $self->removeCommand('org::allbinary::graphics::displayable::command::MyCommandsFactory'->getInstance()->{RESUME_COMMAND});
        $self->addCommand('org::allbinary::graphics::displayable::command::MyCommandsFactory'->getInstance()->{PAUSE_COMMAND});
        $self->setPaused(0);
}


# throws Exception
sub process {
    my ($self) = @_;
        $self->{displayInfo}->process();
}


sub paint {
    my ($self, $graphics) = @_;
}


sub draw {
    my ($self, $graphics) = @_;
}


sub hasChild {
    my ($self, $displayable) = @_;
        return $self->{childNameList}->contains($displayable->{name});
}


sub destroy {
    my ($self) = @_;
        $self->{logUtil}->putF("Destroyed MyCanvas", $self, "destroy");
}


sub setPaused {
    my ($self, $isPaused) = @_;
        $self->{paused} = $isPaused;
}


sub keyPressedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
}


sub keyRepeatedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
}


sub keyReleasedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
}


sub pointerDragged {
    my ($self, $x, $y) = @_;
        $self->{touchME}->pointerDragged($x, $y);
}


sub pointerPressed {
    my ($self, $x, $y) = @_;
        $self->{touchME}->pointerPressed($x, $y);
}


sub pointerReleased {
    my ($self, $x, $y) = @_;
        $self->{touchME}->pointerReleased($x, $y);
}


sub nextSong {
    my ($self, $nextSongSound, $leftVolume, $rightVolume) = @_;
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::NullCommandListener;
use org::allbinary::graphics::displayable::command::MyCommandInterface;
use org::allbinary::graphics::displayable::command::MyCommandsFactory;
use org::allbinary::input::TouchJ2ME;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::audio::Sound;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABStack;
use org::allbinary::graphics::displayable::DisplayableInterface;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;

1;

