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

package org::allbinary::data::tables::workflow::WorkFlowEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::workflow::WorkFlowEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
    $self->{tableName} = "workflows";
    $self->{METHOD_GET} = "get()";
    $self->{METHOD_UPDATE} = "update";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::UserDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->setTableName($self->{tableName});
    return $self;
}


sub insert {
    my ($self, $values) = @_;
        try {
            $self->SUPER::insert($values);
            if ($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{INSERT}, $e);
            }
        }
}


sub delete {
    my ($self, $name, $storeName) = @_;
        try {
            my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $keysAndValues->put('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{NAME}, $name);
            $keysAndValues->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $storeName);
            $self->SUPER::deleteWhere($keysAndValues);
            if ($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{commonStrings}->{delete});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{delete}, $e);
            }
        }
}


# throws Exception, LicensingException
sub get {
    my ($self, $name, $storeName) = @_;
        try {
            my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $keysAndValues->put('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{NAME}, $name);
            $keysAndValues->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $storeName);
            my $hashMap = $self->SUPER::getRow($keysAndValues);
            return 'org::allbinary::logic::control::workflow::DbWorkFlowFactory'->getInstance()->getInstance($self->{abeClientInformation}, $hashMap);
        } catch ($e) {
            if ($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{METHOD_GET}, $e);
            }
            die $e;
        }
}


# Java overloaded method: Perl keeps the last definition
sub get {
    my ($self, $storeName) = @_;
        try {
            my $workFlowsVector = 'org::allbinary::util::BasicArrayListD'->new();
            my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $keysAndValues->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $storeName);
            my $hashMapVector = $self->SUPER::getRows($keysAndValues);
            my $size = $hashMapVector->size();
            for (my $i = 0; $i < $size; $i++) {
                my $workFlowHashMap = $hashMapVector->get($i);
                if (defined($workFlowHashMap)) {
                    $workFlowsVector->add('org::allbinary::logic::control::workflow::DbWorkFlowFactory'->getInstance()->getInstance($self->{abeClientInformation}, $workFlowHashMap));
                }
            }
            return $workFlowsVector;
        } catch ($e) {
            if ($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{METHOD_GET}, $e);
            }
            return undef;
        }
}


sub update {
    my ($self, $updatedValues) = @_;
        try {
            my $wherekeysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $wherekeysAndValues->put('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{NAME}, $updatedValues->get('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{NAME}));
            $wherekeysAndValues->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $updatedValues->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}));
            $self->SUPER::updateWhere($wherekeysAndValues, $updatedValues);
        } catch ($e) {
            if ($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{METHOD_UPDATE}, $e);
            }
        }
}


sub createTableStatement {
    my ($self) = @_;
        my $workFlowData = 'org::allbinary::logic::control::workflow::WorkFlowData'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE})->append($self->{tableName})->append($self->{sqlStrings}->{START})->append($workFlowData->{NAME})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::DynamicObjectData::NAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($workFlowData->{DATA})->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{sqlStrings}->{PRIMARY_KEY})->append($workFlowData->{NAME})->append($self->{sqlStrings}->{END});
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
use org::allbinary::business::DynamicObjectData;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::control::workflow::DbWorkFlowFactory;
use org::allbinary::logic::control::workflow::WorkFlowData;
use org::allbinary::logic::control::workflow::WorkFlowInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use org::allbinary::data::tables::workflow::WorkFlowEntityInterface;

1;

