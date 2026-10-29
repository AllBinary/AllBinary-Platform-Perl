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

package org::allbinary::game::displayable::canvas::CommandRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{commandFormInputProcessor} = undef;
    $self->{command} = undef;
}


sub new {
    my ($class, $commandFormInputProcessor, $command) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{commandFormInputProcessor} = $commandFormInputProcessor;
        $self->{command} = $command;
    return $self;
}


sub run {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START_RUNNABLE}, $self, $self->{commonStrings}->{RUN});
            my $canvas = $self->{commandFormInputProcessor}->getCanvas();
            my $commandListener = $canvas->getCustomCommandListener();
            $commandListener->commandAction($self->{command}, $canvas);
            $self->{logUtil}->putF($self->{commonStrings}->{END_RUNNABLE}, $self, $self->{commonStrings}->{RUN});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
        }
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

