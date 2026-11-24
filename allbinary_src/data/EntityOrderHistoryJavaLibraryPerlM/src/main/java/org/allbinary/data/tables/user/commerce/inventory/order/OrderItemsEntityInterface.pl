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
package org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::BasicDataTableInterface';



sub setStatus {
    my ($self, $orderId, $groupId, $status) = @_;
    die "abstract method setStatus";
}


sub isEverythingShipped {
    my ($self, $orderId) = @_;
    die "abstract method isEverythingShipped";
}


sub getBasketReview {
    my ($self, $orderId) = @_;
    die "abstract method getBasketReview";
}


sub insert_j2 {
    my ($self, $userName, $order) = @_;
    die "abstract method insert";
}


sub insert_j1 {
    my ($self, $values) = @_;
    die "abstract method insert";
}

sub insert {
    my ($invocant, @arguments) = @_;
    return $invocant->insert_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->insert_j1(@arguments) if scalar(@arguments) == 1;
    die "No method insert takes " . scalar(@arguments) . " arguments";
}

use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::business::user::commerce::inventory::basket::BasketReview ();
use org::allbinary::business::user::commerce::inventory::order::OrderInterface ();
use org::allbinary::data::tables::BasicDataTableInterface ();

1;

