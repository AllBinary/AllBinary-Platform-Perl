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
package org::allbinary::business::user::commerce::inventory::item::OrderItemInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::inventory::item::ItemInterface';



sub setGroup {
    my ($self, $value) = @_;
    die "abstract method setGroup";
}


sub setTax {
    my ($self, $value) = @_;
    die "abstract method setTax";
}


sub setShippingType {
    my ($self, $value) = @_;
    die "abstract method setShippingType";
}


sub setShippingCost {
    my ($self, $value) = @_;
    die "abstract method setShippingCost";
}


sub setShippingAddress {
    my ($self, $value) = @_;
    die "abstract method setShippingAddress";
}


sub setSpecial {
    my ($self, $value) = @_;
    die "abstract method setSpecial";
}


sub getGroup {
    my ($self) = @_;
    die "abstract method getGroup";
}


sub getTax {
    my ($self) = @_;
    die "abstract method getTax";
}


sub getShippingType {
    my ($self) = @_;
    die "abstract method getShippingType";
}


sub getShippingCost {
    my ($self) = @_;
    die "abstract method getShippingCost";
}


sub getShippingAddress {
    my ($self) = @_;
    die "abstract method getShippingAddress";
}


sub getSpecial {
    my ($self) = @_;
    die "abstract method getSpecial";
}

use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;

1;

