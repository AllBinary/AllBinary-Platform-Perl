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

package org::allbinary::game::layer::unit::UnitWaypointStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::unit::UnitWaypointStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{WANDERING} = "Order?";
    $self->{THINKING} = "Thinking";
    $self->{THINKING_ABOUT_TARGET} = "Hmmm";
    $self->{TARGET} = "Target";
    $self->{KILL} = "Kill!";
    $self->{STOP} = "Stop";
    $self->{WAYPOINT_DESTROYED_SHORT} = "Uh Oh";
    $self->{WAYPOINT_DESTROYED} = "Waypoint Destroyed";
    $self->{ALL_VISITED_SHORT} = "Arrived";
    $self->{ALL_VISITED} = "All Visited";
    $self->{ALREADY_THERE_SHORT} = "Again?";
    $self->{ALREADY_THERE} = "Already There";
    $self->{NEXT_PATH_NODE} = 'org::allbinary::string::CommonLabels'->getInstance()->{NEXT} . " Path Node";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::unit::UnitWaypointStrings::instance;
}

use org::allbinary::string::CommonLabels;

1;

