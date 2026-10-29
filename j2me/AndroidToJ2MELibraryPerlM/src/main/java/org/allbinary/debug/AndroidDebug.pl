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

package org::allbinary::debug::AndroidDebug;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::debug::DebugInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{startTime} = 9223372036854775807;
    $self->{running} = 0;
    $self->{bufferSize} = 32 * 1024 * 1024;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub start {
    my ($self) = @_;
        $self->setStartTime(int(Time::HiRes::time() * 1000));
        'android::os::Debug'->startMethodTracing("trace", $self->{bufferSize});
        $self->setRunning(1);
}


sub stop {
    my ($self) = @_;
        $self->{startTime} = 9223372036854775807;
        'android::os::Debug'->stopMethodTracing();
        $self->setRunning(0);
}


sub getMaxTime {
    my ($self) = @_;
        return 120000;
}


sub setStartTime {
    my ($self, $startTime) = @_;
        $self->{startTime} = $startTime;
}


sub getStartTime {
    my ($self) = @_;
        return $self->{startTime};
}


sub setRunning {
    my ($self, $running) = @_;
        $self->{running} = $running;
}


sub isRunning {
    my ($self) = @_;
        return $self->{running};
}

use android::os::Debug;
use org::allbinary::debug::DebugInterface;
use java::lang::System;

1;

