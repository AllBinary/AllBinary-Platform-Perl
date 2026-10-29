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

package org::allbinary::data::tables::user::commerce::money::payment::PaymentEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = "payment";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::UserDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->setTableName($self->{tableName});
    return $self;
}


sub getLastId {
    my ($self, $userName) = @_;
        return $self->SUPER::getLargestIntegerInColumnWhere($org::allbinary::business::user::commerce::money::payment::PaymentData::ID, $org::allbinary::business::user::UserData::USERNAME, $userName);
}


sub setDefault {
    my ($self, $userName, $index) = @_;
        try {
            my $updateKeyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $whereKeyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $whereKeyAndValue->put($org::allbinary::business::user::UserData::USERNAME, $userName);
            my $paymentInterface = $self->getDefault($userName);
            if (defined($paymentInterface)) {
                $updateKeyAndValue->put('org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
                $whereKeyAndValue->put($org::allbinary::business::user::commerce::money::payment::PaymentData::ID, $paymentInterface->getId());
                $self->SUPER::updateWhere($whereKeyAndValue, $updateKeyAndValue);
            }
            $updateKeyAndValue->put('org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT}, 'org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT});
            $whereKeyAndValue->put($org::allbinary::business::user::commerce::money::payment::PaymentData::ID, ("" . ($index)));
            $self->SUPER::updateWhere($whereKeyAndValue, $updateKeyAndValue);
            if ($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "setDefault");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "setDefault", $e);
            }
        }
}


sub get {
    my ($self, $userName) = @_;
        try {
            my $paymentVector = 'org::allbinary::util::BasicArrayListD'->new();
            my $keyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $keyAndValue->put($org::allbinary::business::user::UserData::USERNAME, $userName);
            my $paymentList = $self->SUPER::getRows($keyAndValue);
            my $size = $paymentList->size();
            for (my $index = 0; $index < $size; $index++) {
                my $paymentHashMap = $paymentList->get($index);
                my $payment = 'org::allbinary::business::user::commerce::money::payment::Payment'->new($paymentHashMap);
                if (defined($payment)) {
                    $paymentVector->add($payment);
                }
            }
            return $paymentVector;
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{GET}, $e);
            }
            return undef;
        }
}


sub getDefault {
    my ($self, $userName) = @_;
        try {
            my $paymentHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $updateKeyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $updateKeyAndValue->put('org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT}, 'org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT});
            $updateKeyAndValue->put($org::allbinary::business::user::UserData::USERNAME, $userName);
            $paymentHashMap = $self->SUPER::getRow($updateKeyAndValue);
            if (defined($paymentHashMap)) {
                my $payment = 'org::allbinary::business::user::commerce::money::payment::Payment'->new($paymentHashMap);
                if ($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "getDefault");
                }
                return $payment;
            } else {
                return undef;
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "getDefault", $e);
            }
            return undef;
        }
}


sub remove {
    my ($self, $userName, $index) = @_;
        try {
            my $whereHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $whereHashMap->put($org::allbinary::business::user::UserData::USERNAME, $userName);
            $whereHashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::ID, ("" . ($index)));
            $self->SUPER::deleteWhere($whereHashMap);
            if ($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "remove");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "remove", $e);
            }
        }
}


sub add {
    my ($self, $userName, $paymentInterface) = @_;
        try {
            my $vector = 'org::allbinary::util::BasicArrayListD'->new();
            $vector->add('org::allbinary::data::generator::PaymentIdGenerator'->new()->getNext());
            $vector->add($userName);
            $vector->add('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            $vector->add($paymentInterface->getName());
            $vector->add($paymentInterface->getType());
            $vector->add($paymentInterface->getExpiration());
            my $random = 'java::util::Random'->new()->nextInt($org::allbinary::logic::control::crypt::SuperCrypt::KEYMAX);
            $vector->add('org::allbinary::logic::control::crypt::SuperCrypt'->new($random)->encrypt($paymentInterface->getNumber()));
            $vector->add($random->toString());
            my $calendar = 'java::util::Calendar'->getInstance();
            my $time = ("" . $calendar->getTimeInMillis()->toString());
            $vector->add($time);
            $self->SUPER::insert($vector);
            if ($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "add");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "add", $e);
            }
        }
}


sub createTableStatement {
    my ($self) = @_;
        my $entryData = 'org::allbinary::business::entry::EntryData'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE})->append($self->{tableName})->append($self->{sqlStrings}->{START})->append($org::allbinary::business::user::commerce::money::payment::PaymentData::ID)->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL})->append($org::allbinary::business::user::UserData::USERNAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($entryData->{DEFAULT})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::commerce::money::payment::PaymentData::NAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::commerce::money::payment::PaymentData::TYPE)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::commerce::money::payment::PaymentData::EXPIRATION)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::commerce::money::payment::PaymentData::NUMBER)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($entryData->{ENCRYPTION})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($entryData->{TIMECREATED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{sqlStrings}->{PRIMARY_KEY})->append($org::allbinary::business::user::commerce::money::payment::PaymentData::ID)->append($self->{sqlStrings}->{END});
        return $stringBuffer->toString();
}


sub createTable {
    my ($self) = @_;
        return $self->SUPER::createTable($self->createTableStatement());
}


sub drop {
    my ($self) = @_;
        return $self->SUPER::dropTable();
}

use java::util::Calendar;
use java::util::HashMap;
use java::util::Random;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::commerce::money::payment::Payment;
use org::allbinary::business::user::commerce::money::payment::PaymentData;
use org::allbinary::business::user::commerce::money::payment::PaymentInterface;
use org::allbinary::data::generator::PaymentIdGenerator;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::control::crypt::SuperCrypt;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityInterface;

1;

