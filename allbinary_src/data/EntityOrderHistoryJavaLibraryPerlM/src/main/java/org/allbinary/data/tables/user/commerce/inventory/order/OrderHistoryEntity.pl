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

package org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = "orderhistory";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::HistoryDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->setTableName($self->{tableName});
    return $self;
}


sub insert {
    my ($self, $userName, $order) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        try {
            my $paymentInterface = 'org::allbinary::data::tables::user::commerce::money::payment::PaymentEntity'->new()->getDefault($userName);
            my $billingAddress = 'org::allbinary::data::tables::user::address::billing::BillingAddressesEntity'->new($userName)->getDefault();
            my $shippingAddress = 'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity'->new($userName)->getDefault();
            my $abeClientInformation = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
            my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($order->getStoreName());
            my $shippingInterface = 'org::allbinary::business::user::commerce::shipping::ShippingMethods'->new($abeClientInformation, $storeFrontInterface)->getShippingInterface($order->getShippingMethod());
            my $shippingCost = $shippingInterface->getCost($order);
            my $basketInterface = $order->getBasket();
            my $subTotal = $basketInterface->getSubTotal();
            my $taxRate = 'org::allbinary::business::user::commerce::money::tax::TaxFactory'->getInstance()->getInstance($abeClientInformation, $storeFrontInterface)->getTaxRate($shippingAddress, $storeFrontInterface);
            my $tax = 'org::allbinary::business::user::commerce::money::Money'->new();
            my $total = 'org::allbinary::business::user::commerce::money::Money'->new();
            $total->add($shippingCost->toString());
            $total->add($subTotal->toString());
            $tax->add($total->toString());
            $tax->multiply($taxRate);
            $total->add($tax->toString());
            my $empty = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            $vector->add('org::allbinary::data::generator::OrderHistoryIdGenerator'->new()->getNext());
            my $ZERO = 'org::allbinary::data::tables::TableDataFactory'->getInstance()->{ZERO_STRING};
            $vector->add($order->getId());
            $vector->add($userName);
            $vector->add($order->getStoreName());
            my $calendar = 'java::util::Calendar'->getInstance();
            my $time = ("" . $calendar->getTimeInMillis()->toString());
            $vector->add($ZERO);
            $vector->add($time);
            $vector->add($ZERO);
            $vector->add($ZERO);
            $vector->add($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PREPROCESSING);
            $vector->add($order->getPaymentMethod());
            if (defined($paymentInterface)) {
                $vector->add($paymentInterface->getName());
                $vector->add($paymentInterface->getType());
                $vector->add($paymentInterface->getExpiration());
                my $random = 'java::util::Random'->new()->nextInt($org::allbinary::logic::control::crypt::SuperCrypt::KEYMAX);
                $vector->add('org::allbinary::logic::control::crypt::SuperCrypt'->new($random)->encrypt($paymentInterface->getNumber()));
                $vector->add($random->toString());
            } else {
                $vector->add($empty);
                $vector->add($empty);
                $vector->add($empty);
                $vector->add($empty);
                $vector->add($ZERO);
            }
            if (defined($billingAddress)) {
                $vector->add($billingAddress->getName());
                $vector->add($billingAddress->getStreet());
                $vector->add($billingAddress->getCity());
                $vector->add($billingAddress->getState());
                $vector->add($billingAddress->getCode());
                $vector->add($billingAddress->getCountry());
            } else {
                $vector->add($empty);
                $vector->add($empty);
                $vector->add($empty);
                $vector->add($empty);
                $vector->add($empty);
                $vector->add($empty);
            }
            if (defined($shippingAddress)) {
                $vector->add($shippingAddress->getName());
                $vector->add($shippingAddress->getStreet());
                $vector->add($shippingAddress->getCity());
                $vector->add($shippingAddress->getState());
                $vector->add($shippingAddress->getCode());
                $vector->add($shippingAddress->getCountry());
            } else {
                $vector->add($empty);
                $vector->add($empty);
                $vector->add($empty);
                $vector->add($empty);
                $vector->add($empty);
                $vector->add($empty);
            }
            $vector->add($order->getShippingMethod());
            $vector->add($subTotal->toString());
            $vector->add($shippingCost->toString());
            $vector->add($tax->toString());
            $vector->add($total->toString());
            $vector->add($order->getSpecial());
            $vector->add($order->getUserComments());
            $vector->add($order->getUserCancelComments());
            $vector->add($order->getStoreComments());
            $vector->add($order->getStoreCancelComments());
            $self->insert($vector);
            if ($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put("Command Failed: " . $vector, $self, $self->{INSERT}, $e);
            }
        }
}


# Java overloaded method: Perl keeps the last definition
sub insert {
    my ($self, $values) = @_;
        try {
            $self->SUPER::insert($values);
            if ($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{INSERT}, $e);
            }
        }
}


sub setStatus {
    my ($self, $orderId, $status) = @_;
        try {
            my $calendar = 'java::util::Calendar'->getInstance();
            my $time = ("" . $calendar->getTimeInMillis()->toString());
            my $updateHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $updateHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS, $status);
            if (($status cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELLED) == 0) {
                $updateHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELDATE, $time);
            } elsif (($status cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPED) == 0) {
                $updateHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDDATE, $time);
            }
            $self->SUPER::updateWhere($org::allbinary::business::user::commerce::inventory::order::OrderData::ID, $orderId, $updateHashMap);
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "setStatus", $e);
            }
        }
}


sub setPaymentMethod {
    my ($self, $orderId, $paymentMethod) = @_;
        try {
            my $calendar = 'java::util::Calendar'->getInstance();
            my $time = ("" . $calendar->getTimeInMillis()->toString());
            my $updateHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $updateHashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::METHOD, $paymentMethod);
            $updateHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TRANSDATE, $time);
            $self->SUPER::updateWhere($org::allbinary::business::user::commerce::inventory::order::OrderData::ID, $orderId, $updateHashMap);
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "setPaymentMethod", $e);
            }
        }
}


# throws Exception
sub getStoreOrders {
    my ($self, $storeFrontInterface) = @_;
        my $orderReviewVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $whereHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $whereHashMap->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $storeFrontInterface->getName());
        my $orderHashMapVector = $self->SUPER::getRows($whereHashMap);
        my $size = $orderHashMapVector->size();
        for (my $i = 0; $i < $size; $i++) {
            my $orderReviewHashMap = $orderHashMapVector->get($i);
            my $orderReview = 'org::allbinary::business::user::commerce::inventory::order::OrderHistory'->new('org::allbinary::business::user::commerce::inventory::basket::Basket'->new(), $orderReviewHashMap);
            $orderReviewVector->add($orderReview);
        }
        return $orderReviewVector;
}


# throws Exception
sub getOrders {
    my ($self, $userName) = @_;
        my $orderReviewVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $whereHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $whereHashMap->put($org::allbinary::business::user::UserData::USERNAME, $userName);
        my $orderHashMapVector = $self->SUPER::getRows($whereHashMap);
        my $size = $orderHashMapVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $orderReviewHashMap = $orderHashMapVector->get($index);
            my $orderReview = 'org::allbinary::business::user::commerce::inventory::order::OrderHistory'->new('org::allbinary::business::user::commerce::inventory::basket::Basket'->new(), $orderReviewHashMap);
            $orderReviewVector->add($orderReview);
        }
        return $orderReviewVector;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getOrders {
    my ($self, $status, $fromDate, $toDate) = @_;
        my $orderReviewVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $whereHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $whereHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS, $status);
        my $orderHashMapVector = $self->SUPER::getRowsWhereBetween($whereHashMap, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::ORDERDATE, $fromDate, $toDate);
        my $size = $orderHashMapVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $orderReviewHashMap = $orderHashMapVector->get($index);
            my $orderReview = 'org::allbinary::business::user::commerce::inventory::order::OrderHistory'->new('org::allbinary::business::user::commerce::inventory::basket::Basket'->new(), $orderReviewHashMap);
            $orderReviewVector->add($orderReview);
        }
        return $orderReviewVector;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getOrders {
    my ($self, $fromDate, $toDate) = @_;
        my $orderReviewVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $orderHashMapVector = $self->SUPER::getRowsWhereBetween($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::ORDERDATE, $fromDate, $toDate);
        my $size = $orderHashMapVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $orderReviewHashMap = $orderHashMapVector->get($index);
            my $orderReview = 'org::allbinary::business::user::commerce::inventory::order::OrderHistory'->new('org::allbinary::business::user::commerce::inventory::basket::Basket'->new(), $orderReviewHashMap);
            $orderReviewVector->add($orderReview);
        }
        return $orderReviewVector;
}


# throws Exception
sub getOrder {
    my ($self, $id) = @_;
        my $whereHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $whereHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::ID, $id);
        my $orderReviewHashMap = $self->SUPER::getRow($whereHashMap);
        if (defined($orderReviewHashMap)) {
            my $orderHistory = 'org::allbinary::business::user::commerce::inventory::order::OrderHistory'->new('org::allbinary::business::user::commerce::inventory::basket::Basket'->new(), $orderReviewHashMap);
            return $orderHistory;
        } else {
            return undef;
        }
}


sub createTableStatement {
    my ($self) = @_;
        my $entryData = 'org::allbinary::business::entry::EntryData'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("CREATE TABLE ");
        $stringBuffer->append($self->{tableName});
        $stringBuffer->append(" (");
        $stringBuffer->append($entryData->{ID});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderData::ID);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::UserData::USERNAME);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDDATE);
        $stringBuffer->append(" BIGINT(19) UNSIGNED ,");
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::ORDERDATE);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TRANSDATE);
        $stringBuffer->append(" BIGINT(19) UNSIGNED ,");
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELDATE);
        $stringBuffer->append(" BIGINT(19) UNSIGNED ,");
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::PaymentData::METHOD);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::PaymentData::NAME);
        $stringBuffer->append(" VARCHAR(255) ,");
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::PaymentData::TYPE);
        $stringBuffer->append(" VARCHAR(255) ,");
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::PaymentData::EXPIRATION);
        $stringBuffer->append(" VARCHAR(255) ,");
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::PaymentData::NUMBER);
        $stringBuffer->append(" VARCHAR(255) ,");
        $stringBuffer->append($entryData->{ENCRYPTION});
        $stringBuffer->append(" BIGINT(19) UNSIGNED ,");
        $stringBuffer->append($org::allbinary::business::user::address::BillingAddressData::NAME);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::address::BillingAddressData::STREET);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::address::BillingAddressData::CITY);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::address::BillingAddressData::STATE);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::address::BillingAddressData::CODE);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::address::BillingAddressData::COUNTRY);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::address::ShippingAddressData::NAME);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::address::ShippingAddressData::STREET);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::address::ShippingAddressData::CITY);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::address::ShippingAddressData::STATE);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::address::ShippingAddressData::CODE);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::address::ShippingAddressData::COUNTRY);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::shipping::ShippingMethodData::NAME);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SUBTOTAL);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPINGCOST);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TAX);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TOTAL);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($entryData->{SPECIAL});
        $stringBuffer->append(" VARCHAR(255) ,");
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderData::CUSTOMERCOMMENT);
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderData::CUSTOMERCANCELCOMMENT);
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderData::STORECOMMENT);
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderData::STORECANCELCOMMENT);
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append("PRIMARY KEY(");
        $stringBuffer->append($entryData->{ID});
        $stringBuffer->append(") )");
        return $stringBuffer->toString();
}


sub createTable {
    my ($self) = @_;
        return $self->SUPER::createTable($self->createTableStatement());
}


sub dropTable {
    my ($self) = @_;
        return $self->SUPER::dropTable();
}


# throws Exception
sub update {
    my ($self, $whereHashMap, $orderHashMap) = @_;
        try {
            $self->updateWhere($whereHashMap, $orderHashMap);
        } catch ($e) {
            die $e;
        }
}

use java::util::Calendar;
use java::util::HashMap;
use java::util::Random;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::HistoryDbInitInfo;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::address::BillingAddressData;
use org::allbinary::business::user::address::ShippingAddressData;
use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::commerce::inventory::basket::Basket;
use org::allbinary::business::user::commerce::inventory::basket::BasketInterface;
use org::allbinary::business::user::commerce::inventory::order::Order;
use org::allbinary::business::user::commerce::inventory::order::OrderData;
use org::allbinary::business::user::commerce::inventory::order::OrderHistory;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::business::user::commerce::money::payment::PaymentData;
use org::allbinary::business::user::commerce::money::payment::PaymentInterface;
use org::allbinary::business::user::commerce::money::tax::TaxFactory;
use org::allbinary::business::user::commerce::shipping::ShippingMethodData;
use org::allbinary::business::user::commerce::shipping::ShippingMethods;
use org::allbinary::business::user::commerce::shipping::modules::ShippingInterface;
use org::allbinary::data::generator::OrderHistoryIdGenerator;
use org::allbinary::data::tables::TableDataFactory;
use org::allbinary::data::tables::user::address::billing::BillingAddressesEntity;
use org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity;
use org::allbinary::data::tables::user::commerce::money::payment::PaymentEntity;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::control::crypt::SuperCrypt;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityInterface;

1;

