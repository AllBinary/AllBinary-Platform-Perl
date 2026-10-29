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

package org::allbinary::game::displayable::canvas::GameInputMappingInstructionsCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::game::displayable::canvas::GameCommandCanvas';

our $DISPLAY = 'javax::microedition::lcdui::Command'->new("Help", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
our $CLOSE = 'javax::microedition::lcdui::Command'->new("Close", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $javax::microedition::lcdui::Command::SCREEN, 1);
our $NAME = "GameInputMappingInstructionsCanvas";

sub _init_fields {
    my ($self) = @_;
    $self->{drawStringUtil} = 'org::allbinary::graphics::draw::DrawStringUtil'->getInstance();
    $self->{TITLE} = "Input Instructions";
    $self->{instructions} = ["Add Input Mapping:", "1. Select the desired action by generating a currently defined input for a given action.", "(Example: Press the '1' key to select the Fire action)", "2. Make the newly desired input for the selected action.", "(Example: Press 'f' to add it to the selected action)", "Note: If the input is already mapped to another action then it will not be added. You", "will need to deleted from the other action before adding it to another.", "Warning: Not all keys map for a given platform and show as Unknown.", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, "Remove Input Mapping:", "1. Select the desired action by generating a currently defined input for a given action.", "(Example: Press the key '1' to select the Fire action)", "2. Select a mapped input for the selected action.", "(Example: Press the key '1' to select the '1' key input for the selected Fire action)", "3. Press the Delete Key."];
    $self->{colorFillPaintable} = undef;
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
}


sub new {
    my ($class, $commandListener, $allBinaryGameLayerManager) = @_;
    my $self = $class->SUPER::new($commandListener, $org::allbinary::game::displayable::canvas::GameInputMappingInstructionsCanvas::NAME, $allBinaryGameLayerManager->getBackgroundBasicColor(), $allBinaryGameLayerManager->getForegroundBasicColor());
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{colorFillPaintable} = 'org::allbinary::game::paint::ColorFillPaintableFactory'->getInstance()->getInstance($allBinaryGameLayerManager->getBackgroundBasicColor(), 0);
    return $self;
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        $self->removeAllCommands();
        $self->addCommand($org::allbinary::game::displayable::canvas::GameInputMappingInstructionsCanvas::CLOSE);
        $self->setCommandListener($cmdListener);
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->{colorFillPaintable}->paint($graphics);
        my $halfWidth = $self->{displayInfo}->getLastHalfWidth();
        my $beginWidth = (POSIX::floor(($graphics->getFont()->stringWidth($self->{TITLE})) / (2 ** (1))));
        $graphics->setColor($self->{foregroundColor});
        $graphics->drawString($self->{TITLE}, $halfWidth - $beginWidth, $self->{fontHeight}, $self->{anchor});
        $self->{drawStringUtil}->drawCenterStrings($graphics, $self->{instructions}, $self->{displayInfo}->getLastWidth(), $self->{fontHeight}, $halfWidth, 3 * $self->{fontHeight});
        $self->SUPER::paint($graphics);
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::paint::ColorFillBasePaintable;
use org::allbinary::game::paint::ColorFillPaintableFactory;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::draw::DrawStringUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::game::displayable::canvas::GameCommandCanvas;

1;

