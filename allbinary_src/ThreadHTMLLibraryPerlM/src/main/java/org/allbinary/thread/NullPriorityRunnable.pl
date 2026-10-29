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

package org::allbinary::thread::NullPriorityRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::thread::PriorityRunnable';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getPriority {
    my ($self) = @_;
        return 0;
}


sub isDone {
    my ($self) = @_;
        return 1;
}


sub reset {
    my ($self) = @_;
}


sub run {
    my ($self) = @_;
}

use org::allbinary::thread::PriorityRunnable;

1;

