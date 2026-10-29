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

package org::allbinary::business::user::commerce::inventory::order::OrderHistory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::inventory::order::Order','org::allbinary::business::user::commerce::inventory::order::OrderHistoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{userName} = undef;
    $self->{shippingAddress} = undef;
    $self->{billingAddress} = undef;
    $self->{payment} = undef;
    $self->{shipDate} = undef;
    $self->{orderDate} = undef;
    $self->{transDate} = undef;
    $self->{cancelDate} = undef;
    $self->{status} = undef;
    $self->{subTotal} = undef;
    $self->{shippingCost} = undef;
    $self->{taxes} = undef;
    $self->{total} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of OrderHistory takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $basketInterface) = @_;
    my $self = $class->SUPER::new($basketInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub _new2 {
    my ($class, $basketInterface, $orderHistory) = @_;
    my $self = $class->SUPER::new($orderHistory->getStoreName(), $basketInterface, $orderHistory->getId(), $orderHistory->getShippingMethod(), $orderHistory->getSpecial(), $orderHistory->getPaymentMethod());
    $self->_init_fields();
        # super(...) made $self above
        $self->{userName} = $orderHistory->getUserName();
        $self->{shippingAddress} = $orderHistory->getShippingAddress();
        $self->{billingAddress} = $orderHistory->getBillingAddress();
        $self->{payment} = $orderHistory->getPaymentInfo();
        $self->{shipDate} = $orderHistory->getShipDate();
        $self->{orderDate} = $orderHistory->getOrderDate();
        $self->{transDate} = $orderHistory->getTransDate();
        $self->{cancelDate} = $orderHistory->getCancelDate();
        $self->{status} = $orderHistory->getStatus();
        $self->{subTotal} = $orderHistory->getSubTotal();
        $self->{shippingCost} = $orderHistory->getShippingCost();
        $self->{taxes} = $orderHistory->getTaxes();
        $self->{total} = $orderHistory->getTotal();
        $self->SUPER::setUserComments($orderHistory->getUserComments());
        $self->SUPER::setUserCancelComments($orderHistory->getUserCancelComments());
        $self->SUPER::setStoreComments($orderHistory->getStoreComments());
        $self->SUPER::setStoreCancelComments($orderHistory->getStoreCancelComments());
    return $self;
}


sub _new2 {
    my ($class, $basketInterface, $orderHistoryHashMap) = @_;
    my $self = $class->SUPER::new($orderHistoryHashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}), $basketInterface, $orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderData::ID), $orderHistoryHashMap->get($org::allbinary::business::user::commerce::shipping::ShippingMethodData::NAME), $orderHistoryHashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{SPECIAL}), $orderHistoryHashMap->get($org::allbinary::business::user::commerce::money::payment::PaymentData::METHOD));
    $self->_init_fields();
        # super(...) made $self above
        $self->{shippingAddress} = 'org::allbinary::business::user::address::StreetAddress'->new($orderHistoryHashMap->get($org::allbinary::business::user::address::ShippingAddressData::NAME), $orderHistoryHashMap->get($org::allbinary::business::user::address::ShippingAddressData::STREET), $orderHistoryHashMap->get($org::allbinary::business::user::address::ShippingAddressData::CITY), $orderHistoryHashMap->get($org::allbinary::business::user::address::ShippingAddressData::STATE), $orderHistoryHashMap->get($org::allbinary::business::user::address::ShippingAddressData::CODE), $orderHistoryHashMap->get($org::allbinary::business::user::address::ShippingAddressData::COUNTRY));
        $self->{billingAddress} = 'org::allbinary::business::user::address::StreetAddress'->new($orderHistoryHashMap->get($org::allbinary::business::user::address::BillingAddressData::NAME), $orderHistoryHashMap->get($org::allbinary::business::user::address::BillingAddressData::STREET), $orderHistoryHashMap->get($org::allbinary::business::user::address::BillingAddressData::CITY), $orderHistoryHashMap->get($org::allbinary::business::user::address::BillingAddressData::STATE), $orderHistoryHashMap->get($org::allbinary::business::user::address::BillingAddressData::CODE), $orderHistoryHashMap->get($org::allbinary::business::user::address::BillingAddressData::COUNTRY));
        $self->{payment} = 'org::allbinary::business::user::commerce::money::payment::Payment'->new($orderHistoryHashMap);
        $self->{userName} = $orderHistoryHashMap->get($org::allbinary::business::user::UserData::USERNAME);
        $self->{orderDate} = $orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::ORDERDATE);
        $self->{shipDate} = $orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDDATE);
        $self->{transDate} = $orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TRANSDATE);
        $self->{cancelDate} = $orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELDATE);
        $self->{status} = $orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS);
        $self->{subTotal} = 'org::allbinary::business::user::commerce::money::Money'->new($orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SUBTOTAL));
        $self->{total} = 'org::allbinary::business::user::commerce::money::Money'->new($orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TOTAL));
        $self->{shippingCost} = 'org::allbinary::business::user::commerce::money::Money'->new($orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPINGCOST));
        $self->{taxes} = 'org::allbinary::business::user::commerce::money::Money'->new($orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TAX));
        $self->SUPER::setUserComments($orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderData::CUSTOMERCOMMENT));
        $self->SUPER::setUserCancelComments($orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderData::CUSTOMERCANCELCOMMENT));
        $self->SUPER::setStoreComments($orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderData::STORECOMMENT));
        $self->SUPER::setStoreCancelComments($orderHistoryHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderData::STORECANCELCOMMENT));
    return $self;
}


sub setUserName {
    my ($self, $value) = @_;
        $self->{userName} = $value;
}


sub setDefaultShippingAddress {
    my ($self, $shippingAddress) = @_;
        $self->{shippingAddress} = $shippingAddress;
}


sub setBillingAddress {
    my ($self, $billingAddress) = @_;
        $self->{billingAddress} = $billingAddress;
}


sub setPaymentInfo {
    my ($self, $payment) = @_;
        $self->{payment} = $payment;
}


sub setShipDate {
    my ($self, $value) = @_;
        $self->{shipDate} = $value;
}


sub setOrderDate {
    my ($self, $value) = @_;
        $self->{orderDate} = $value;
}


sub setTransDate {
    my ($self, $value) = @_;
        $self->{transDate} = $value;
}


sub setCancelDate {
    my ($self, $value) = @_;
        $self->{cancelDate} = $value;
}


sub setStatus {
    my ($self, $value) = @_;
        $self->{status} = $value;
}


sub setSubTotal {
    my ($self, $value) = @_;
        $self->{subTotal} = $value;
}


sub setShippingCost {
    my ($self, $value) = @_;
        $self->{shippingCost} = $value;
}


sub setTaxes {
    my ($self, $value) = @_;
        $self->{taxes} = $value;
}


sub setTotal {
    my ($self, $value) = @_;
        $self->{total} = $value;
}


sub getUserName {
    my ($self) = @_;
        return $self->{userName};
}


sub getShippingAddress {
    my ($self) = @_;
        return $self->{shippingAddress};
}


sub getBillingAddress {
    my ($self) = @_;
        return $self->{billingAddress};
}


sub getPaymentInfo {
    my ($self) = @_;
        return $self->{payment};
}


sub getShipDate {
    my ($self) = @_;
        return $self->{shipDate};
}


sub getOrderDate {
    my ($self) = @_;
        return $self->{orderDate};
}


sub getTransDate {
    my ($self) = @_;
        return $self->{transDate};
}


sub getCancelDate {
    my ($self) = @_;
        return $self->{cancelDate};
}


sub getStatus {
    my ($self) = @_;
        return $self->{status};
}


sub getSubTotal {
    my ($self) = @_;
        return $self->{subTotal};
}


sub getShippingCost {
    my ($self) = @_;
        return $self->{shippingCost};
}


sub getTaxes {
    my ($self) = @_;
        return $self->{taxes};
}


sub getTotal {
    my ($self) = @_;
        return $self->{total};
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::business::user::UserData::USERNAME, $self->{userName});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::ORDERDATE, $self->{orderDate});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDDATE, $self->{shipDate});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TRANSDATE, $self->{transDate});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELDATE, $self->{cancelDate});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::ORDERDATEFORMATTED, 'java::util::Date'->new(int($self->{orderDate}))->toString());
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDDATEFORMATTED, 'java::util::Date'->new(int($self->{shipDate}))->toString());
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TRANSDATEFORMATTED, 'java::util::Date'->new(int($self->{transDate}))->toString());
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELDATEFORMATTED, 'java::util::Date'->new(int($self->{cancelDate}))->toString());
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS, $self->{status});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SUBTOTAL, $self->{subTotal}->toString());
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TOTAL, $self->{total}->toString());
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPINGCOST, $self->{shippingCost}->toString());
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TAX, $self->{taxes}->toString());
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $hashMap = $self->toHashMap();
        my $keySet = $hashMap->keySet();
        my $keyArray = $keySet->toArray();
        my $size = scalar(@{$keyArray});
        my $node = $document->createElement($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::ORDERHISTORY);
        $node->appendChild($self->SUPER::toXmlNode($document));
        my $billingAddressNode = $document->createElement($org::allbinary::business::user::address::BillingAddressData::BILLINGADDRESS);
        $billingAddressNode->appendChild($self->{billingAddress}->toXmlNode($document));
        my $shippingAddressNode = $document->createElement($org::allbinary::business::user::address::ShippingAddressData::SHIPPINGADDRESS);
        $shippingAddressNode->appendChild($self->{shippingAddress}->toXmlNode($document));
        $node->appendChild($billingAddressNode);
        $node->appendChild($shippingAddressNode);
        $node->appendChild($self->{payment}->toXmlNode($document));
        for (my $i = 0; $i < $size; $i++) {
            my $name = $keyArray->[$i];
            my $value = $hashMap->get($name);
            $value = 'org::allbinary::logic::string::StringUtil'->getInstance()->getNonNull($value);
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $name, $value));
        }
        return $node;
}

use java::util::Date;
use java::util::HashMap;
# use java::util::Set;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::address::BillingAddressData;
use org::allbinary::business::user::address::ShippingAddressData;
use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::commerce::inventory::basket::BasketInterface;
use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::business::user::commerce::money::MoneyException;
use org::allbinary::business::user::commerce::money::payment::Payment;
use org::allbinary::business::user::commerce::money::payment::PaymentData;
use org::allbinary::business::user::commerce::shipping::ShippingMethodData;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::user::commerce::inventory::order::Order;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryInterface;
use org::allbinary::business::user::commerce::inventory::order::OrderData;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;

1;

