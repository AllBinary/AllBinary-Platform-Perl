#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
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

# Java interface
package org::allbinary::data::tables::TableMappingInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub getKey {
    my ($self) = @_;
    die "abstract method getKey";
}


# throws Exception
sub toVector {
    my ($self) = @_;
    die "abstract method toVector";
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
    die "abstract method toHashMap";
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;

1;

