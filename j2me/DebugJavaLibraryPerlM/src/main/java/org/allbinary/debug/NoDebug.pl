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

package org::allbinary::debug::NoDebug;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::debug::DebugInterface';

our $SINGLETON = 'org::allbinary::debug::NoDebug'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::debug::NoDebug::SINGLETON;
}


sub start {
    my ($self) = @_;
}


sub stop {
    my ($self) = @_;
}


sub getMaxTime {
    my ($self) = @_;
        return 10000;
}


sub getStartTime {
    my ($self) = @_;
        return 0;
}


sub isRunning {
    my ($self) = @_;
        return 0;
}

use org::allbinary::debug::DebugInterface;

1;

