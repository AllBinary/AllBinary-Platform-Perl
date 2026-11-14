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

package org::allbinary::game::displayable::canvas::NullDemoPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::game::displayable::canvas::DemoPaintableInterface';

tie our $NULL_DEMO_PAINTABLE, 'java::lang::LazyStatic', sub { 'org::allbinary::game::displayable::canvas::NullDemoPaintable'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub showGamePaintable {
    my ($self) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::displayable::canvas::DemoPaintableInterface ();

1;

