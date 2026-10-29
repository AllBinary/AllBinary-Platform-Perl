# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::thread::MusicThreadPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::thread::ThreadPool';

our $THREAD_POOL = 'org::allbinary::thread::ThreadPool'->new("Music", 2, $org::allbinary::thread::ThreadPool::NORMAL_PRIORITY);


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::thread::MusicThreadPool::THREAD_POOL;
}


sub new {
    my ($class, $poolName, $numThreads, $priority) = @_;
    my $self = $class->SUPER::new($poolName, $numThreads, $priority);
        # super(...) made $self above
    return $self;
}


sub runTask {
    my ($self, $task) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($task))->appendlong(int(int(Time::HiRes::time() * 1000)))->toString(), $self, $self->{threadPoolStrings}->{ADD_TASK});
        $self->SUPER::runTask($task);
}


sub startTask {
    my ($self, $task) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{threadPoolStrings}->{START_TASK})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($task))->appendlong(int(int(Time::HiRes::time() * 1000)))->toString(), $self, $self->{commonStrings}->{RUN});
}


sub completedTask {
    my ($self, $task) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{threadPoolStrings}->{COMPLETE_TASK})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($task))->appendlong(int(int(Time::HiRes::time() * 1000)))->toString(), $self, $self->{commonStrings}->{RUN});
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::thread::ThreadPool;
use java::lang::System;

1;

