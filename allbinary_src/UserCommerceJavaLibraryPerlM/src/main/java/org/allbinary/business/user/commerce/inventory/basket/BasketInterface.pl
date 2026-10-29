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
package org::allbinary::business::user::commerce::inventory::basket::BasketInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub addItem {
    my ($self, $id, $num) = @_;
    die "abstract method addItem";
}


sub removeItem {
    my ($self, $id) = @_;
    die "abstract method removeItem";
}


sub adjustItem {
    my ($self, $id, $num) = @_;
    die "abstract method adjustItem";
}


sub getTotalWeight {
    my ($self) = @_;
    die "abstract method getTotalWeight";
}


sub getNumberOfItems {
    my ($self) = @_;
    die "abstract method getNumberOfItems";
}


sub getIds {
    my ($self) = @_;
    die "abstract method getIds";
}


sub getItems {
    my ($self) = @_;
    die "abstract method getItems";
}


sub getNumberOf {
    my ($self, $product) = @_;
    die "abstract method getNumberOf";
}


# throws MoneyException
sub getSubTotal {
    my ($self) = @_;
    die "abstract method getSubTotal";
}

use java::util::HashMap;
# use java::util::Set;
use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::business::user::commerce::money::MoneyException;

1;

