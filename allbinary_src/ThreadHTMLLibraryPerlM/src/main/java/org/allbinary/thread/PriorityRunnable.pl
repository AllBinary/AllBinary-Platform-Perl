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

# Java interface
package org::allbinary::thread::PriorityRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getPriority {
    my ($self) = @_;
    die "abstract method getPriority";
}


sub isDone {
    my ($self) = @_;
    die "abstract method isDone";
}


sub reset {
    my ($self) = @_;
    die "abstract method reset";
}


1;

