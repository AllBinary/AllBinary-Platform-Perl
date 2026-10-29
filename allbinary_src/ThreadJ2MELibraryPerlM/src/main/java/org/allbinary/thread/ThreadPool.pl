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

our $ROOT_NAME = "-PooledThread-";
our $NORMAL_PRIORITY = $java::lang::Thread::NORM_PRIORITY;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{NULL_RUNNABLE} = 'org::allbinary::thread::NullRunnable'->getInstance();
    $self->{threadPoolStrings} = 'org::allbinary::thread::ThreadPoolStrings'->getInstance();
    $self->{threadObjectUtil} = 'org::allbinary::thread::ThreadObjectUtil'->getInstance();
    $self->{poolName} = undef;
    $self->{priority} = undef;
    $self->{isAlive} = 0;
    $self->{taskQueue} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
    $self->{threadID} = 0;
    $self->{numThreads} = undef;
    $self->{runningTask} = 0;
}


sub new {
    my ($class, $poolName, $numThreads, $priority) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{poolName} = $poolName;
        $self->{priority} = $priority;
        $self->{numThreads} = $numThreads;
    return $self;
}


sub init {
    my ($self) = @_;
        if (!$self->{isAlive}) {
            $self->{isAlive} = 1;
            $self->{taskQueue} = 'org::allbinary::util::BasicArrayListD'->new();
            my $pooledThread = undef;
            for (my $i = 0; $i < $self->{numThreads}; $i++) {
                $pooledThread = 'org::allbinary::thread::PooledThread'->new($self);
                $pooledThread->setPriority($self->{priority});
                $pooledThread->start();
            }
        }
}


# throws Exception
sub runAPriorityTask {
    my ($self) = @_;
        die ("RuntimeException");
}


sub runTaskWithPriority {
    my ($self, $task) = @_;
        { # synchronized ($self)
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
                $self->notify();
            }
        }
}


sub runTask {
    my ($self, $task) = @_;
        { # synchronized ($self)
            if (!$self->{isAlive}) {
                $self->init();
            }
            if (defined($task)) {
                $self->{taskQueue}->add($task);
                $self->notify();
            }
        }
}


# throws InterruptedException
sub getTask {
    my ($self) = @_;
        { # synchronized ($self)
            while ($self->{taskQueue}->size() == 0) {
                if (!$self->{isAlive}) {
                    return $self->{NULL_RUNNABLE};
                }
                $self->wait();
            }
            my $runnable = $self->{taskQueue}->removeAt(0);
            return $runnable;
        }
}


sub clear {
    my ($self) = @_;
        { # synchronized ($self)
            if ($self->{isAlive}) {
                $self->{taskQueue}->clear();
            }
        }
}


sub close {
    my ($self) = @_;
        { # synchronized ($self)
            if ($self->{isAlive}) {
                $self->{isAlive} = 0;
                $self->{taskQueue}->clear();
            }
        }
}


sub join {
    my ($self) = @_;
        { # synchronized ($self)
            $self->{isAlive} = 0;
            $self->{taskQueue}->clear();
            $self->notifyAll();
        }
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
        }
}


sub startTask {
    my ($self, $task) = @_;
}


sub completedTask {
    my ($self, $task) = @_;
}


sub createName {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append($self->{poolName})->append($org::allbinary::thread::ThreadPool::ROOT_NAME)->appendint($self->{threadID}++)->toString();
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;
use java::lang::Thread;
use org::allbinary::thread::NullRunnable;
use org::allbinary::thread::ThreadPoolStrings;
use org::allbinary::thread::ThreadObjectUtil;
use org::allbinary::thread::PooledThread;

1;

