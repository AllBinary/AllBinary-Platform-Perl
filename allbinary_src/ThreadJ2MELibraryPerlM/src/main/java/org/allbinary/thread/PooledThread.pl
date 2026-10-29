# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::thread::PooledThread;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Thread';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{threadObjectUtil} = 'org::allbinary::thread::ThreadObjectUtil'->getInstance();
    $self->{threadPool} = undef;
    $self->{INTERRUPT_EXCEPTION} = "Exit InterruptedException";
}


sub new {
    my ($class, $threadPool) = @_;
    my $self = $class->SUPER::new($threadPool->createName());
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{CONSTRUCTOR}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{threadPool} = $threadPool;
    return $self;
}


sub run {
    my ($self) = @_;
        $self->{threadPool}->threadStarted();
        while (1) {
            my $task2 = $self->{threadObjectUtil}->{NULL_PRIORITY_RUNNABLE};
            try {
                $task2 = $self->{threadPool}->getTask();
                $self->{threadPool}->{runningTask} = 1;
                $self->{threadPool}->startTask($task2);
            } catch ($ex) {
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                $logUtil->putF($self->{INTERRUPT_EXCEPTION}, $self, $self->{commonStrings}->{RUN});
                last;
            }
            if ($task2 == $self->{threadObjectUtil}->{NULL_PRIORITY_RUNNABLE}) {
                last;
            }
            try {
                $task2->run();
                $self->{threadPool}->completedTask($task2);
                $self->{threadPool}->{runningTask} = 0;
            } catch ($e) {
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                $logUtil->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{EXCEPTION_LABEL})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($task2))->toString(), $self, $self->{commonStrings}->{RUN}, $e);
            }
        }
        $self->{threadPool}->threadStopped();
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use java::lang::Thread;
use org::allbinary::thread::ThreadObjectUtil;

1;

