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

package org::allbinary::thread::NullThread;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_THREAD = 'java::lang::Thread'->new('org::allbinary::thread::NullRunnable'->getInstance(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}

use org::allbinary::logic::string::StringUtil;
use java::lang::Thread;
use org::allbinary::thread::NullRunnable;

1;

