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

package org::allbinary::business::context::modules::storefront::statistics::RealTimeStoreFrontStatistics;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::context::modules::storefront::statistics::StoreFrontStatisticsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{storeFrontAdvertisementsStatisticsInterface} = undef;
    $self->{storeFrontUsersStatisticsInterface} = undef;
    $self->{storeFrontInventoryStatisticsInterface} = undef;
    $self->{storeFrontOrderHistoryStatisticsInterface} = undef;
}


sub new {
    my ($class, $storeFrontInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{storeFrontAdvertisementsStatisticsInterface} = 'org::allbinary::business::context::modules::storefront::statistics::advertisements::StoreFrontAdvertisementsStatistics'->new($storeFrontInterface);
        $self->{storeFrontUsersStatisticsInterface} = 'org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatistics'->new($storeFrontInterface);
        $self->{storeFrontInventoryStatisticsInterface} = 'org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatistics'->new($storeFrontInterface);
        $self->{storeFrontOrderHistoryStatisticsInterface} = 'org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatistics'->new($storeFrontInterface);
    return $self;
}


sub getAdvertisements {
    my ($self) = @_;
        return $self->{storeFrontAdvertisementsStatisticsInterface};
}


sub getUsers {
    my ($self) = @_;
        return $self->{storeFrontUsersStatisticsInterface};
}


sub getInventory {
    my ($self) = @_;
        return $self->{storeFrontInventoryStatisticsInterface};
}


sub getOrders {
    my ($self) = @_;
        return $self->{storeFrontOrderHistoryStatisticsInterface};
}

use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::context::modules::storefront::statistics::advertisements::StoreFrontAdvertisementsStatistics;
use org::allbinary::business::context::modules::storefront::statistics::advertisements::StoreFrontAdvertisementsStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatistics;
use org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatistics;
use org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatistics;
use org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::StoreFrontStatisticsInterface;

1;

