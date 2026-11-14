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

package org::allbinary::game::layer::special::SpecialGameInputFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NO_SPECIAL_GAME_INPUT, 'java::lang::LazyStatic', sub { 'org::allbinary::game::layer::special::SpecialGameInput'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::layer::special::SpecialGameInput ();

1;

