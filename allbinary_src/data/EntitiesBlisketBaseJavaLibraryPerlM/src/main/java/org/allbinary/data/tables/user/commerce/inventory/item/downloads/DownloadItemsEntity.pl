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

package org::allbinary::data::tables::user::commerce::inventory::item::downloads::DownloadItemsEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::user::commerce::inventory::item::downloads::DownloadItemsEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
    $self->{tableName} = "downloaditems";
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
            if ($org::allbinary::data::tables::user::commerce::inventory::item::downloads::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::downloads::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::item::downloads::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::downloads::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{INSERT}, $e);
            }
        }
}


sub delete {
    my ($self, $value) = @_;
        try {
            $self->SUPER::deleteWhere($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::ID, $value);
            if ($org::allbinary::data::tables::user::commerce::inventory::item::downloads::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::downloads::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{commonStrings}->{delete});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::item::downloads::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::downloads::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{delete}, $e);
            }
        }
}


sub update {
    my ($self, $updatedValues) = @_;
        $self->SUPER::updateWhere($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::ID, $updatedValues->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::ID), $updatedValues);
}


sub getForItem {
    my ($self, $id) = @_;
        my $returnVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $keysAndValues->put($self->{basicItemData}->{ID}, $id);
        my $vector = $self->SUPER::getRows($keysAndValues);
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $hashMap = $vector->get($index);
            $returnVector->add('org::allbinary::business::user::commerce::inventory::item::download::DownloadableItem'->new($hashMap));
        }
        if ($org::allbinary::data::tables::user::commerce::inventory::item::downloads::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::downloads::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
            $self->{logUtil}->putF("Found: " . $size, $self, "getForItem");
        }
        return $returnVector;
}


# Java overloaded method: Perl keeps the last definition
sub getForItem {
    my ($self, $id, $downloadItemId) = @_;
        my $returnVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $keysAndValues->put($self->{basicItemData}->{ID}, $id);
        $keysAndValues->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::ID, $downloadItemId);
        my $vector = $self->SUPER::getRows($keysAndValues);
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $hashMap = $vector->get($index);
            $returnVector->add('org::allbinary::business::user::commerce::inventory::item::download::DownloadableItem'->new($hashMap));
        }
        if ($org::allbinary::data::tables::user::commerce::inventory::item::downloads::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::downloads::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
            $self->{logUtil}->putF("Found: " . $size, $self, "getForItem");
        }
        return $returnVector;
}


sub createTableStatement {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE})->append($self->{tableName})->append($self->{sqlStrings}->{START})->append($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::ID)->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{basicItemData}->{ID})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::SPECIAL_NAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VERSION)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::CHANGES)->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL})->append($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::SYSTEM)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::PLATFORM)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::LICENSE_FILE)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::FILE)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::SIZE)->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME)->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::RETRIES)->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{sqlStrings}->{PRIMARY_KEY})->append($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::ID)->append($self->{sqlStrings}->{END});
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
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::InventoryDbInitInfo;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData;
use org::allbinary::business::user::commerce::inventory::item::download::DownloadableItem;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::data::tables::user::commerce::inventory::item::downloads::DownloadItemsEntityInterface;

1;

