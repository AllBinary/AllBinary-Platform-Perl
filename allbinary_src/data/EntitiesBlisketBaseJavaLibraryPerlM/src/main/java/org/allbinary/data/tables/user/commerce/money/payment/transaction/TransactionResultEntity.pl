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

package org::allbinary::data::tables::user::commerce::money::payment::transaction::TransactionResultEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::user::commerce::money::payment::transaction::TransactionResultEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = "vresults";
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
    my ($self, $userName, $orderNumber, $transactionResultInterface) = @_;
        try {
            my $values = 'org::allbinary::util::BasicArrayListD'->new();
            $values->add($orderNumber);
            $values->add($userName);
            $values->addAllList($transactionResultInterface->getValues());
            my $calendar = 'java::util::Calendar'->getInstance();
            my $time = $calendar->getTimeInMillis()->toString();
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


sub getTransactionResultInterface {
    my ($self, $orderNumber) = @_;
        try {
            my $resultHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $updateKeyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $updateKeyAndValue->put($org::allbinary::business::user::commerce::inventory::order::OrderData::ID, $orderNumber);
            $resultHashMap = $self->SUPER::getRow($updateKeyAndValue);
            if (defined($resultHashMap)) {
                my $transactionResult = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::TransactionResult'->new($resultHashMap);
                if ($org::allbinary::data::tables::user::commerce::money::payment::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "getTransactionResultInterface");
                }
                return $transactionResult;
            } else {
                return undef;
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "getTransactionResultInterface", $e);
            }
            return undef;
        }
}


sub createTableStatement {
    my ($self) = @_;
        my $paymentTransactionKeysFactory = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE})->append($self->{tableName})->append($self->{sqlStrings}->{START})->append($org::allbinary::business::user::commerce::inventory::order::OrderData::ID)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::UserData::USERNAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($paymentTransactionKeysFactory->{RESULT}->toString())->append($self->{sqlTypeStrings}->{MAX_INT_NOT_NULL})->append($paymentTransactionKeysFactory->{PNREF}->toString())->append($self->{sqlTypeStrings}->{TWELVE_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($paymentTransactionKeysFactory->{RESPMSG}->toString())->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL})->append($paymentTransactionKeysFactory->{AUTHCODE}->toString())->append($self->{sqlTypeStrings}->{SIX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{AVSADDR}->toString())->append($self->{sqlTypeStrings}->{ONE_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($paymentTransactionKeysFactory->{AVSZIP}->toString())->append($self->{sqlTypeStrings}->{ONE_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{ORIGRESULT}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($paymentTransactionKeysFactory->{STATUS}->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($paymentTransactionKeysFactory->{FRAUDCODE}->toString())->append($self->{sqlTypeStrings}->{TWO_INT_NOT_NULL});
        $stringBuffer->append($paymentTransactionKeysFactory->{FRAUDMSG}->toString())->append($self->{sqlTypeStrings}->{MAX_INT_NOT_NULL});
        $stringBuffer->append($paymentTransactionKeysFactory->{ERRCODE}->toString())->append($self->{sqlTypeStrings}->{MAX_INT_NOT_NULL});
        $stringBuffer->append($paymentTransactionKeysFactory->{SCORE}->toString())->append($self->{sqlTypeStrings}->{THREE_INT_NOT_NULL});
        $stringBuffer->append($paymentTransactionKeysFactory->{REASON1}->toString())->append($self->{sqlTypeStrings}->{FOUR_INT_NOT_NULL})->append($paymentTransactionKeysFactory->{REASON2}->toString())->append($self->{sqlTypeStrings}->{FOUR_INT_NOT_NULL})->append($paymentTransactionKeysFactory->{REASON3}->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{FOUR_INT_NOT_NULL})->append($paymentTransactionKeysFactory->{EXCEPTION1}->toString())->append($self->{sqlTypeStrings}->{FOUR_INT_NOT_NULL})->append($paymentTransactionKeysFactory->{EXCEPTION2}->toString())->append($self->{sqlTypeStrings}->{FOUR_INT_NOT_NULL})->append($paymentTransactionKeysFactory->{EXCEPTION3}->toString())->append($self->{sqlTypeStrings}->{FOUR_INT_NOT_NULL})->append($paymentTransactionKeysFactory->{EXCEPTION4}->toString())->append($self->{sqlTypeStrings}->{FOUR_INT_NOT_NULL})->append($paymentTransactionKeysFactory->{EXCEPTION5}->toString())->append($self->{sqlTypeStrings}->{FOUR_INT_NOT_NULL})->append($paymentTransactionKeysFactory->{EXCEPTION6}->toString())->append($self->{sqlTypeStrings}->{FOUR_INT_NOT_NULL})->append($paymentTransactionKeysFactory->{EXCEPTION7}->toString())->append($self->{sqlTypeStrings}->{FOUR_INT_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{sqlStrings}->{PRIMARY_KEY})->append($org::allbinary::business::user::commerce::inventory::order::OrderData::ID)->append($self->{sqlStrings}->{END});
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
use org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory;
use org::allbinary::business::user::commerce::money::payment::gateway::transaction::TransactionResult;
use org::allbinary::business::user::commerce::money::payment::gateway::transaction::TransactionResultInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::data::tables::user::commerce::money::payment::transaction::TransactionResultEntityInterface;

1;

