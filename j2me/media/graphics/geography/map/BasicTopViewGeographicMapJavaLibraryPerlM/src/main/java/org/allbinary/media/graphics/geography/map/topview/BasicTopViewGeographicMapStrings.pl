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

package org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{DEFAULT} = "Default";
    $self->{OTHER} = "Other";
    $self->{WALL} = "Wall";
    $self->{OFF_MAP} = "OffMap";
    $self->{FLOOR} = "Floor";
    $self->{DOOR} = "Door";
    $self->{STAIRS_UP} = "StairsUp";
    $self->{STAIRS_DOWN} = "StairsDown";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapStrings::instance;
}


1;

