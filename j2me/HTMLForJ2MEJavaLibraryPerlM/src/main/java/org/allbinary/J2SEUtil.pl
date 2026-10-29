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

#HTMLForJ2ME
package org::allbinary::J2SEUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::J2SEUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::J2SEUtil::instance;
}


sub getHashMapAsArray {
    my ($self, $hashMap) = @_;
        my $objectArray = $hashMap->keySet()->toArray();
        return $objectArray;
}


sub getMapAsArray {
    my ($self, $map) = @_;
        my $objectArray = $map->keySet()->toArray();
        return $objectArray;
}


sub getSetAsArray {
    my ($self, $set) = @_;
        my $objectArray = $set->toArray();
        return $objectArray;
}

use java::util::HashMap;
# use java::util::Map;
# use java::util::Set;

1;

