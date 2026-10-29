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

package org::allbinary::device::NullGL10;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::khronos::opengles::GL10';

our $NULL_GL10 = 'org::allbinary::device::NullGL10'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}

# use javax::microedition::khronos::opengles::GL10;

1;

