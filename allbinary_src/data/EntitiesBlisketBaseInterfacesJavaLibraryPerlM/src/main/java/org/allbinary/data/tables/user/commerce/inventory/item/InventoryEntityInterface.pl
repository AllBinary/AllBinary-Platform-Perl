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
package org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::BasicDataTableInterface';



# throws MoneyException
sub getItem {
    my ($self, $id) = @_;
    die "abstract method getItem";
}


# throws Exception
sub getItems {
    my ($self, $storeFrontInterface) = @_;
    die "abstract method getItems";
}


sub getWeight {
    my ($self, $id) = @_;
    die "abstract method getWeight";
}


sub deleteWhere {
    my ($self, $key, $value) = @_;
    die "abstract method deleteWhere";
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
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use org::allbinary::business::user::commerce::money::MoneyException;
use org::allbinary::data::tables::BasicDataTableInterface;

1;

