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

package org::platform::ThreedObjResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::platform::ThreedObjResources'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::platform::ThreedObjResources::instance;
}


sub get {
    my ($self, $resourceName) = @_;
        my $resourceName2 = $self->{hashtable}->get($resourceName);
        if (defined($resourceName2)) {
            return $resourceName2;
        }
        return $resourceName;
}

use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;

1;

