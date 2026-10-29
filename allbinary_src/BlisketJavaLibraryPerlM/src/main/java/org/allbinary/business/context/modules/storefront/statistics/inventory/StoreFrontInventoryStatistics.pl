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

package org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatistics;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatisticsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{totalNumberOfItems} = 0;
    $self->{totalInventorySaleValueMoney} = undef;
}


sub new {
    my ($class, $storeFrontInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{totalInventorySaleValueMoney} = 'org::allbinary::business::user::commerce::money::Money'->new();
        my $inventoryEntityInterface = 'org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory'->getInstance()->getInventoryEntityInstance();
        my $itemVector = $inventoryEntityInterface->getItems($storeFrontInterface);
        my $size = $itemVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $itemInterface = $itemVector->get($index);
            my $numberInStock = int(("" . ($itemInterface->getNumber())));
            $self->{totalNumberOfItems} = $self->{totalNumberOfItems} + $numberInStock;
            my $itemPriceMoney = $itemInterface->getPrice();
            $itemPriceMoney->multiply($numberInStock);
            $self->{totalInventorySaleValueMoney}->add($itemPriceMoney->toString());
        }
    return $self;
}


sub getNumber {
    my ($self) = @_;
        return $self->{totalNumberOfItems};
}


sub getTotal {
    my ($self) = @_;
        return $self->{totalInventorySaleValueMoney};
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put('org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatisticsData'->getInstance()->{NUMBEROFITEMS}, $self->getNumber()->toString());
        $hashMap->put('org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatisticsData'->getInstance()->{TOTALVALUE}, $self->getTotal()->toString());
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
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatisticsData;

1;

