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

package org::allbinary::game::midlet::CreateGameRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{demoGameMidlet} = undef;
    $self->{hashtable} = undef;
    $self->{startGameMidletEvent} = undef;
}


sub new {
    my ($class, $demoGameMidlet, $hashtable) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{demoGameMidlet} = $demoGameMidlet;
        $self->{hashtable} = $hashtable;
        $self->{startGameMidletEvent} = 'org::allbinary::game::midlet::DemoGameMidletEvent'->new($self, 'org::allbinary::game::midlet::DemoGameMidletStateFactory'->getInstance()->{START_GAME});
    return $self;
}


sub run {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START_RUNNABLE}, $self, $self->{commonStrings}->{RUN});
            my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
            $self->{demoGameMidlet}->commandAction('org::allbinary::graphics::displayable::command::MyCommandsFactory'->getInstance()->{SET_DISPLAYABLE}, $progressCanvas);
            $self->{demoGameMidlet}->stopGameCanvasRunnableInterface();
            $self->{demoGameMidlet}->setGameCanvasRunnableInterface($self->{demoGameMidlet}->createGameCanvasRunnableInterface());
            $self->{demoGameMidlet}->getGameCanvasRunnableInterface()->setLoadStateHashtable($self->{hashtable});
            $self->{demoGameMidlet}->startGameCanvasRunnableInterface();
            'org::allbinary::game::midlet::DemoGameMidletEventHandler'->getInstance()->fireEvent($self->{startGameMidletEvent});
            $self->{logUtil}->putF($self->{commonStrings}->{END_RUNNABLE}, $self, $self->{commonStrings}->{RUN});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
        }
}

use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::graphics::displayable::command::MyCommandsFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::midlet::DemoGameMidletEvent;
use org::allbinary::game::midlet::DemoGameMidletStateFactory;
use org::allbinary::game::midlet::DemoGameMidletEventHandler;

1;

