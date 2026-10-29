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
package org::allbinary::business::context::modules::storefront::statistics::StoreFrontStatisticsInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getAdvertisements {
    my ($self) = @_;
    die "abstract method getAdvertisements";
}


sub getUsers {
    my ($self) = @_;
    die "abstract method getUsers";
}


sub getInventory {
    my ($self) = @_;
    die "abstract method getInventory";
}


sub getOrders {
    my ($self) = @_;
    die "abstract method getOrders";
}

use org::allbinary::business::context::modules::storefront::statistics::advertisements::StoreFrontAdvertisementsStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatisticsInterface;

1;

