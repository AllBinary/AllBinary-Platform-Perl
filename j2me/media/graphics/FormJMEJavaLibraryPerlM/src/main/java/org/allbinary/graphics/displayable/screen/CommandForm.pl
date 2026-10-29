# 
# AllBinary Open License Version 1 
# Copyright (c) 2002 AllBinary 
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

package org::allbinary::graphics::displayable::screen::CommandForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::lcdui::Form','org::allbinary::graphics::displayable::command::MyCommandInterface','org::allbinary::game::displayable::canvas::MenuListener';

our $NULL_COMMAND_FORM = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{repaintProcessor} = 'org::allbinary::graphics::displayable::screen::ScreenRepaintProcessorFactory'->getInstance()->create($self);
    $self->{commandStack} = undef;
}


sub getNullCommandForm {
    my ($class) = @_;
        if ($org::allbinary::graphics::displayable::screen::CommandForm::NULL_COMMAND_FORM == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::graphics::displayable::screen::CommandForm::NULL_COMMAND_FORM = 'org::allbinary::graphics::displayable::screen::CommandForm'->new($javax::microedition::lcdui::NullCommandListener::NULL_COMMAND_LISTENER, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
        }
        return $org::allbinary::graphics::displayable::screen::CommandForm::NULL_COMMAND_FORM;
}


sub new {
    my ($class, $commandListener, $formTitle, $backgrounBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($formTitle);
    $self->_init_fields();
        # super(...) made $self above
        $self->{commandStack} = 'org::allbinary::logic::StdUtil'->getInstance()->createStack();
        try {
            $self->{repaintProcessor}->process();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
        }
    return $self;
}


sub initCommands {
    my ($self, $cmdListener) = @_;
}


sub open {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "open");
}


# throws Exception
sub close {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CLOSE});
}


# throws Exception
sub update {
    my ($self) = @_;
        $self->{repaintProcessor}->process();
}


sub getSourceId {
    my ($self) = @_;
        return 0;
}


sub addCommand {
    my ($self, $command) = @_;
        $self->{commandStack}->push($command);
        $self->SUPER::addCommand($command);
}


sub removeAllCommands {
    my ($self) = @_;
        my $size = $self->{commandStack}->size();
        for (my $index = 0; $index < $size; $index++) {
            $self->SUPER::removeCommand($self->{commandStack}->pop());
        }
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Form;
# use javax::microedition::lcdui::NullCommandListener;
use org::allbinary::canvas::Processor;
use org::allbinary::game::displayable::canvas::MenuListener;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::command::MyCommandInterface;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABStack;
use org::allbinary::graphics::displayable::screen::ScreenRepaintProcessorFactory;

1;

