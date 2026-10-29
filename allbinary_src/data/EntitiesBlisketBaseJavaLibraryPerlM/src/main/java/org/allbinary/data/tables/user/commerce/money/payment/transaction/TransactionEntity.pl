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

package org::allbinary::data::tables::user::commerce::money::payment::transaction::TransactionEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::user::commerce::money::payment::transaction::TransactionEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = "vtrans";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::UserDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->setTableName($self->{tableName});
    return $self;
}


sub remove {
    my ($self, $userName, $orderNumber) = @_;
        try {
            my $whereHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $whereHashMap->put($org::allbinary::business::user::commerce::inventory::order::OrderData::ID, $orderNumber);
            $whereHashMap->put($org::allbinary::business::user::UserData::USERNAME, $userName);
            $self->SUPER::deleteWhere($whereHashMap);
            if ($org::allbinary::data::tables::user::commerce::money::payment::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "remove");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "remove", $e);
            }
        }
}


sub add {
    my ($self, $userName, $orderNumber, $paymentTransactionInterface) = @_;
        try {
            my $values = 'org::allbinary::util::BasicArrayListD'->new();
            $values->add($orderNumber);
            $values->add($userName);
            $values->addAllList($paymentTransactionInterface->toVector());
            my $calendar = 'java::util::Calendar'->getInstance();
            my $time = ("" . $calendar->getTimeInMillis()->toString());
            $values->add($time);
            $values->add($time);
            $self->SUPER::insert($values);
            if ($org::allbinary::data::tables::user::commerce::money::payment::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "add");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "add", $e);
            }
        }
}


sub createTableStatement {
    my ($self) = @_;
        my $paymentTransactionKeysFactory = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE});
        $stringBuffer->append($self->{tableName});
        $stringBuffer->append($self->{sqlStrings}->{START});
        $stringBuffer->append($org::allbinary::business::user::commerce::inventory::order::OrderData::ID)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::UserData::USERNAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{TRXTYPE}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{TENDER}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{ACCT}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{EXPDATE}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{AMT}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{AUTHCODE}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{MICR}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{CHECKNUM}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{NAME}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{STREET}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{CITY}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{STATE}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{ZIP}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{DL}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{EMAIL}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{COMMENT1}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{COMMENT2}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{ORIGID}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{PONUM}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{DESC}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{DESC1TO4}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{INVNUM}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{SHIPTOZIP}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{SWIPE}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{TAXAMT}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{COMMCARD}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{DUTYAMT}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{FREIGHTAMT}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{ORDERDATE}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{TAXEXEMPT}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{COUNTRYCODE}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{CUSTCODE}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{CVV2}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{ABA}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{ACCTTYPE}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{DISCOUNT}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{FIRSTNAME}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{LASTNAME}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{SHIPFROMZIP}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{PRENOTE}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{CHKTYPE}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{DOB}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{PHONENUM}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{SS}->toString())->append(" VARCHAR(30) NOT NULL,")->append($paymentTransactionKeysFactory->{COMPANYNAME}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{COUNTRY}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{SHIPTOCITY}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{SHIPTOFIRSTNAME}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{SHIPTOLASTNAME}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{SHIPTOSTATE}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{SHIPTOSTREET}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{SPECIAL1}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{SPECIAL2}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{SPECIAL3}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{sqlStrings}->{PRIMARY_KEY})->append($org::allbinary::business::user::commerce::inventory::order::OrderData::ID)->append($self->{sqlStrings}->{END});
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

use java::util::Calendar;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::commerce::inventory::order::OrderData;
use org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterface;
use org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::data::tables::user::commerce::money::payment::transaction::TransactionEntityInterface;

1;

