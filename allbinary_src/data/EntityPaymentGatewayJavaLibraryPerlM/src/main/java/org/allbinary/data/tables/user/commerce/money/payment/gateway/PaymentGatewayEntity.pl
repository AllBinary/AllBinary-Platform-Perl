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

package org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = "paymentgateways";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::UserDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->setTableName($self->{tableName});
        if ($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{CONSTRUCTOR}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub add {
    my ($self, $paymentGatewayInterface) = @_;
        try {
            if ($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "add");
            }
            my $vector = 'org::allbinary::util::BasicArrayListD'->new();
            $vector->add('org::allbinary::data::generator::PaymentGatewayIdGenerator'->new()->getNext());
            $vector->addAllList('org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayEncryptedMapping'->new($paymentGatewayInterface)->toVector());
            my $calendar = 'java::util::Calendar'->getInstance();
            my $time = ("" . $calendar->getTimeInMillis()->toString());
            $vector->add($time);
            $vector->add($time);
            $self->SUPER::insert($vector);
            if ($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, "add");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "add", $e);
            }
        }
}


sub update {
    my ($self, $paymentGatewayInterface) = @_;
        try {
            my $calendar = 'java::util::Calendar'->getInstance();
            my $time = ("" . $calendar->getTimeInMillis()->toString());
            $paymentGatewayInterface->setLastModified($time);
            my $whereKeyValuePairs = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $whereKeyValuePairs->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}->toString(), $paymentGatewayInterface->getStoreName());
            $whereKeyValuePairs->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString(), $paymentGatewayInterface->getName());
            if (defined($whereKeyValuePairs->get('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED}))) {
                die ("Don't update TimeCreated for update");
            }
            my $updateHashMap = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayEncryptedMapping'->new($paymentGatewayInterface)->toHashMap();
            $self->SUPER::updateWhere($whereKeyValuePairs, $updateHashMap);
            if ($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "update");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "update", $e);
            }
        }
}


sub getPaymentGatewayInterface {
    my ($self, $storeName, $paymentType) = @_;
        try {
            my $paymentGatewayHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $whereKeyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $whereKeyAndValue->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}->toString(), $storeName);
            $whereKeyAndValue->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString(), $paymentType->getName());
            $paymentGatewayHashMap = $self->SUPER::getRow($whereKeyAndValue);
            if (defined($paymentGatewayHashMap)) {
                my $userName = $paymentGatewayHashMap->get($org::allbinary::business::user::UserData::USERNAME->toString());
                my $password = $paymentGatewayHashMap->get($org::allbinary::business::user::UserData::PASSWORD->toString());
                my $special1 = $paymentGatewayHashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL1->toString());
                my $special2 = $paymentGatewayHashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL2->toString());
                my $special3 = $paymentGatewayHashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL3->toString());
                my $special4 = $paymentGatewayHashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL4->toString());
                my $special5 = $paymentGatewayHashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL5->toString());
                my $special6 = $paymentGatewayHashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL6->toString());
                my $special7 = $paymentGatewayHashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL7->toString());
                my $special8 = $paymentGatewayHashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL8->toString());
                my $special9 = $paymentGatewayHashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL9->toString());
                my $superCrypt = 'org::allbinary::logic::control::crypt::SuperCrypt'->new($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::CRYPTNUM);
                $paymentGatewayHashMap->put($org::allbinary::business::user::UserData::USERNAME->toString(), $superCrypt->decrypt($userName));
                $paymentGatewayHashMap->put($org::allbinary::business::user::UserData::PASSWORD->toString(), $superCrypt->decrypt($password));
                $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL1->toString(), $superCrypt->decrypt($special1));
                $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL2->toString(), $superCrypt->decrypt($special2));
                $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL3->toString(), $superCrypt->decrypt($special3));
                $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL4->toString(), $superCrypt->decrypt($special4));
                $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL5->toString(), $superCrypt->decrypt($special5));
                $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL6->toString(), $superCrypt->decrypt($special6));
                $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL7->toString(), $superCrypt->decrypt($special7));
                $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL8->toString(), $superCrypt->decrypt($special8));
                $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL9->toString(), $superCrypt->decrypt($special9));
                my $paymentGatewayInterface = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterfaceFactory'->new()->getInstance($paymentGatewayHashMap);
                if ($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "getPaymentGatewayInterface()");
                }
                return $paymentGatewayInterface;
            } else {
                return 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterfaceFactory'->new()->getInstance($paymentType);
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put("Command Failed for paymentType: " . $paymentType->getName(), $self, "getPaymentGatewayInterface", $e);
            }
            return undef;
        }
}


sub findPaymentTypeVectorByStore {
    my ($self, $storeName) = @_;
        try {
            my $paymentGatewayNameVector = 'org::allbinary::util::BasicArrayListD'->new();
            $paymentGatewayNameVector = $self->SUPER::getColumnWhere($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString(), 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}->toString(), $storeName);
            if (defined($paymentGatewayNameVector)) {
                my $paymentGatewayVector = 'org::allbinary::util::BasicArrayListD'->new();
                my $size = $paymentGatewayNameVector->size();
                for (my $i = 0; $i < $size; $i++) {
                    my $paymentTypeString = $paymentGatewayNameVector->get($i);
                    my $paymentType = 'org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil'->getInstance()->get($paymentTypeString);
                    $paymentGatewayVector->add($paymentType);
                }
                if ($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "findPaymentTypeVectorByStore()");
                }
                return $paymentGatewayVector;
            } else {
                return 'org::allbinary::util::BasicArrayListD'->new();
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "findPaymentTypeVectorByStore", $e);
            }
            return undef;
        }
}


sub remove {
    my ($self, $storeName, $paymentType) = @_;
        try {
            my $whereHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $whereHashMap->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}->toString(), $storeName);
            $whereHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString(), $paymentType->getName());
            $self->SUPER::deleteWhere($whereHashMap);
            if ($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "remove");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "remove", $e);
            }
        }
}


sub createTableStatement {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE});
        $stringBuffer->append($self->{tableName});
        $stringBuffer->append($self->{sqlStrings}->{START});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::ID->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::PaymentData::METHOD);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::MODE->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TESTPROTOCOL->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TESTSERVER->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TESTPORT->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TESTPATH->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SERVERPROTOCOL->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SERVER->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SERVERPORT->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SERVERPATH->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::UserData::USERNAME);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::UserData::PASSWORD);
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TIMEOUT->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYPROTOCOL->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYSERVER->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYPORT->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYPATH->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYUSERNAME->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYPASSWORD->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYTIMEOUT->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL1->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL2->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL3->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL4->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL5->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL6->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL7->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL8->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL9->toString());
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{sqlStrings}->{PRIMARY_KEY});
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::ID->toString());
        $stringBuffer->append($self->{sqlStrings}->{END});
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
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::commerce::money::payment::PaymentData;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayEncryptedMapping;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterface;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterfaceFactory;
use org::allbinary::business::user::commerce::money::payment::types::BasicPaymentType;
use org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil;
use org::allbinary::data::generator::PaymentGatewayIdGenerator;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::control::crypt::SuperCrypt;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntityInterface;

1;

