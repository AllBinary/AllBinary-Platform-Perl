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

package org::allbinary::data::tables::staticpages::StaticPagesEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::staticpages::StaticPagesEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
    $self->{TABLENAME} = "staticpages";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::StaticPagesDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->setTableName($self->{TABLENAME});
    return $self;
}


sub insert {
    my ($self, $values) = @_;
        try {
            $self->SUPER::insert($values);
            if ($org::allbinary::data::tables::staticpages::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::staticpages::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::staticpages::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::staticpages::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{INSERT}, $e);
            }
        }
}


sub getFile {
    my ($self, $store, $keywords) = @_;
        my $whereHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $whereHashMap->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $store);
        $whereHashMap->put($self->{basicItemData}->{KEYWORDS}, $keywords);
        my $file = $self->SUPER::getField($whereHashMap, $org::allbinary::logic::control::search::SearchData::PAGE);
        return $file;
}


sub delete {
    my ($self, $keywords) = @_;
        $self->SUPER::deleteWhere($self->{basicItemData}->{KEYWORDS}, $keywords);
}


sub dropTable {
    my ($self) = @_;
        my $returnStr = $self->SUPER::dropTable();
        return $returnStr;
}


sub update {
    my ($self, $updatedValues) = @_;
        $self->SUPER::updateWhere($self->{basicItemData}->{KEYWORDS}, $updatedValues->get($self->{basicItemData}->{KEYWORDS}), $updatedValues);
}


sub createTableStatement {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE})->append($self->{TABLENAME})->append($self->{sqlStrings}->{START})->append('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME})->append($self->{sqlTypeStrings}->{SIXTY_CHAR_COLUMN_NOT_NULL})->append($self->{basicItemData}->{KEYWORDS})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::logic::control::search::SearchData::PAGE)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($self->{sqlStrings}->{PRIMARY_KEY})->append('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME})->append('org::allbinary::string::CommonSeps'->getInstance()->{COMMA_SEP})->append($self->{basicItemData}->{KEYWORDS})->append($self->{sqlStrings}->{END});
        return $stringBuffer->toString();
}


sub createTable {
    my ($self) = @_;
        return $self->SUPER::createTable($self->createTableStatement());
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::init::db::StaticPagesDbInitInfo;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::control::search::SearchData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::data::tables::staticpages::StaticPagesEntityInterface;

1;

