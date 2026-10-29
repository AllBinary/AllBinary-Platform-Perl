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
package org::allbinary::business::user::commerce::inventory::order::OrderHistoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub setUserName {
    my ($self, $value) = @_;
    die "abstract method setUserName";
}


sub setDefaultShippingAddress {
    my ($self, $shippingAddress) = @_;
    die "abstract method setDefaultShippingAddress";
}


sub setBillingAddress {
    my ($self, $billingAddress) = @_;
    die "abstract method setBillingAddress";
}


sub setPaymentInfo {
    my ($self, $payment) = @_;
    die "abstract method setPaymentInfo";
}


sub setShipDate {
    my ($self, $value) = @_;
    die "abstract method setShipDate";
}


sub setOrderDate {
    my ($self, $value) = @_;
    die "abstract method setOrderDate";
}


sub setTransDate {
    my ($self, $value) = @_;
    die "abstract method setTransDate";
}


sub setCancelDate {
    my ($self, $value) = @_;
    die "abstract method setCancelDate";
}


sub setStatus {
    my ($self, $value) = @_;
    die "abstract method setStatus";
}


sub setSubTotal {
    my ($self, $value) = @_;
    die "abstract method setSubTotal";
}


sub setShippingCost {
    my ($self, $value) = @_;
    die "abstract method setShippingCost";
}


sub setTaxes {
    my ($self, $value) = @_;
    die "abstract method setTaxes";
}


sub setTotal {
    my ($self, $value) = @_;
    die "abstract method setTotal";
}


sub getUserName {
    my ($self) = @_;
    die "abstract method getUserName";
}


sub getShippingAddress {
    my ($self) = @_;
    die "abstract method getShippingAddress";
}


sub getBillingAddress {
    my ($self) = @_;
    die "abstract method getBillingAddress";
}


sub getPaymentInfo {
    my ($self) = @_;
    die "abstract method getPaymentInfo";
}


sub getShipDate {
    my ($self) = @_;
    die "abstract method getShipDate";
}


sub getOrderDate {
    my ($self) = @_;
    die "abstract method getOrderDate";
}


sub getTransDate {
    my ($self) = @_;
    die "abstract method getTransDate";
}


sub getCancelDate {
    my ($self) = @_;
    die "abstract method getCancelDate";
}


sub getStatus {
    my ($self) = @_;
    die "abstract method getStatus";
}


sub getSubTotal {
    my ($self) = @_;
    die "abstract method getSubTotal";
}


sub getShippingCost {
    my ($self) = @_;
    die "abstract method getShippingCost";
}


sub getTaxes {
    my ($self) = @_;
    die "abstract method getTaxes";
}


sub getTotal {
    my ($self) = @_;
    die "abstract method getTotal";
}


sub getPaymentMethod {
    my ($self) = @_;
    die "abstract method getPaymentMethod";
}

use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::business::user::commerce::money::payment::Payment;

1;

