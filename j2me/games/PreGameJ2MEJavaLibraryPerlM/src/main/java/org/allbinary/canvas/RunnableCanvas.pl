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

package org::allbinary::canvas::RunnableCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::graphics::displayable::MyCanvas','org::allbinary::thread::RunnableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{nullUtil} = 'org::allbinary::logic::NullUtil'->getInstance();
    $self->{stdUtil} = 'org::allbinary::logic::StdUtil'->getInstance();
    $self->{systemWrapper} = 'org::allbinary::logic::ABSystemWrapper'->getInstance();
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
    $self->{thread} = $org::allbinary::thread::NullThread::NULL_THREAD;
    $self->{currentThread} = $org::allbinary::thread::NullThread::NULL_THREAD;
    $self->{running} = 0;
    $self->{loopTimeHelper} = 'org::allbinary::time::TimeDelayHelper'->new('org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance()->{WAIT});
    $self->{runnableCanvasRefreshHelper} = 'org::allbinary::canvas::Processor'->getInstance();
    $self->{commonLabels} = 'org::allbinary::string::CommonLabels'->getInstance();
    $self->{threadObjectUtil} = 'org::allbinary::thread::ThreadObjectUtil'->getInstance();
    $self->{SET_RUNNING} = "setRunning";
    $self->{IS_RUNNING} = "isRunning";
    $self->{THREAD} = "Thread: ";
    $self->{NOT_EQUAL} = " != ";
    $self->{PAUSE_SLEEP} = "pause sleep";
    $self->{START_PAUSE} = "start pause - game thread sleep at: ";
    $self->{END_PAUSE} = "end pause - game thread sleep at: ";
    $self->{PROCESS_LOOP_SLEEP} = "processLoopSleep";
    $self->{pauseWait} = 0;
    $self->{notified} = 0;
}


sub new {
    my ($class, $commandListener, $childNameList, $hasParam) = @_;
    my $self = $class->SUPER::new('org::allbinary::string::CommonStrings'->getInstance()->{UNKNOWN}, $childNameList);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("RunnableCanvas delay: ")->appendint(int($self->{loopTimeHelper}->{delay}))->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{runnableCanvasRefreshHelper} = 'org::allbinary::canvas::RunnableCanvasRefreshHelper'->new($self);
        if (defined($commandListener)) {
            $self->initCommands($commandListener);
        } elsif ($hasParam) {
            $self->{logUtil}->putF("commandListener was null", $self, "initCommands");
        }
    return $self;
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{NOT_IMPLEMENTED}, $self, "initCommands");
}


sub isMainCanvas {
    my ($self) = @_;
        if (defined($self->getCustomCommandListener())) {
            return 1;
        } else {
            return 0;
        }
}


sub setThread {
    my ($self, $thread) = @_;
        $self->{thread} = $thread;
}


sub setRunning {
    my ($self, $running) = @_;
        $self->{running} = $running;
        if (!$self->{running}) {
            $self->{thread} = $org::allbinary::thread::NullThread::NULL_THREAD;
            { # synchronized ($self)
                $self->{threadObjectUtil}->notifyObject($self);
            }
        }
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{IS_RUNNING})->appendboolean($self->{running})->toString(), $self, $self->{SET_RUNNING});
}


sub isRunning {
    my ($self) = @_;
        if ($self->{thread} == $self->{currentThread}) {
            return $self->{running};
        } else {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{THREAD});
            if (defined($self->{thread})) {
                $stringBuffer->append($self->{thread}->toString());
            }
            $stringBuffer->append($self->{NOT_EQUAL});
            if (defined($self->{currentThread})) {
                $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->{currentThread}));
            }
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{IS_RUNNING});
            return 0;
        }
}


sub getLoopTimeHelperP {
    my ($self) = @_;
        return $self->{loopTimeHelper};
}


sub setWait {
    my ($self, $wait) = @_;
        $self->{loopTimeHelper}->{delay} = $wait;
        $self->{pauseWait} = $wait * 3;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("setWait - delay: ")->appendint(int($self->{loopTimeHelper}->{delay}))->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
}


sub getWait {
    my ($self) = @_;
        return $self->{loopTimeHelper}->{delay};
}


sub setCurrentThread {
    my ($self) = @_;
        $self->{currentThread} = 'java::lang::Thread'->currentThread();
}


sub setCurrentThreadFake {
    my ($self) = @_;
        $self->{currentThread} = $self->{thread};
}


sub showNotify {
    my ($self) = @_;
        try {
            $self->stopWaiting();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "showNotify", $e);
        }
}


# throws Exception
sub stopWaiting {
    my ($self) = @_;
        $self->{notified} = 1;
        { # synchronized ($self)
            $self->{threadObjectUtil}->notifyObject($self);
        }
        $self->repaint();
}


# throws Exception
sub waitOnNotify {
    my ($self, $wait) = @_;
        if (!$self->{notified}) {
            if ($wait > 0) {
                $self->{threadObjectUtil}->waitObjectFor($self, $wait);
            } else {
                $self->{threadObjectUtil}->waitObject($self);
            }
        }
}


# throws Exception
sub processSleep {
    my ($self) = @_;
        Time::HiRes::sleep(($self->{pauseWait}) / 1000);
}


sub isPausable {
    my ($self) = @_;
        return 0;
}


# throws Exception
sub processGameSleep {
    my ($self, $sleep) = @_;
        Time::HiRes::sleep(($sleep) / 1000);
}


# throws Exception
sub processLoopSleep {
    my ($self) = @_;
        $self->{runnableCanvasRefreshHelper}->process();
        if ($self->isPaused()) {
            my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
            if ($self->isRunning() && !$self->isSingleThread()) {
                $stringMaker->delete(0, $stringMaker->length());
                my $currentTimeMillis = $self->{systemWrapper}->currentTimeMillis();
                $self->{logUtil}->putF($stringMaker->append($self->{START_PAUSE})->appendlong($currentTimeMillis)->append($self->{PAUSE_SLEEP})->appendlong($self->{pauseWait})->toString(), $self, $self->{PROCESS_LOOP_SLEEP});
                while ($self->isPaused() && $self->isRunning() && !$self->isSingleThread()) {
                    $self->processSleep();
                    if (!$self->isPausable()) {
                        $stringMaker->delete(0, $stringMaker->length());
                        $self->{logUtil}->putF($stringMaker->append($self->{END_PAUSE})->appendlong($currentTimeMillis)->toString(), $self, $self->{PROCESS_LOOP_SLEEP});
                        return;
                    }
                }
            }
        }
        my $elapsedTime = $self->{loopTimeHelper}->getElapsedTNT();
        my $wait = int($self->{loopTimeHelper}->{delay});
        if ($elapsedTime > $wait) {
            $elapsedTime = $wait;
        } else {
            $self->processGameSleep($wait - $elapsedTime);
        }
}


sub isSingleThread {
    my ($self) = @_;
        return 0;
}


sub run {
    my ($self) = @_;
        $self->setCurrentThread();
}


# throws Exception
sub end2 {
    my ($self) = @_;
}


sub getType {
    my ($self) = @_;
        return -1;
}

# use javax::microedition::lcdui::CommandListener;
use org::allbinary::TsUtil;
use org::allbinary::game::displayable::canvas::NullWaitGameRunnable;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::logic::ABSystemWrapper;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::NullThread;
use org::allbinary::thread::RunnableInterface;
use org::allbinary::thread::ThreadObjectUtil;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::BasicArrayList;
use org::allbinary::canvas::Processor;
use org::allbinary::canvas::RunnableCanvasRefreshHelper;
use java::lang::Thread;

1;

