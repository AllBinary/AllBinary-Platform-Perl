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

package org::allbinary::game::health::NullHealthListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::game::health::HealthListenerInterface';

tie our $NULL_HEALTH_LISTENER, 'java::lang::LazyStatic', sub { 'org::allbinary::game::health::NullHealthListener'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub onHealthChange {
    my ($self) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::health::HealthListenerInterface ();

1;

