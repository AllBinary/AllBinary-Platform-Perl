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

package org::allbinary::data::tables::user::UserEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::user::UserEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = "user";
    $self->{COMMAND_SUCCESS_FOR_USER} = "Command Success for user: ";
    $self->{PASSWORD_LABEL} = " Password: ";
    $self->{EQUALS} = "==";
    $self->{COMMAND_SUCCESS_BUT_LOGIN_FAILED} = "Command Success but login failed for user: ";
    $self->{INVALID_PASSWORD_LABEL} = " Password: \n\"";
    $self->{NOT_EQUAL} = "\"!=\"";
    $self->{END_QUOTES} = 'org::allbinary::string::CommonSeps'->getInstance()->{QUOTE};
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
            if ($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{INSERT}, $e);
            }
        }
}


# throws Exception
sub getAdministrators {
    my ($self) = @_;
        return $self->getUsersWithRole('org::allbinary::business::user::role::UserRoleFactory'->getInstance()->{ADMINISTRATOR});
}


# throws Exception
sub getStoreManagers {
    my ($self, $storeFrontInterface) = @_;
        my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $usersVector = 'org::allbinary::util::BasicArrayListD'->new();
        $keysAndValues->put($org::allbinary::business::user::role::UserRoleData::NAME->toString(), 'org::allbinary::business::user::role::UserRoleFactory'->getInstance()->{STOREMANAGER}->toString());
        $keysAndValues->put($org::allbinary::business::user::UserData::PERMISSIONS, $storeFrontInterface->getName());
        my $usersHashMapVector = $self->SUPER::getRows($keysAndValues);
        my $size = $usersHashMapVector->size();
        for (my $i = 0; $i < $size; $i++) {
            my $userHashMap = $usersHashMapVector->get($i);
            if (defined($userHashMap)) {
                $usersVector->add('org::allbinary::business::user::modules::User'->new($userHashMap));
            }
        }
        return $usersVector;
}


# throws Exception
sub getCustomers {
    my ($self) = @_;
        return $self->getUsersWithRole('org::allbinary::business::user::role::UserRoleFactory'->getInstance()->{CUSTOMER});
}


# throws Exception
sub getUsersWithRole {
    my ($self, $userRole) = @_;
        my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $usersVector = 'org::allbinary::util::BasicArrayListD'->new();
        $keysAndValues->put($org::allbinary::business::user::role::UserRoleData::NAME->toString(), $userRole->toString());
        my $usersHashMapVector = $self->SUPER::getRows($keysAndValues);
        my $size = $usersHashMapVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $userHashMap = $usersHashMapVector->get($index);
            if (defined($userHashMap)) {
                $usersVector->add('org::allbinary::business::user::modules::User'->new($userHashMap));
            }
        }
        return $usersVector;
}


# throws Exception
sub getUsers {
    my ($self, $storeFrontInterface) = @_;
        my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $usersVector = 'org::allbinary::util::BasicArrayListD'->new();
        $keysAndValues->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $storeFrontInterface->getName());
        my $usersHashMapVector = $self->SUPER::getRows($keysAndValues);
        my $size = $usersHashMapVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $userHashMap = $usersHashMapVector->get($index);
            if (defined($userHashMap)) {
                $usersVector->add('org::allbinary::business::user::modules::User'->new($userHashMap));
            }
        }
        return $usersVector;
}


# throws Exception
sub getUser {
    my ($self, $userName) = @_;
        my $row = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $row->put($org::allbinary::business::user::UserData::USERNAME, $userName);
        my $userHashMap = $self->SUPER::getRow($row);
        if (defined($userHashMap)) {
            return 'org::allbinary::business::user::CreateUserFactory'->getInstance($userHashMap);
        } else {
            return undef;
        }
}


sub deleteWhere {
    my ($self, $key, $value) = @_;
        try {
            $self->SUPER::deleteWhere($key, $value);
            if ($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, "deleteWhere");
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "deleteWhere", $e);
            }
        }
}


sub login {
    my ($self, $userName, $password) = @_;
        try {
            my $isUserNameAndPasswordCorrect = 0;
            my $result = $self->SUPER::getField($org::allbinary::business::user::UserData::USERNAME, $userName, $org::allbinary::business::user::UserData::PASSWORD);
            my $encryption = $self->SUPER::getField($org::allbinary::business::user::UserData::USERNAME, $userName, 'org::allbinary::business::entry::EntryData'->getInstance()->{ENCRYPTION});
            if (defined($encryption) && ($encryption cmp $self->{stringUtil}->{EMPTY_STRING}) != 0) {
                $isUserNameAndPasswordCorrect = ($result cmp 'org::allbinary::logic::control::crypt::SuperCrypt'->new(int($encryption))->encrypt($password));
            } else {
                if ($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF("Command Success but login failed for user: " . $userName . " because user did not exist", $self, "login");
                }
                return $org::allbinary::globals::GLOBALS2::LOGINFAILED;
            }
            if ($isUserNameAndPasswordCorrect == 0) {
                if ($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append($self->{COMMAND_SUCCESS_FOR_USER});
                    $stringBuffer->append($userName);
                    $stringBuffer->append($self->{PASSWORD_LABEL});
                    $stringBuffer->append($password);
                    $stringBuffer->append($self->{EQUALS});
                    $stringBuffer->append($result);
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, "login");
                }
                return $org::allbinary::globals::GLOBALS2::LOGINSUCCESS;
            } else {
                if ($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append($self->{COMMAND_SUCCESS_BUT_LOGIN_FAILED});
                    $stringBuffer->append($userName);
                    $stringBuffer->append($self->{INVALID_PASSWORD_LABEL});
                    $stringBuffer->append('org::allbinary::logic::control::crypt::SuperCrypt'->new(int($encryption))->encrypt($password));
                    $stringBuffer->append($self->{NOT_EQUAL});
                    $stringBuffer->append($result);
                    $stringBuffer->append($self->{END_QUOTES});
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, "login");
                }
                return $org::allbinary::globals::GLOBALS2::LOGINFAILED;
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "login", $e);
            }
            return "Error";
        }
}


sub update {
    my ($self, $userName, $updatedValues) = @_;
        $self->SUPER::updateWhere($org::allbinary::business::user::UserData::USERNAME, $userName, $updatedValues);
}


sub dropTables {
    my ($self) = @_;
        return $self->SUPER::dropTable();
}


sub createTableStatement {
    my ($self) = @_;
        my $entryData = 'org::allbinary::business::entry::EntryData'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE})->append($self->{tableName})->append($self->{sqlStrings}->{START})->append($org::allbinary::business::user::UserData::USERNAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::UserData::PREFIXNAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::FIRSTNAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::LASTNAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::MIDDLENAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::SUFFIXNAME)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::COMPANY)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::POSITIONATCOMPANY)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::MAINEMAIL)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::UserData::SECONDARYEMAIL)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::HOMEPHONE)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::CELLPHONE)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::WORKPHONE)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::OTHERCONTACT)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::ELECTRONICDEVICE)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::FAX)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::role::UserRoleData::NAME->toString())->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($org::allbinary::business::user::UserData::CONFIGURATION)->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL})->append($org::allbinary::business::user::UserData::PERMISSIONS)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($entryData->{ENCRYPTION})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($org::allbinary::business::user::UserData::SECRET)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($org::allbinary::business::user::UserData::PASSWORD)->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($entryData->{ENABLE})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN})->append($entryData->{TIMECREATED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($entryData->{LASTMODIFIED})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{sqlStrings}->{PRIMARY_KEY})->append($org::allbinary::business::user::UserData::USERNAME)->append($self->{sqlStrings}->{END});
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
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::business::user::CreateUserFactory;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::UserInterface;
use org::allbinary::business::user::modules::User;
use org::allbinary::business::user::role::UserRole;
use org::allbinary::business::user::role::UserRoleData;
use org::allbinary::business::user::role::UserRoleFactory;
use org::allbinary::globals::GLOBALS2;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::control::crypt::SuperCrypt;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::data::tables::user::UserEntityInterface;

1;

