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

package org::allbinary::data::tables::user::address::StreetAddressesEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::user::address::StreetAddressesEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{userName} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of StreetAddressesEntity takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::UserDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub _new1 {
    my ($class, $userName) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::UserDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->{userName} = $userName;
    return $self;
}


sub remove {
    my ($self, $index) = @_;
        try {
            my $whereHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $whereHashMap->put($org::allbinary::business::user::UserData::USERNAME, $self->{userName});
            $whereHashMap->put($org::allbinary::business::user::address::StreetAddressData::ID, ("" . ($index)));
            $self->SUPER::deleteWhere($whereHashMap);
            if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "remove");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "remove", $e);
            }
        }
}


sub add {
    my ($self, $address) = @_;
        $self->add($address, 'org::allbinary::data::tables::TableDataFactory'->getInstance()->{INTEGER_MAX_VALUE_STRING});
}


# Java overloaded method: Perl keeps the last definition
sub add {
    my ($self, $address, $index) = @_;
        try {
            my $values = 'org::allbinary::util::BasicArrayListD'->new();
            $values->add($index);
            $values->add($self->{userName});
            $values->add('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            $values->add($address->getName());
            $values->add($address->getStreet());
            $values->add($address->getCity());
            $values->add($address->getState());
            $values->add($address->getCode());
            $values->add($address->getCountry());
            my $calendar = 'java::util::Calendar'->getInstance();
            my $time = ("" . $calendar->getTimeInMillis()->toString());
            $values->add($time);
            $self->SUPER::insert($values);
            $self->setDefault($self->getLastId());
            if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "add");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "add", $e);
            }
        }
}


sub update {
    my ($self, $address) = @_;
        try {
            my $addressHashMap = $address->toHashMap();
            my $whereKeyValuePairs = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $whereKeyValuePairs->put($org::allbinary::business::user::address::StreetAddressData::ID, $address->getId());
            $whereKeyValuePairs->put($org::allbinary::business::user::UserData::USERNAME, $self->{userName});
            $self->SUPER::updateWhere($whereKeyValuePairs, $addressHashMap);
            $self->setDefault($address->getId());
            if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "update");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "add", $e);
            }
        }
}


sub getLastId {
    my ($self) = @_;
        return $self->SUPER::getLargestIntegerInColumnWhere($org::allbinary::business::user::address::StreetAddressData::ID, $org::allbinary::business::user::UserData::USERNAME, $self->{userName});
}


sub get {
    my ($self) = @_;
        try {
            my $streetAddressVector = 'org::allbinary::util::BasicArrayListD'->new();
            my $keyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $keyAndValue->put($org::allbinary::business::user::UserData::USERNAME, $self->{userName});
            my $addressList = $self->SUPER::getRows($keyAndValue);
            my $size = $addressList->size();
            for (my $index = 0; $index < $size; $index++) {
                my $addressHashMap = $addressList->get($index);
                my $streetAddress = 'org::allbinary::business::user::address::StreetAddress'->new($addressHashMap);
                if (defined($streetAddress)) {
                    $streetAddressVector->add($streetAddress);
                }
            }
            return $streetAddressVector;
        } catch ($e) {
            if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{GET}, $e);
            }
            return undef;
        }
}


# Java overloaded method: Perl keeps the last definition
sub get {
    my ($self, $index) = @_;
        try {
            my $keyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $keyAndValue->put($org::allbinary::business::user::UserData::USERNAME, $self->{userName});
            $keyAndValue->put($org::allbinary::business::user::address::StreetAddressData::ID, ("" . ($index)));
            my $addressHashMap = $self->SUPER::getRow($keyAndValue);
            if (defined($addressHashMap)) {
                return 'org::allbinary::business::user::address::StreetAddress'->new($addressHashMap);
            } else {
                return undef;
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{GET}, $e);
            }
            return undef;
        }
}


sub getDefault {
    my ($self) = @_;
        try {
            my $addressHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $updateKeyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $updateKeyAndValue->put($org::allbinary::business::user::address::StreetAddressData::DEFAULT, $org::allbinary::business::user::address::StreetAddressData::DEFAULT);
            $updateKeyAndValue->put($org::allbinary::business::user::UserData::USERNAME, $self->{userName});
            $addressHashMap = $self->SUPER::getRow($updateKeyAndValue);
            if (defined($addressHashMap)) {
                my $streetAddress = 'org::allbinary::business::user::address::StreetAddress'->new($addressHashMap);
                if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "getDefault");
                }
                return $streetAddress;
            } else {
                if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF("No Default Address Found", $self, "getDefault");
                }
                return undef;
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "getDefault", $e);
            }
            return undef;
        }
}


sub setDefault {
    my ($self, $value) = @_;
        try {
            my $updateKeyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $whereKeyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $whereKeyAndValue->put($org::allbinary::business::user::UserData::USERNAME, $self->{userName});
            my $streetAddress = $self->getDefault();
            if (defined($streetAddress)) {
                $updateKeyAndValue->put($org::allbinary::business::user::address::StreetAddressData::DEFAULT, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
                $whereKeyAndValue->put($org::allbinary::business::user::address::StreetAddressData::ID, $streetAddress->getId());
                $self->SUPER::updateWhere($whereKeyAndValue, $updateKeyAndValue);
            }
            $whereKeyAndValue->put($org::allbinary::business::user::address::StreetAddressData::ID, $value);
            $updateKeyAndValue->put($org::allbinary::business::user::address::StreetAddressData::DEFAULT, $org::allbinary::business::user::address::StreetAddressData::DEFAULT);
            $self->SUPER::updateWhere($whereKeyAndValue, $updateKeyAndValue);
            if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "setDefault");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "setShippingAddress", $e);
            }
        }
}


sub getUserName {
    my ($self) = @_;
        return $self->{userName};
}


sub createTableStatement {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE})->append($self->getTableName())->append($self->{sqlStrings}->{START})->append($org::allbinary::business::user::address::StreetAddressData::ID)->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL})->append($org::allbinary::business::user::UserData::USERNAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::address::StreetAddressData::DEFAULT)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::address::StreetAddressData::NAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::address::StreetAddressData::STREET)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::address::StreetAddressData::CITY)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::address::StreetAddressData::STATE)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::address::StreetAddressData::CODE)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::address::StreetAddressData::COUNTRY)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{sqlStrings}->{PRIMARY_KEY})->append($org::allbinary::business::user::address::StreetAddressData::ID)->append($self->{sqlStrings}->{END});
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
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::address::StreetAddressData;
use org::allbinary::data::tables::TableDataFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::data::tables::user::address::StreetAddressesEntityInterface;

1;

