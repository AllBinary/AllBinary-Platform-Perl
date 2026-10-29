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

package org::allbinary::data::tables::user::commerce::inventory::item::special::SpecialItemsEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::user::commerce::inventory::item::special::SpecialItemsEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
    $self->{tableName} = "specialitems";
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
            if ($org::allbinary::data::tables::user::commerce::inventory::item::special::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::special::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::item::special::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::special::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{INSERT}, $e);
            }
        }
}


sub delete {
    my ($self, $value) = @_;
        try {
            $self->SUPER::deleteWhere($self->{basicItemData}->{ID}, $value);
            if ($org::allbinary::data::tables::user::commerce::inventory::item::special::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::special::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{commonStrings}->{delete});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::inventory::item::special::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::inventory::item::special::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{delete}, $e);
            }
        }
}


sub createTableStatement {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE})->append($self->{tableName})->append($self->{sqlStrings}->{START})->append($self->{basicItemData}->{ID})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{basicItemData}->{NUMBER})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::commerce::inventory::item::special::SpecialItemData::START_TIME)->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($org::allbinary::business::user::commerce::inventory::item::special::SpecialItemData::END_TIME)->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{basicItemData}->{PRICE})->append(" DECIMAL (11,2) NOT NULL,")->append('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{sqlStrings}->{PRIMARY_KEY})->append($self->{basicItemData}->{ID})->append($self->{sqlStrings}->{END});
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
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::InventoryDbInitInfo;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::business::user::commerce::inventory::item::special::SpecialItemData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::data::tables::user::commerce::inventory::item::special::SpecialItemsEntityInterface;

1;

