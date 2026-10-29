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

package org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
    $self->{tableName} = "orderitems";
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
            my $basket = $order->getBasket();
            my $items = $basket->getIds();
            my $ZERO_STRING = 'org::allbinary::data::tables::TableDataFactory'->getInstance()->{ZERO_STRING};
            my $EMPTY_STRING = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            my $inventoryEntity = 'org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory'->getInstance()->getInventoryEntityInstance();
            my $itemsArray = $items->toArray();
            my $itemsSize = scalar(@{$itemsArray});
            for (my $i = 0; $i < $itemsSize; $i++) {
                my $item = $itemsArray->[$i];
                my $itemInterface = $inventoryEntity->getItem($item);
                $vector = 'org::allbinary::util::BasicArrayListD'->new();
                $vector->add('org::allbinary::data::generator::OrderItemIdGenerator'->new()->getNext());
                $vector->add($order->getId());
                $vector->add('org::allbinary::data::tables::TableDataFactory'->getInstance()->{INTEGER_MAX_VALUE_STRING});
                $vector->add($userName);
                $vector->add($order->getStoreName());
                $vector->add($itemInterface->getId());
                $vector->add($basket->getNumberOf($item)->toString());
                $vector->add($itemInterface->getNewOrUsed());
                $vector->add($itemInterface->getSummary());
                $vector->add($itemInterface->getDistributor());
                $vector->add($itemInterface->getIdUsedByDistributor());
                $vector->add($itemInterface->getProducedBy());
                $vector->add($itemInterface->getProductionDate());
                $vector->add($itemInterface->getStartProductionDate());
                $vector->add($itemInterface->getDescription());
                $vector->add($itemInterface->getKeywords());
                $vector->add($itemInterface->getCategory());
                $vector->add($itemInterface->getType());
                $vector->add($itemInterface->getSmallImage());
                $vector->add($itemInterface->getMediumImage());
                $vector->add($itemInterface->getLargeImage());
                $vector->add($itemInterface->getWeight());
                $vector->add($itemInterface->getPrice()->toString());
                $vector->add($itemInterface->getComment());
                $vector->add($itemInterface->getCustoms());
                $vector->add($itemInterface->getDownloads());
                $vector->add($EMPTY_STRING);
                $vector->add($EMPTY_STRING);
                $vector->add($EMPTY_STRING);
                $vector->add($EMPTY_STRING);
                $vector->add($EMPTY_STRING);
                $vector->add($EMPTY_STRING);
                $vector->add($EMPTY_STRING);
                $vector->add($EMPTY_STRING);
                $vector->add($EMPTY_STRING);
                $vector->add($EMPTY_STRING);
                $vector->add($EMPTY_STRING);
                $vector->add($EMPTY_STRING);
                $vector->add($EMPTY_STRING);
                $vector->add($ZERO_STRING);
                $vector->add($ZERO_STRING);
                $vector->add($ZERO_STRING);
                $vector->add($ZERO_STRING);
                $self->insert($vector);
            }
            if ($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF("Command Success Added: " . $items->size(), $self, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put("Command Failed: " . $vector->toString(), $self, $self->{INSERT}, $e);
            }
        }
}


sub setStatus {
    my ($self, $orderId, $groupId, $status) = @_;
        try {
            my $whereHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $updateHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $whereHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::ID, $orderId);
            $whereHashMap->put($org::allbinary::business::user::commerce::shipping::ShippingMethodData::GROUP, $groupId);
            $updateHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS, $status);
            $self->SUPER::updateWhere($whereHashMap, $updateHashMap);
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "setStatus", $e);
            }
        }
}


sub isEverythingShipped {
    my ($self, $orderId) = @_;
        try {
            my $itemStatusVector = $self->SUPER::getColumnWhere($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS, $org::allbinary::business::user::commerce::inventory::order::OrderData::ID, $orderId);
            my $size = $itemStatusVector->size();
            for (my $index = 0; $index < $size; $index++) {
                my $status = $itemStatusVector->get($index);
                if (($status cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPED) != 0) {
                    return 0;
                }
            }
            return 1;
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "isEverythingShipped", $e);
            }
            return 0;
        }
}


sub getBasketReview {
    my ($self, $orderId) = @_;
        try {
            my $basketReview = 'org::allbinary::business::user::commerce::inventory::basket::BasketReview'->new();
            my $keyValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $keyValues->put($org::allbinary::business::user::commerce::inventory::order::OrderData::ID, $orderId);
            my $items = $self->SUPER::getRows($keyValues);
            my $entryData = 'org::allbinary::business::entry::EntryData'->getInstance();
            if (defined($items) && $items->size() > 0) {
                my $EMPTY_STRING = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
                my $itemsArray = $items->toArray();
                my $itemsSize = scalar(@{$itemsArray});
                for (my $i = 0; $i < $itemsSize; $i++) {
                    my $itemHashMap = $itemsArray->[$i];
                    $itemHashMap->put($self->{basicItemData}->{INBASKETS}, $EMPTY_STRING);
                    $itemHashMap->put($entryData->{ENABLE}, $EMPTY_STRING);
                    $itemHashMap->put($entryData->{TIMECREATED}, $EMPTY_STRING);
                    $itemHashMap->put($entryData->{LASTMODIFIED}, $EMPTY_STRING);
                    $itemHashMap->put($self->{basicItemData}->{GROUPS}, $EMPTY_STRING);
                    $itemHashMap->put($self->{basicItemData}->{OPTIONS}, $EMPTY_STRING);
                    $itemHashMap->put($self->{basicItemData}->{PERMISSIONS}, $EMPTY_STRING);
                    $itemHashMap->put($self->{basicItemData}->{SPECIALS}, $EMPTY_STRING);
                    my $item = 'org::allbinary::business::user::commerce::inventory::item::Item'->new($itemHashMap);
                    $basketReview->addItem($item);
                }
                return $basketReview;
            } else {
                return undef;
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "getBasketReview", $e);
            }
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
        $stringBuffer->append($org::allbinary::business::user::commerce::shipping::ShippingMethodData::GROUP);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::UserData::USERNAME);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{ID});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{NUMBER});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{NEWORUSED});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{SUMMARY});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{DISTRIBUTOR});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{IDUSEDBYDISTRIBUTOR});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{PRODUCEDBY});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{PRODUCTIONDATE});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{STARTPRODUCTIONDATE});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{DESCRIPTION});
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{KEYWORDS});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{CATEGORY});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{TYPE});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{SMALLIMAGE});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{MEDIUMIMAGE});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{LARGEIMAGE});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{WEIGHT});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{PRICE});
        $stringBuffer->append(" VARCHAR(20) NOT NULL,");
        $stringBuffer->append($self->{basicItemData}->{COMMENT});
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{CUSTOMS});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{DOWNLOADS});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::shipping::ShippingMethodData::COST);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TAX);
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
        $stringBuffer->append($entryData->{SPECIAL});
        $stringBuffer->append(" VARCHAR(255) ,");
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELINFO);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELTYPE);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDDATE);
        $stringBuffer->append(" BIGINT(19) UNSIGNED ,");
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::ORDERDATE);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TRANSDATE);
        $stringBuffer->append(" BIGINT(19) UNSIGNED ,");
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELDATE);
        $stringBuffer->append(" BIGINT(19) UNSIGNED ,");
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

use java::util::HashMap;
# use java::util::ListIterator;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::HistoryDbInitInfo;
use org::allbinary::logic::StdUtil;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::address::ShippingAddressData;
use org::allbinary::business::user::commerce::inventory::basket::BasketInterface;
use org::allbinary::business::user::commerce::inventory::basket::BasketReview;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::business::user::commerce::inventory::item::Item;
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use org::allbinary::business::user::commerce::inventory::order::OrderData;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::business::user::commerce::inventory::order::OrderInterface;
use org::allbinary::business::user::commerce::shipping::ShippingMethodData;
use org::allbinary::data::generator::OrderItemIdGenerator;
use org::allbinary::data::tables::TableDataFactory;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntity;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntityInterface;

1;

