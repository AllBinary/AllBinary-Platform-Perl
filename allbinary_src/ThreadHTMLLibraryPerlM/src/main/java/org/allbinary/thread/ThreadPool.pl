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

package org::allbinary::thread::ThreadPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NORMAL_PRIORITY = 5;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{NULL_RUNNABLE} = 'org::allbinary::thread::NullRunnable'->getInstance();
    $self->{threadPoolStrings} = 'org::allbinary::thread::ThreadPoolStrings'->getInstance();
    $self->{threadObjectUtil} = 'org::allbinary::thread::ThreadObjectUtil'->getInstance();
    $self->{isAlive} = 0;
    $self->{taskQueue} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{numThreads} = 0;
    $self->{runningTask} = 0;
    $self->{currentPriorityRunnable} = $self->{threadObjectUtil}->{NULL_PRIORITY_RUNNABLE};
}


sub new {
    my ($class, $poolName, $numThreads, $priority) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub runAPriorityTask {
    my ($self) = @_;
        if (!$self->{currentPriorityRunnable}->isDone()) {
            $self->{currentPriorityRunnable}->run();
        } else {
            my $runnable = $self->getTask();
            if ($runnable == $self->{NULL_RUNNABLE}) {
                return;
            }
            $self->{currentPriorityRunnable} = $runnable;
            if (!($self->{currentPriorityRunnable} == $self->{threadObjectUtil}->{NULL_PRIORITY_RUNNABLE})) {
                $self->{currentPriorityRunnable}->reset();
                $self->{currentPriorityRunnable}->run();
            }
        }
}


# throws Exception
sub runATask {
    my ($self) = @_;
        my $runnable = $self->getTask();
        if (defined($runnable)) {
            $runnable->run();
        }
}


sub init {
    my ($self) = @_;
        if (!$self->{isAlive}) {
            $self->{isAlive} = 1;
            $self->{taskQueue} = 'org::allbinary::util::BasicArrayListD'->new();
        }
}


sub runTaskWithPriority {
    my ($self, $task) = @_;
        if (!$self->{isAlive}) {
            $self->init();
        }
        if (defined($task)) {
            my $size = $self->{taskQueue}->size();
            my $runnable = undef;
            my $lowerPriorityRunnable = $self->{threadObjectUtil}->{NULL_PRIORITY_RUNNABLE};
            for (my $index = 0; $index < $size; $index++) {
                $runnable = $self->{taskQueue}->get($index);
                if ($runnable->getPriority() > $task->getPriority()) {
                    $lowerPriorityRunnable = $runnable;
                    last;
                }
            }
            if ($lowerPriorityRunnable == $self->{threadObjectUtil}->{NULL_PRIORITY_RUNNABLE}) {
                $self->{taskQueue}->add($task);
            } else {
                my $index = $self->{taskQueue}->indexOf($lowerPriorityRunnable);
                $self->{taskQueue}->addAt($index, $task);
            }
        }
}


sub runTask {
    my ($self, $task) = @_;
        if (!$self->{isAlive}) {
            $self->init();
        }
        if (defined($task)) {
            $self->{taskQueue}->add($task);
        }
}


# throws InterruptedException
sub getTask {
    my ($self) = @_;
        if ($self->{taskQueue}->isEmpty()) {
            return $self->{NULL_RUNNABLE};
        }
        return $self->{taskQueue}->removeAt(0);
}


sub clear {
    my ($self) = @_;
        $self->{taskQueue}->clear();
}


sub close {
    my ($self) = @_;
        if ($self->{isAlive}) {
            $self->{isAlive} = 0;
            $self->{taskQueue}->clear();
            $self->{currentPriorityRunnable} = $self->{threadObjectUtil}->{NULL_PRIORITY_RUNNABLE};
        }
}


sub join {
    my ($self) = @_;
        $self->{isAlive} = 0;
        $self->{taskQueue}->clear();
        $self->{currentPriorityRunnable} = $self->{threadObjectUtil}->{NULL_PRIORITY_RUNNABLE};
}


sub isBusy {
    my ($self) = @_;
        if (!$self->{isAlive}) {
            return 0;
        }
        if ($self->{taskQueue}->size() > 0) {
            return 1;
        }
        if ($self->{runningTask}) {
            return 1;
        }
        return 0;
}


sub threadStarted {
    my ($self) = @_;
}


sub threadStopped {
    my ($self) = @_;
        if ($self->{numThreads} == 1) {
            $self->{isAlive} = 0;
            $self->{taskQueue}->clear();
            $self->{currentPriorityRunnable} = $self->{threadObjectUtil}->{NULL_PRIORITY_RUNNABLE};
        }
}


sub startTask {
    my ($self, $task) = @_;
}


sub completedTask {
    my ($self, $task) = @_;
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::thread::NullRunnable;
use org::allbinary::thread::ThreadPoolStrings;
use org::allbinary::thread::ThreadObjectUtil;

1;

