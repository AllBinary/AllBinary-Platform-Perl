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

package org::allbinary::logic::communication::java::vm::stats::JvmStatistics;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{runtime} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{runtime} = 'java::lang::Runtime'->getRuntime();
    return $self;
}


sub getFreeMemoryBytes {
    my ($self) = @_;
        return $self->{runtime}->freeMemory();
}


sub getFreeMemoryKilobytes {
    my ($self) = @_;
        return int($self->getFreeMemoryBytes() / 1024);
}


sub getFreeMemoryMegabytes {
    my ($self) = @_;
        return int($self->getFreeMemoryKilobytes() / 1024);
}


sub getMaxMemoryBytes {
    my ($self) = @_;
        return $self->{runtime}->maxMemory();
}


sub getMaxMemoryKilobytes {
    my ($self) = @_;
        return int($self->getMaxMemoryBytes() / 1024);
}


sub getMaxMemoryMegabytes {
    my ($self) = @_;
        return int($self->getMaxMemoryKilobytes() / 1024);
}


sub getTotalMemoryBytes {
    my ($self) = @_;
        return $self->{runtime}->totalMemory();
}


sub getTotalMemoryKilobytes {
    my ($self) = @_;
        return int($self->getTotalMemoryBytes() / 1024);
}


sub getTotalMemoryMegabytes {
    my ($self) = @_;
        return int($self->getTotalMemoryKilobytes() / 1024);
}


sub getFreeMemoryBytesLong {
    my ($self) = @_;
        return $self->getFreeMemoryBytes();
}


sub getFreeMemoryKilobytesLong {
    my ($self) = @_;
        return $self->getFreeMemoryKilobytes();
}


sub getFreeMemoryMegabytesLong {
    my ($self) = @_;
        return $self->getFreeMemoryMegabytes();
}


sub getMaxMemoryBytesLong {
    my ($self) = @_;
        return $self->getMaxMemoryBytes();
}


sub getMaxMemoryKilobytesLong {
    my ($self) = @_;
        return $self->getMaxMemoryKilobytes();
}


sub getMaxMemoryMegabytesLong {
    my ($self) = @_;
        return $self->getMaxMemoryMegabytes();
}


sub getTotalMemoryBytesLong {
    my ($self) = @_;
        return $self->getTotalMemoryBytes();
}


sub getTotalMemoryKilobytesLong {
    my ($self) = @_;
        return $self->getTotalMemoryKilobytes();
}


sub getTotalMemoryMegabytesLong {
    my ($self) = @_;
        return $self->getTotalMemoryMegabytes();
}


sub getFreeMemoryBytesString {
    my ($self) = @_;
        return $self->getFreeMemoryBytesLong()->toString();
}


sub getFreeMemoryKilobytesString {
    my ($self) = @_;
        return $self->getFreeMemoryKilobytesLong()->toString();
}


sub getFreeMemoryMegabytesString {
    my ($self) = @_;
        return $self->getFreeMemoryMegabytesLong()->toString();
}


sub getMaxMemoryBytesString {
    my ($self) = @_;
        return $self->getMaxMemoryBytesLong()->toString();
}


sub getMaxMemoryKilobytesString {
    my ($self) = @_;
        return $self->getMaxMemoryKilobytesLong()->toString();
}


sub getMaxMemoryMegabytesString {
    my ($self) = @_;
        return $self->getMaxMemoryMegabytesLong()->toString();
}


sub getTotalMemoryBytesString {
    my ($self) = @_;
        return $self->getTotalMemoryBytesLong()->toString();
}


sub getTotalMemoryKilobytesString {
    my ($self) = @_;
        return $self->getTotalMemoryKilobytesLong()->toString();
}


sub getTotalMemoryMegabytesString {
    my ($self) = @_;
        return $self->getTotalMemoryMegabytesLong()->toString();
}


sub getNumberOfThreads {
    my ($self) = @_;
        return 'java::lang::Thread'->activeCount();
}


sub getNumberOfThreadsLong {
    my ($self) = @_;
        return $self->getNumberOfThreads();
}


sub getNumberOfThreadsString {
    my ($self) = @_;
        return $self->getNumberOfThreadsLong()->toString();
}


sub collectGarbage {
    my ($self) = @_;
        $self->{runtime}->gc();
}

use java::lang::Runtime;
use java::lang::Thread;

1;

