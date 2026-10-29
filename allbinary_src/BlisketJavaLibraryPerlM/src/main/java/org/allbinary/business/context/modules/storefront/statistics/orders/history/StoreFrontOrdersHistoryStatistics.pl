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

package org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatistics;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatisticsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{numberOfOrdersLong} = undef;
    $self->{subTotalMoney} = undef;
    $self->{shippingCostMoney} = undef;
    $self->{taxesMoney} = undef;
    $self->{totalMoney} = undef;
}


sub new {
    my ($class, $storeFrontInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{subTotalMoney} = 'org::allbinary::business::user::commerce::money::Money'->new();
        $self->{shippingCostMoney} = 'org::allbinary::business::user::commerce::money::Money'->new();
        $self->{taxesMoney} = 'org::allbinary::business::user::commerce::money::Money'->new();
        $self->{totalMoney} = 'org::allbinary::business::user::commerce::money::Money'->new();
        my $orderHistoryEntityInterface = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory'->getInstance();
        my $orderHistoryInterfaceVector = $orderHistoryEntityInterface->getStoreOrders($storeFrontInterface);
        my $numberOfOrders = 0;
        my $orderHistoryInterface = undef;
        my $size = $orderHistoryInterfaceVector->size();
        for (my $index = 0; $index < $size; $index++) {
            $orderHistoryInterface = $orderHistoryInterfaceVector->get($index);
            $numberOfOrders = $numberOfOrders + 1;
            $self->{subTotalMoney}->add($orderHistoryInterface->getSubTotal());
            $self->{shippingCostMoney}->add($orderHistoryInterface->getShippingCost());
            $self->{taxesMoney}->add($orderHistoryInterface->getTaxes());
            $self->{totalMoney}->add($orderHistoryInterface->getTotal());
        }
        $self->{numberOfOrdersLong} = $numberOfOrders;
    return $self;
}


sub getNumberOfOrders {
    my ($self) = @_;
        return $self->{numberOfOrdersLong};
}


sub getSubTotal {
    my ($self) = @_;
        return $self->{subTotalMoney};
}


sub getShippingCost {
    my ($self) = @_;
        return $self->{shippingCostMoney};
}


sub getTaxes {
    my ($self) = @_;
        return $self->{taxesMoney};
}


sub getTotal {
    my ($self) = @_;
        return $self->{totalMoney};
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $storeFrontOrdersHistoryStatisticsData = 'org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatisticsData'->getInstance();
        $hashMap->put($storeFrontOrdersHistoryStatisticsData->{NUMBEROFORDERS}, $self->getNumberOfOrders()->toString());
        $hashMap->put($storeFrontOrdersHistoryStatisticsData->{SUBTOTAL}, $self->getSubTotal()->toString());
        $hashMap->put($storeFrontOrdersHistoryStatisticsData->{SHIPPINGCOST}, $self->getShippingCost()->toString());
        $hashMap->put($storeFrontOrdersHistoryStatisticsData->{TAXES}, $self->getTaxes()->toString());
        $hashMap->put($storeFrontOrdersHistoryStatisticsData->{TOTAL}, $self->getTotal()->toString());
        return $hashMap;
}


sub toVector {
    my ($self) = @_;
        return undef;
}


sub getKey {
    my ($self) = @_;
        return undef;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryInterface;
use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatisticsData;

1;

