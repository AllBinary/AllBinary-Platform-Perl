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

package admin::taghelpers::UpdateOrderHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelper';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{request} = undef;
    $self->{entryId} = undef;
    $self->{orderId} = undef;
    $self->{userName} = undef;
    $self->{storeName} = undef;
    $self->{shipDate} = undef;
    $self->{orderDate} = undef;
    $self->{transDate} = undef;
    $self->{cancelDate} = undef;
    $self->{status} = undef;
    $self->{paymentMethod} = undef;
    $self->{name} = undef;
    $self->{type} = undef;
    $self->{expiration} = undef;
    $self->{number} = undef;
    $self->{encryption} = undef;
    $self->{billingName} = undef;
    $self->{billingStreet} = undef;
    $self->{billingCity} = undef;
    $self->{billingState} = undef;
    $self->{billingCode} = undef;
    $self->{billingCountry} = undef;
    $self->{shippingName} = undef;
    $self->{shippingStreet} = undef;
    $self->{shippingCity} = undef;
    $self->{shippingState} = undef;
    $self->{shippingCode} = undef;
    $self->{shippingCountry} = undef;
    $self->{shippingMethodName} = undef;
    $self->{subTotal} = undef;
    $self->{shippingCost} = undef;
    $self->{tax} = undef;
    $self->{total} = undef;
    $self->{special} = undef;
    $self->{userComment} = undef;
    $self->{userCancelComment} = undef;
    $self->{storeComment} = undef;
    $self->{storeCancelComment} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{request} = $pageContext->getRequest();
        $self->getFormData();
    return $self;
}


sub getFormData {
    my ($self) = @_;
        $self->{entryId} = $self->{request}->getParameter('org::allbinary::business::entry::EntryData'->getInstance()->{ID});
        $self->{orderId} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderData::ID);
        $self->{userName} = $self->{request}->getParameter($org::allbinary::business::user::UserData::USERNAME);
        $self->{storeName} = $self->{request}->getParameter('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        $self->{shipDate} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDDATE);
        $self->{orderDate} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::ORDERDATE);
        $self->{transDate} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TRANSDATE);
        $self->{cancelDate} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELDATE);
        $self->{status} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS);
        $self->{paymentMethod} = $self->{request}->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::METHOD);
        $self->{name} = $self->{request}->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::NAME);
        $self->{type} = $self->{request}->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::TYPE);
        $self->{expiration} = $self->{request}->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::EXPIRATION);
        $self->{number} = $self->{request}->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::NUMBER);
        $self->{encryption} = $self->{request}->getParameter('org::allbinary::business::entry::EntryData'->getInstance()->{ENCRYPTION});
        $self->{billingName} = $self->{request}->getParameter($org::allbinary::business::user::address::BillingAddressData::NAME);
        $self->{billingStreet} = $self->{request}->getParameter($org::allbinary::business::user::address::BillingAddressData::STREET);
        $self->{billingCity} = $self->{request}->getParameter($org::allbinary::business::user::address::BillingAddressData::CITY);
        $self->{billingState} = $self->{request}->getParameter($org::allbinary::business::user::address::BillingAddressData::STATE);
        $self->{billingCode} = $self->{request}->getParameter($org::allbinary::business::user::address::BillingAddressData::CODE);
        $self->{billingCountry} = $self->{request}->getParameter($org::allbinary::business::user::address::BillingAddressData::COUNTRY);
        $self->{shippingName} = $self->{request}->getParameter($org::allbinary::business::user::address::ShippingAddressData::NAME);
        $self->{shippingStreet} = $self->{request}->getParameter($org::allbinary::business::user::address::ShippingAddressData::STREET);
        $self->{shippingCity} = $self->{request}->getParameter($org::allbinary::business::user::address::ShippingAddressData::CITY);
        $self->{shippingState} = $self->{request}->getParameter($org::allbinary::business::user::address::ShippingAddressData::STATE);
        $self->{shippingCode} = $self->{request}->getParameter($org::allbinary::business::user::address::ShippingAddressData::CODE);
        $self->{shippingCountry} = $self->{request}->getParameter($org::allbinary::business::user::address::ShippingAddressData::COUNTRY);
        $self->{shippingMethodName} = $self->{request}->getParameter($org::allbinary::business::user::commerce::shipping::ShippingMethodData::NAME);
        $self->{subTotal} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SUBTOTAL);
        $self->{shippingCost} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPINGCOST);
        $self->{tax} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TAX);
        $self->{total} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TOTAL);
        $self->{special} = $self->{request}->getParameter('org::allbinary::business::entry::EntryData'->getInstance()->{SPECIAL});
        $self->{userComment} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderData::CUSTOMERCOMMENT);
        $self->{userCancelComment} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderData::CUSTOMERCANCELCOMMENT);
        $self->{storeComment} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderData::STORECOMMENT);
        $self->{storeCancelComment} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderData::STORECANCELCOMMENT);
}


sub update {
    my ($self) = @_;
        try {
            my $success = "Successful update";
            my $orderHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $whereHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $orderHashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{ID}, $self->{entryId});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::ID, $self->{orderId});
            $orderHashMap->put($org::allbinary::business::user::UserData::USERNAME, $self->{userName});
            $orderHashMap->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $self->{storeName});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDDATE, $self->{shipDate});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::ORDERDATE, $self->{orderDate});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TRANSDATE, $self->{transDate});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELDATE, $self->{cancelDate});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS, $self->{status});
            $orderHashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::METHOD, $self->{paymentMethod});
            $orderHashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::NAME, $self->{name});
            $orderHashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::TYPE, $self->{type});
            $orderHashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::EXPIRATION, $self->{expiration});
            $orderHashMap->put($org::allbinary::business::user::address::BillingAddressData::NAME, $self->{billingName});
            $orderHashMap->put($org::allbinary::business::user::address::BillingAddressData::STREET, $self->{billingStreet});
            $orderHashMap->put($org::allbinary::business::user::address::BillingAddressData::CITY, $self->{billingCity});
            $orderHashMap->put($org::allbinary::business::user::address::BillingAddressData::STATE, $self->{billingState});
            $orderHashMap->put($org::allbinary::business::user::address::BillingAddressData::CODE, $self->{billingCode});
            $orderHashMap->put($org::allbinary::business::user::address::BillingAddressData::COUNTRY, $self->{billingCountry});
            $orderHashMap->put($org::allbinary::business::user::address::ShippingAddressData::NAME, $self->{shippingName});
            $orderHashMap->put($org::allbinary::business::user::address::ShippingAddressData::STREET, $self->{shippingStreet});
            $orderHashMap->put($org::allbinary::business::user::address::ShippingAddressData::CITY, $self->{shippingCity});
            $orderHashMap->put($org::allbinary::business::user::address::ShippingAddressData::STATE, $self->{shippingState});
            $orderHashMap->put($org::allbinary::business::user::address::ShippingAddressData::CODE, $self->{shippingCode});
            $orderHashMap->put($org::allbinary::business::user::address::ShippingAddressData::COUNTRY, $self->{shippingCountry});
            $orderHashMap->put($org::allbinary::business::user::commerce::shipping::ShippingMethodData::NAME, $self->{shippingMethodName});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SUBTOTAL, $self->{subTotal});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPINGCOST, $self->{shippingCost});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TAX, $self->{tax});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TOTAL, $self->{total});
            $orderHashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{SPECIAL}, $self->{special});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::CUSTOMERCOMMENT, $self->{userComment});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::CUSTOMERCANCELCOMMENT, $self->{userCancelComment});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::STORECOMMENT, $self->{storeComment});
            $orderHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::STORECANCELCOMMENT, $self->{storeCancelComment});
            $whereHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::ID, $self->{orderId});
            'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory'->getInstance()->update($whereHashMap, $orderHashMap);
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "update()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to update order table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "update()", $e);
            }
            return $error;
        }
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::address::BillingAddressData;
use org::allbinary::business::user::address::ShippingAddressData;
use org::allbinary::business::user::commerce::inventory::order::OrderData;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::business::user::commerce::money::payment::PaymentData;
use org::allbinary::business::user::commerce::shipping::ShippingMethodData;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use admin::taghelpers::TagHelper;

1;

