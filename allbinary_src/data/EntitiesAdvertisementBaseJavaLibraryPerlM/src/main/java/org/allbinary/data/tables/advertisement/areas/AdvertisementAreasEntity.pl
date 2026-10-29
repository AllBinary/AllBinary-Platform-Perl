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

package org::allbinary::data::tables::advertisement::areas::AdvertisementAreasEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::advertisement::areas::AdvertisementAreasEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = "advertisements";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::UserDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->setTableName($self->{tableName});
    return $self;
}


sub delete {
    my ($self, $value) = @_;
        try {
            $self->SUPER::deleteWhere('org::allbinary::business::entry::EntryData'->getInstance()->{ID}, $value);
            if ($org::allbinary::data::tables::advertisement::areas::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::advertisement::areas::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{commonStrings}->{delete});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::advertisement::areas::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::advertisement::areas::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{delete}, $e);
            }
        }
}


# throws Exception
sub get {
    my ($self, $storeName) = @_;
        my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $keysAndValues->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $storeName);
        my $hashMapVector = $self->SUPER::getRows($keysAndValues);
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $hashMapVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $hashMap = $hashMapVector->get($index);
            if (defined($hashMap)) {
                $vector->add('org::allbinary::business::advertisement::area::AdvertisementArea'->new($hashMap));
            }
        }
        return $vector;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub get {
    my ($self, $storeName, $advertisementAreaName) = @_;
        my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $keysAndValues->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $storeName);
        $keysAndValues->put('org::allbinary::business::advertisement::area::AdvertisementAreaData'->getInstance()->{NAME}, $advertisementAreaName);
        my $hashMap = $self->SUPER::getRow($keysAndValues);
        if (defined($hashMap)) {
            return 'org::allbinary::business::advertisement::area::AdvertisementArea'->new($hashMap);
        } else {
            return undef;
        }
}


sub createTableStatement {
    my ($self) = @_;
        my $advertisementAreaData = 'org::allbinary::business::advertisement::area::AdvertisementAreaData'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE});
        $stringBuffer->append($self->getTableName());
        $stringBuffer->append($self->{sqlStrings}->{START});
        $stringBuffer->append($advertisementAreaData->{NAME})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($advertisementAreaData->{DESCRIPTION})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($advertisementAreaData->{CONSTRAINTS})->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL})->append('org::allbinary::business::advertisement::campaign::AdvertisementCampaignData'->getInstance()->{NAME})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{sqlStrings}->{PRIMARY_KEY})->append($advertisementAreaData->{NAME})->append($self->{sqlStrings}->{END});
        return $stringBuffer->toString();
}


sub createTable {
    my ($self) = @_;
        my $returnStr = $self->SUPER::createTable($self->createTableStatement());
        return $returnStr;
}


sub update {
    my ($self, $updatedValues) = @_;
        $self->SUPER::updateWhere('org::allbinary::business::advertisement::area::AdvertisementAreaData'->getInstance()->{NAME}, $updatedValues->get('org::allbinary::business::advertisement::area::AdvertisementAreaData'->getInstance()->{NAME}), $updatedValues);
}


sub dropTable {
    my ($self) = @_;
        return $self->SUPER::dropTable();
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::advertisement::area::AdvertisementArea;
use org::allbinary::business::advertisement::area::AdvertisementAreaData;
use org::allbinary::business::advertisement::area::AdvertisementAreaInterface;
use org::allbinary::business::advertisement::campaign::AdvertisementCampaignData;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::data::tables::advertisement::areas::AdvertisementAreasEntityInterface;

1;

