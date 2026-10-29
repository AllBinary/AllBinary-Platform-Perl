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

package org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
    $self->{tableName} = "basicinventory";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::InventoryDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->setTableName($self->{tableName});
    return $self;
}


sub insert {
    my ($self, $values) = @_;
        try {
            $self->SUPER::insert($values);
            if ($org::allbinary::data::tables::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{INSERT}, $e);
            }
        }
}


sub delete {
    my ($self, $value) = @_;
        try {
            $self->SUPER::deleteWhere($self->{basicItemData}->{ID}, $value);
            if ($org::allbinary::data::tables::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{commonStrings}->{delete});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{delete}, $e);
            }
        }
}


# throws Exception
sub getItems {
    my ($self, $storeFrontInterface) = @_;
        if ($org::allbinary::data::tables::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
            $self->{logUtil}->putF("Getting Items For: " . $storeFrontInterface->getName(), $self, "getItems");
        }
        my $itemVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $itemHashMapVector = $self->SUPER::getRows($keysAndValues);
        my $size = $itemHashMapVector->size();
        for (my $i = 0; $i < $size; $i++) {
            my $itemHashMap = $itemHashMapVector->get($i);
            if (defined($itemHashMap)) {
                my $category = $itemHashMap->get($self->{basicItemData}->{CATEGORY});
                if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($category) && (index($category, $storeFrontInterface->getCategoryPath()) == 0)) {
                    $itemVector->add('org::allbinary::business::user::commerce::inventory::item::BasicItem'->new($itemHashMap));
                }
            }
        }
        return $itemVector;
}


# throws MoneyException
sub getItem {
    my ($self, $id) = @_;
        my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $keysAndValues->put($self->{basicItemData}->{ID}, $id);
        my $itemHashMap = $self->SUPER::getRow($keysAndValues);
        if (defined($itemHashMap)) {
            return 'org::allbinary::business::user::commerce::inventory::item::BasicItem'->new($itemHashMap);
        } else {
            return undef;
        }
}


sub getWeight {
    my ($self, $id) = @_;
        return $self->SUPER::getField($self->{basicItemData}->{ID}, $id, $self->{basicItemData}->{WEIGHT});
}


sub createTableStatement {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE});
        $stringBuffer->append($self->{tableName});
        $stringBuffer->append($self->{sqlStrings}->{START});
        $stringBuffer->append($self->{basicItemData}->{ID});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{NUMBER});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{INBASKETS});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{WEIGHT});
        $stringBuffer->append(" VARCHAR(20) NOT NULL,");
        $stringBuffer->append('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE});
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
        $stringBuffer->append('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{PRICE});
        $stringBuffer->append(" VARCHAR(20) NOT NULL,");
        $stringBuffer->append($self->{basicItemData}->{COMMENT});
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{CUSTOMS});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{DOWNLOADS});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{GROUPS});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{OPTIONS});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{PERMISSIONS});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{basicItemData}->{SPECIALS});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{sqlStrings}->{PRIMARY_KEY});
        $stringBuffer->append($self->{basicItemData}->{ID});
        $stringBuffer->append($self->{sqlStrings}->{END});
        return $stringBuffer->toString();
}


sub createTable {
    my ($self) = @_;
        return $self->SUPER::createTable($self->createTableStatement());
}


sub update {
    my ($self, $updatedValues) = @_;
        $self->SUPER::updateWhere($self->{basicItemData}->{ID}, $updatedValues->get($self->{basicItemData}->{ID}), $updatedValues);
}


sub dropTable {
    my ($self) = @_;
        return $self->SUPER::dropTable();
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::InventoryDbInitInfo;
use org::allbinary::business::user::commerce::inventory::item::BasicItem;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use org::allbinary::business::user::commerce::money::MoneyException;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityInterface;

1;

