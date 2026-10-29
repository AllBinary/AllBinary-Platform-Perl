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
package org::allbinary::data::tables::transform::info::TransformInfoEntityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::BasicDataTableInterface';



# throws Exception
sub get {
    my ($self, $name, $propertiesHashMap, $pageContext) = @_;
    die "abstract method get";
}


# throws Exception
sub getObjectConfigs {
    my ($self, $storeName) = @_;
    die "abstract method getObjectConfigs";
}


# throws Exception
sub getNames {
    my ($self, $storeName) = @_;
    die "abstract method getNames";
}


sub delete {
    my ($self, $name) = @_;
    die "abstract method delete";
}


sub insert {
    my ($self, $values) = @_;
    die "abstract method insert";
}


sub update {
    my ($self, $updatedValues) = @_;
    die "abstract method update";
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::jsp::PageContext;
use org::allbinary::data::tables::BasicDataTableInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;

1;

