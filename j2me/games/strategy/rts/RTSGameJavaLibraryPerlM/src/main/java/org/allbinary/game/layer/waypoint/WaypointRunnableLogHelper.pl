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

package org::allbinary::game::layer::waypoint::WaypointRunnableLogHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::game::layer::waypoint::WaypointRunnableLogHelper'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::waypoint::WaypointRunnableLogHelper::instance;
}


sub start {
    my ($self, $pathFindingLayerInterface) = @_;
}


sub end {
    my ($self, $pathFindingLayerInterface) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::layer::PathFindingLayerInterface ();

1;

