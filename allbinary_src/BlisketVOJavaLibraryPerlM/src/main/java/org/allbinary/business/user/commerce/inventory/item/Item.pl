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

package org::allbinary::business::user::commerce::inventory::item::Item;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::inventory::item::BasicItem','org::allbinary::business::user::commerce::inventory::item::OrderItemInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{group} = undef;
    $self->{tax} = undef;
    $self->{shippingType} = undef;
    $self->{shippingCost} = undef;
    $self->{shippedDate} = undef;
    $self->{shippingAddress} = undef;
    $self->{special} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of Item takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $itemHashMap) = @_;
    my $self = $class->SUPER::new($itemHashMap);
    $self->_init_fields();
        # super(...) made $self above
        $self->setData($itemHashMap);
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $EMPTY = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        $self->{group} = $EMPTY;
        $self->{tax} = $EMPTY;
        $self->{shippingType} = $EMPTY;
        $self->{shippingCost} = $EMPTY;
        $self->{shippingAddress} = 'org::allbinary::business::user::address::StreetAddress'->new();
    return $self;
}


sub setData {
    my ($self, $itemHashMap) = @_;
        $self->{group} = $itemHashMap->get($org::allbinary::business::user::commerce::shipping::ShippingMethodData::GROUP);
        $self->{tax} = $itemHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TAX);
        $self->{shippingType} = $itemHashMap->get($org::allbinary::business::user::commerce::shipping::ShippingMethodData::NAME);
        $self->{shippingCost} = $itemHashMap->get($org::allbinary::business::user::commerce::shipping::ShippingMethodData::COST);
        $self->{shippedDate} = $itemHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDDATE);
        $itemHashMap->put($org::allbinary::business::user::address::StreetAddressData::NAME, $itemHashMap->get($org::allbinary::business::user::address::ShippingAddressData::NAME));
        $itemHashMap->put($org::allbinary::business::user::address::StreetAddressData::STREET, $itemHashMap->get($org::allbinary::business::user::address::ShippingAddressData::STREET));
        $itemHashMap->put($org::allbinary::business::user::address::StreetAddressData::CITY, $itemHashMap->get($org::allbinary::business::user::address::ShippingAddressData::CITY));
        $itemHashMap->put($org::allbinary::business::user::address::StreetAddressData::STATE, $itemHashMap->get($org::allbinary::business::user::address::ShippingAddressData::STATE));
        $itemHashMap->put($org::allbinary::business::user::address::StreetAddressData::CODE, $itemHashMap->get($org::allbinary::business::user::address::ShippingAddressData::CODE));
        $itemHashMap->put($org::allbinary::business::user::address::StreetAddressData::COUNTRY, $itemHashMap->get($org::allbinary::business::user::address::ShippingAddressData::COUNTRY));
        $self->{shippingAddress} = 'org::allbinary::business::user::address::StreetAddress'->new($itemHashMap);
}


sub setGroup {
    my ($self, $value) = @_;
        $self->{group} = $value;
}


sub setTax {
    my ($self, $value) = @_;
        $self->{tax} = $value;
}


sub setShippingType {
    my ($self, $value) = @_;
        $self->{shippingType} = $value;
}


sub setShippingCost {
    my ($self, $value) = @_;
        $self->{shippingCost} = $value;
}


sub setShippingAddress {
    my ($self, $value) = @_;
        $self->{shippingAddress} = $value;
}


sub setSpecial {
    my ($self, $value) = @_;
        $self->{special} = $value;
}


sub getGroup {
    my ($self) = @_;
        return $self->{group};
}


sub getTax {
    my ($self) = @_;
        return $self->{tax};
}


sub getShippingType {
    my ($self) = @_;
        return $self->{shippingType};
}


sub getShippingCost {
    my ($self) = @_;
        return $self->{shippingCost};
}


sub getShippingAddress {
    my ($self) = @_;
        return $self->{shippingAddress};
}


sub getSpecial {
    my ($self) = @_;
        return $self->{special};
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = $self->SUPER::toHashMap();
        $hashMap->put($org::allbinary::business::user::commerce::shipping::ShippingMethodData::GROUP, $self->{group});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TAX, $self->{tax});
        $hashMap->put($org::allbinary::business::user::commerce::shipping::ShippingMethodData::NAME, $self->{shippingType});
        $hashMap->put($org::allbinary::business::user::commerce::shipping::ShippingMethodData::COST, $self->{shippingCost});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDDATE, $self->{shippedDate});
        $hashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{SPECIAL}, $self->{special});
        return $hashMap;
}

use java::util::HashMap;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::address::ShippingAddressData;
use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::address::StreetAddressData;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::business::user::commerce::money::MoneyException;
use org::allbinary::business::user::commerce::shipping::ShippingMethodData;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::business::user::commerce::inventory::item::BasicItem;
use org::allbinary::business::user::commerce::inventory::item::OrderItemInterface;

1;

