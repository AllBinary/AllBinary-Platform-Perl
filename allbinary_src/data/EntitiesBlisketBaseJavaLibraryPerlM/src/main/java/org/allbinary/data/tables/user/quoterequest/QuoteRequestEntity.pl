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

package org::allbinary::data::tables::user::quoterequest::QuoteRequestEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = "quoterequest";
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
            if ($org::allbinary::data::tables::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{INSERT}, $e);
            }
        }
}


# throws Exception
sub get {
    my ($self, $userName, $id) = @_;
        my $row = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $row->put($org::allbinary::business::user::UserData::USERNAME, $userName);
        $row->put('org::allbinary::business::quoterequest::QuoteRequestData'->getInstance()->{ID}, ("" . ($id)));
        my $quoteRequestHashMap = $self->SUPER::getRow($row);
        if (defined($quoteRequestHashMap)) {
            return 'org::allbinary::business::user::quoterequest::QuoteRequest'->new($quoteRequestHashMap);
        } else {
            return undef;
        }
}


sub getIds {
    my ($self, $userName) = @_;
        return $self->SUPER::getColumnWhere('org::allbinary::business::quoterequest::QuoteRequestData'->getInstance()->{ID}, $org::allbinary::business::user::UserData::USERNAME, $userName);
}


sub deleteWhere {
    my ($self, $key, $value) = @_;
        try {
            $self->SUPER::deleteWhere($key, $value);
            if ($org::allbinary::data::tables::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "deleteWhere");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "deleteWhere", $e);
            }
        }
}


sub createTableStatement {
    my ($self) = @_;
        my $quoteRequestData = 'org::allbinary::business::quoterequest::QuoteRequestData'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE})->append($self->{tableName})->append($self->{sqlStrings}->{START});
        $stringBuffer->append($quoteRequestData->{ID})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::UserData::USERNAME);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($quoteRequestData->{PROJECT_INFO});
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($quoteRequestData->{CUSTOMER_COMMENTS});
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($quoteRequestData->{BUDGET});
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($quoteRequestData->{TIMEFRAME});
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($quoteRequestData->{COMMENTS});
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{sqlStrings}->{PRIMARY_KEY});
        $stringBuffer->append($quoteRequestData->{ID});
        $stringBuffer->append($self->{sqlStrings}->{END});
        return $stringBuffer->toString();
}


sub createTable {
    my ($self) = @_;
        return $self->SUPER::createTable($self->createTableStatement());
}


sub dropTable {
    my ($self) = @_;
        my $result = ("" . $self->SUPER::dropTable());
        return $result;
}


sub update {
    my ($self, $userName, $updatedValues) = @_;
        $self->SUPER::updateWhere($org::allbinary::business::user::UserData::USERNAME, $userName, $updatedValues);
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::business::quoterequest::QuoteRequestData;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::quoterequest::QuoteRequest;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityInterface;

1;

