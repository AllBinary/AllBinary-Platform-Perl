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
    $self->{request} = undef unless exists $self->{request};
    $self->{entryId} = undef unless exists $self->{entryId};
    $self->{orderId} = undef unless exists $self->{orderId};
    $self->{userName} = undef unless exists $self->{userName};
    $self->{storeName} = undef unless exists $self->{storeName};
    $self->{shipDate} = undef unless exists $self->{shipDate};
    $self->{orderDate} = undef unless exists $self->{orderDate};
    $self->{transDate} = undef unless exists $self->{transDate};
    $self->{cancelDate} = undef unless exists $self->{cancelDate};
    $self->{status} = undef unless exists $self->{status};
    $self->{paymentMethod} = undef unless exists $self->{paymentMethod};
    $self->{name} = undef unless exists $self->{name};
    $self->{type} = undef unless exists $self->{type};
    $self->{expiration} = undef unless exists $self->{expiration};
    $self->{number} = undef unless exists $self->{number};
    $self->{encryption} = undef unless exists $self->{encryption};
    $self->{billingName} = undef unless exists $self->{billingName};
    $self->{billingStreet} = undef unless exists $self->{billingStreet};
    $self->{billingCity} = undef unless exists $self->{billingCity};
    $self->{billingState} = undef unless exists $self->{billingState};
    $self->{billingCode} = undef unless exists $self->{billingCode};
    $self->{billingCountry} = undef unless exists $self->{billingCountry};
    $self->{shippingName} = undef unless exists $self->{shippingName};
    $self->{shippingStreet} = undef unless exists $self->{shippingStreet};
    $self->{shippingCity} = undef unless exists $self->{shippingCity};
    $self->{shippingState} = undef unless exists $self->{shippingState};
    $self->{shippingCode} = undef unless exists $self->{shippingCode};
    $self->{shippingCountry} = undef unless exists $self->{shippingCountry};
    $self->{shippingMethodName} = undef unless exists $self->{shippingMethodName};
    $self->{subTotal} = undef unless exists $self->{subTotal};
    $self->{shippingCost} = undef unless exists $self->{shippingCost};
    $self->{tax} = undef unless exists $self->{tax};
    $self->{total} = undef unless exists $self->{total};
    $self->{special} = undef unless exists $self->{special};
    $self->{userComment} = undef unless exists $self->{userComment};
    $self->{userCancelComment} = undef unless exists $self->{userCancelComment};
    $self->{storeComment} = undef unless exists $self->{storeComment};
    $self->{storeCancelComment} = undef unless exists $self->{storeCancelComment};
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
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
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "update()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to update order table";
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "update()", $e);
            }
            return $error;
        }
}

use java::lang::Object ();
use java::util::HashMap ();
# use javax::servlet::http::HttpServletRequest ();
# use javax::servlet::jsp::PageContext ();
use org::allbinary::business::context::modules::storefront::StoreFrontData ();
use org::allbinary::business::entry::EntryData ();
use org::allbinary::business::user::UserData ();
use org::allbinary::business::user::address::BillingAddressData ();
use org::allbinary::business::user::address::ShippingAddressData ();
use org::allbinary::business::user::commerce::inventory::order::OrderData ();
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData ();
use org::allbinary::business::user::commerce::money::payment::PaymentData ();
use org::allbinary::business::user::commerce::shipping::ShippingMethodData ();
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory ();
use org::allbinary::logic::StdUtil ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();
use admin::taghelpers::TagHelper ();

1;

