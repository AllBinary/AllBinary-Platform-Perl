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

package org::allbinary::business::user::commerce::inventory::order::Order;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::inventory::order::OrderInterface','java::io::Serializable';


sub _init_fields {
    my ($self) = @_;
    $self->{basket} = undef;
    $self->{paymentMethod} = undef;
    $self->{shippingType} = undef;
    $self->{storeName} = undef;
    $self->{special} = undef;
    $self->{id} = undef;
    $self->{userComment} = undef;
    $self->{userCancelComment} = undef;
    $self->{storeComment} = undef;
    $self->{storeCancelComment} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new6(@arguments) if scalar(@arguments) == 6;
    die "No constructor of Order takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $basket) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{basket} = $basket;
        $self->{id} = undef;
        $self->{shippingType} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    return $self;
}


sub _new6 {
    my ($class, $storeName, $basket, $id, $shippingType, $special, $paymentMethod) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{storeName} = $storeName;
        $self->{basket} = $basket;
        $self->{id} = $id;
        $self->{shippingType} = $shippingType;
        $self->{special} = $special;
        $self->{paymentMethod} = $paymentMethod;
    return $self;
}


sub isIdValid {
    my ($self) = @_;
        if (!defined($self->getId()) || $self->getId()->compareTo('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}) == 0 || $self->getId()->length() > $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::MAXIDLEN || !'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isNumber($self->getId())) {
            return 0;
        }
        return 1;
}


sub isValid {
    my ($self) = @_;
        return 1;
}


sub getIdValidationInfo {
    my ($self) = @_;
        my $EMPTY_STRING = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        if (!defined($self->getId()) || $self->getId()->compareTo($EMPTY_STRING) == 0 || $self->getId()->length() > $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::MAXIDLEN || !'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isNumber($self->getId())) {
            return "Please enter a valid order Id < " . $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::MAXIDLEN . " digits in length.<br>";
        }
        return $EMPTY_STRING;
}


sub setShippingMethod {
    my ($self, $shippingType) = @_;
        $self->{shippingType} = $shippingType;
}


sub setPaymentMethod {
    my ($self, $value) = @_;
        $self->{paymentMethod} = $value;
}


sub setSpecial {
    my ($self, $special) = @_;
        $self->{special} = $special;
}


sub setId {
    my ($self, $value) = @_;
        $self->{id} = $value;
}


sub setStoreName {
    my ($self, $value) = @_;
        $self->{storeName} = $value;
}


sub setUserComments {
    my ($self, $value) = @_;
        $self->{userComment} = $value;
}


sub setUserCancelComments {
    my ($self, $value) = @_;
        $self->{userCancelComment} = $value;
}


sub setStoreComments {
    my ($self, $value) = @_;
        $self->{storeComment} = $value;
}


sub setStoreCancelComments {
    my ($self, $value) = @_;
        $self->{storeCancelComment} = $value;
}


sub getBasket {
    my ($self) = @_;
        return $self->{basket};
}


sub getShippingMethod {
    my ($self) = @_;
        return $self->{shippingType};
}


sub getPaymentMethod {
    my ($self) = @_;
        return $self->{paymentMethod};
}


sub getSpecial {
    my ($self) = @_;
        return $self->{special};
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}


sub getStoreName {
    my ($self) = @_;
        return $self->{storeName};
}


sub getUserComments {
    my ($self) = @_;
        return $self->{userComment};
}


sub getUserCancelComments {
    my ($self) = @_;
        return $self->{userCancelComment};
}


sub getStoreComments {
    my ($self) = @_;
        return $self->{storeComment};
}


sub getStoreCancelComments {
    my ($self) = @_;
        return $self->{storeCancelComment};
}


sub reviewOrder {
    my ($self, $paymentMethod) = @_;
        return "Create your own Order.reviewOrder";
}


sub viewOrder {
    my ($self, $paymentMethod) = @_;
        return "Create your own Order.viewOrder";
}


sub emailOrder {
    my ($self, $userName, $paymentMethod, $storeFrontInterface) = @_;
        return "Create your own Order.emailOrder";
}


sub toHashMapOrder {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::METHOD, $self->{paymentMethod});
        $hashMap->put($org::allbinary::business::user::commerce::shipping::ShippingMethodData::NAME, $self->{shippingType});
        $hashMap->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $self->{storeName});
        $hashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{SPECIAL}, $self->{special});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::ID, $self->{id});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::CUSTOMERCOMMENT, $self->{userComment});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::CUSTOMERCANCELCOMMENT, $self->{userCancelComment});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::STORECOMMENT, $self->{storeComment});
        $hashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::STORECANCELCOMMENT, $self->{storeCancelComment});
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $hashMap = $self->toHashMapOrder();
        my $keySet = $hashMap->keySet();
        my $keyArray = $keySet->toArray();
        my $size = scalar(@{$keyArray});
        my $node = $document->createElement($org::allbinary::business::user::commerce::inventory::order::OrderData::ORDER);
        for (my $i = 0; $i < $size; $i++) {
            my $name = $keyArray->[$i];
            my $value = $hashMap->get($name);
            $value = 'org::allbinary::logic::string::StringUtil'->getInstance()->getNonNull($value);
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $name, $value));
        }
        return $node;
}

# use java::io::Serializable;
use java::util::HashMap;
# use java::util::Set;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::commerce::inventory::basket::BasketInterface;
use org::allbinary::business::user::commerce::money::payment::PaymentData;
use org::allbinary::business::user::commerce::shipping::ShippingMethodData;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::user::commerce::inventory::order::OrderInterface;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::business::user::commerce::inventory::order::OrderData;

1;

