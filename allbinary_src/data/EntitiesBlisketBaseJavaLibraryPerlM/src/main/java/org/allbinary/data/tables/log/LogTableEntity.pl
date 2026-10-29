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

package org::allbinary::data::tables::log::LogTableEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::log::LogTableEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{tableName} = "log";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::LogDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->setTableName($self->{tableName});
    return $self;
}


sub createTableStatement {
    my ($self) = @_;
        my $abeHttpRequestInfoData = 'org::allbinary::logic::communication::http::request::AbeHttpRequestInfoData'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE})->append($self->{tableName})->append($self->{sqlStrings}->{START})->append($self->{sqlStrings}->{ID})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($abeHttpRequestInfoData->{HTTP_USER_AGENT})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($abeHttpRequestInfoData->{REMOTE_HOST})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($abeHttpRequestInfoData->{REMOTE_ADDRESS})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($abeHttpRequestInfoData->{REQUEST_FILE_PATH})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($abeHttpRequestInfoData->{REMOTE_PORT})->append($self->{sqlTypeStrings}->{MAX_INT_UNSIGNED_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{sqlStrings}->{PRIMARY_KEY})->append($self->{sqlStrings}->{ID})->append($self->{sqlStrings}->{END});
        return $stringBuffer->toString();
}


sub createTable {
    my ($self) = @_;
        return $self->SUPER::createTable($self->createTableStatement());
}

use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::LogDbInitInfo;
use org::allbinary::logic::communication::http::request::AbeHttpRequestInfoData;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::data::tables::log::LogTableEntityInterface;

1;

