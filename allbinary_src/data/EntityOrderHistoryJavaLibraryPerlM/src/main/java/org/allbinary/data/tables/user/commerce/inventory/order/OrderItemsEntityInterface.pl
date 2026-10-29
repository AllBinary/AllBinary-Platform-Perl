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


sub insert {
    my ($self, $userName, $order) = @_;
    die "abstract method insert";
}


# Java overloaded method: Perl keeps the last definition
sub insert {
    my ($self, $values) = @_;
    die "abstract method insert";
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::commerce::inventory::basket::BasketReview;
use org::allbinary::business::user::commerce::inventory::order::OrderInterface;
use org::allbinary::data::tables::BasicDataTableInterface;

1;

