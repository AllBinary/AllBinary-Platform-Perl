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

# Java interface
package org::allbinary::debug::DebugInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub start {
    my ($self) = @_;
    die "abstract method start";
}


sub stop {
    my ($self) = @_;
    die "abstract method stop";
}


sub getStartTime {
    my ($self) = @_;
    die "abstract method getStartTime";
}


sub getMaxTime {
    my ($self) = @_;
    die "abstract method getMaxTime";
}


sub isRunning {
    my ($self) = @_;
    die "abstract method isRunning";
}


1;

