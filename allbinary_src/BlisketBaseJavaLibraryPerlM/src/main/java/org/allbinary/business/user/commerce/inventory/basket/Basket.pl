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

package org::allbinary::business::user::commerce::inventory::basket::Basket;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::inventory::basket::BasketInterface','java::io::Serializable';


sub _init_fields {
    my ($self) = @_;
    $self->{items} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub addItem {
    my ($self, $id, $num) = @_;
        if ($self->{items}->containsKey($id)) {
            my $oldNumStr = ("" . $self->{items}->get($id));
            my $oldNumInt = ("" . ($oldNumStr));
            my $numInt = ("" . ($num));
            my $newNumInt = int($oldNumInt) + int($numInt);
            $self->{items}->put($id, ("" . ($newNumInt)));
        } else {
            $self->{items}->put($id, $num);
        }
}


sub removeItem {
    my ($self, $id) = @_;
        $self->{items}->remove($id);
}


sub adjustItem {
    my ($self, $id, $num) = @_;
        if (int(("" . ($num))) > 0) {
            $self->{items}->put($id, $num);
        } else {
            $self->{items}->remove($id);
        }
}


sub getTotalWeight {
    my ($self) = @_;
        my $itemsAndNumberInBasket = $self->getItems();
        my $totalWeight = 'org::allbinary::business::user::commerce::money::Money'->new();
        if ($itemsAndNumberInBasket->size() > 0) {
            my $items = $itemsAndNumberInBasket->keySet();
            my $product = undef;
            my $weightFloat = undef;
            my $itemArray = $items->toArray();
            my $size = scalar(@{$itemArray});
            for (my $index = 0; $index < $size; $index++) {
                $product = ("" . $itemArray->[$index]);
                $weightFloat = 'org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntity'->new()->getWeight($product);
                $weightFloat = $self->getNumberOf($product) * $weightFloat;
                $totalWeight->add(("" . ($weightFloat)));
            }
        }
        return $totalWeight->toString();
}


sub getNumberOfItems {
    my ($self) = @_;
        return $self->{items}->size();
}


sub getIds {
    my ($self) = @_;
        my $set = $self->{items}->keySet();
        return $set;
}


sub getItems {
    my ($self) = @_;
        return $self->{items};
}


sub getNumberOf {
    my ($self, $product) = @_;
        my $numStr = $self->{items}->get($product);
        return ("" . ($numStr));
}


# throws MoneyException
sub getSubTotal {
    my ($self) = @_;
        my $itemsAndNumberInBasket = $self->getItems();
        my $subTotal = 'org::allbinary::business::user::commerce::money::Money'->new();
        if ($itemsAndNumberInBasket->size() > 0) {
            my $items = $itemsAndNumberInBasket->keySet();
            my $inventoryEntityFactory = 'org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory'->getInstance();
            my $inventoryEntity = $inventoryEntityFactory->getInventoryEntityInstance();
            my $itemArray = $items->toArray();
            my $size = scalar(@{$itemArray});
            for (my $index = 0; $index < $size; $index++) {
                my $product = ("" . $itemArray->[$index]);
                my $itemInterface = $inventoryEntity->getItem($product);
                my $productTotal = $itemInterface->getPrice();
                $productTotal->multiply(int($self->getNumberOf($product)));
                $subTotal->add($productTotal->toString());
            }
        }
        return $subTotal;
}

# use java::io::Serializable;
use java::util::HashMap;
# use java::util::Set;
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::business::user::commerce::money::MoneyException;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntity;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::business::user::commerce::inventory::basket::BasketInterface;

1;

