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

package org::allbinary::ThreedResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $threedResources = 'org::allbinary::ThreedResources'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getThreedResources {
    my ($class) = @_;
        return $org::allbinary::ThreedResources::threedResources;
}


sub add {
    my ($self) = @_;
}


1;

