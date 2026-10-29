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

#This is mainly for network communications.
package org::allbinary::thread::PathFindingThreadPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::thread::ThreadPool';

our $instance = 'org::allbinary::thread::PathFindingThreadPool'->new("PathFinding", 1, 1);


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::thread::PathFindingThreadPool::instance;
}


sub new {
    my ($class, $poolName, $numThreads, $priority) = @_;
    my $self = $class->SUPER::new($poolName, $numThreads, $org::allbinary::thread::ThreadPool::NORMAL_PRIORITY);
        # super(...) made $self above
    return $self;
}


sub runTaskWithPriority {
    my ($self, $task) = @_;
        $self->SUPER::runTaskWithPriority($task);
}


sub runTask {
    my ($self, $task) = @_;
        $self->SUPER::runTask($task);
}


sub startTask {
    my ($self, $task) = @_;
}


sub completedTask {
    my ($self, $task) = @_;
}

use org::allbinary::thread::ThreadPool;

1;

