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
package org::allbinary::business::user::commerce::inventory::order::OrderInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub setShippingMethod {
    my ($self, $shippingType) = @_;
    die "abstract method setShippingMethod";
}


sub setPaymentMethod {
    my ($self, $value) = @_;
    die "abstract method setPaymentMethod";
}


sub setSpecial {
    my ($self, $special) = @_;
    die "abstract method setSpecial";
}


sub setStoreName {
    my ($self, $value) = @_;
    die "abstract method setStoreName";
}


sub setUserComments {
    my ($self, $value) = @_;
    die "abstract method setUserComments";
}


sub setUserCancelComments {
    my ($self, $value) = @_;
    die "abstract method setUserCancelComments";
}


sub setStoreComments {
    my ($self, $value) = @_;
    die "abstract method setStoreComments";
}


sub setStoreCancelComments {
    my ($self, $value) = @_;
    die "abstract method setStoreCancelComments";
}


sub getBasket {
    my ($self) = @_;
    die "abstract method getBasket";
}


sub getShippingMethod {
    my ($self) = @_;
    die "abstract method getShippingMethod";
}


sub getPaymentMethod {
    my ($self) = @_;
    die "abstract method getPaymentMethod";
}


sub getSpecial {
    my ($self) = @_;
    die "abstract method getSpecial";
}


sub getId {
    my ($self) = @_;
    die "abstract method getId";
}


sub getStoreName {
    my ($self) = @_;
    die "abstract method getStoreName";
}


sub getUserComments {
    my ($self) = @_;
    die "abstract method getUserComments";
}


sub getUserCancelComments {
    my ($self) = @_;
    die "abstract method getUserCancelComments";
}


sub getStoreComments {
    my ($self) = @_;
    die "abstract method getStoreComments";
}


sub getStoreCancelComments {
    my ($self) = @_;
    die "abstract method getStoreCancelComments";
}

use org::allbinary::business::user::commerce::inventory::basket::BasketInterface;

1;

