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
package org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::BasicDataTableInterface';



sub insert {
    my ($self, $userName, $order) = @_;
    die "abstract method insert";
}


sub setStatus {
    my ($self, $orderId, $status) = @_;
    die "abstract method setStatus";
}


sub setPaymentMethod {
    my ($self, $orderId, $status) = @_;
    die "abstract method setPaymentMethod";
}


# throws Exception
sub getStoreOrders {
    my ($self, $storeFrontInterface) = @_;
    die "abstract method getStoreOrders";
}


# throws Exception
sub getOrders {
    my ($self, $userName) = @_;
    die "abstract method getOrders";
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getOrders {
    my ($self, $status, $fromDate, $toDate) = @_;
    die "abstract method getOrders";
}


# throws Exception
sub getOrder {
    my ($self, $id) = @_;
    die "abstract method getOrder";
}


# throws Exception
sub update {
    my ($self, $whereHashMap, $orderHashMap) = @_;
    die "abstract method update";
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::order::Order;
use org::allbinary::business::user::commerce::inventory::order::OrderHistory;
use org::allbinary::data::tables::BasicDataTableInterface;

1;

