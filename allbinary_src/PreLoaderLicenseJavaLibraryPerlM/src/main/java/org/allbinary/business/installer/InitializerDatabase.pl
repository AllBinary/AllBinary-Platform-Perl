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

package org::allbinary::business::installer::InitializerDatabase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $MAXDB = 30;
our $MAX = 16;
our $MIN = 4;
our $MINPASSWORD = 0;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{adminDbUserName} = undef;
    $self->{adminDbPassword} = undef;
    $self->{adminJdbcDriver} = undef;
    $self->{adminSchema} = undef;
    $self->{adminServer} = undef;
    $self->{adminPort} = undef;
    $self->{initDb} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of InitializerDatabase takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $abeClientInformation, $map) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $keys = $map->keySet();
        my $keyArray = $keys->toArray();
        my $size = scalar(@{$keyArray});
        for (my $index = 0; $index < $size; $index++) {
            my $key = $keyArray->[$index];
            my $values = $map->get($key);
            $hashMap->put(("" . $key), ("" . $values->[0]));
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append("key: ");
            $stringBuffer->append($key);
            $stringBuffer->append(" Value: ");
            $stringBuffer->append($values->[0]);
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "getFormData()");
        }
        $self->getFormData($abeClientInformation, $hashMap);
    return $self;
}


sub _new2 {
    my ($class, $abeClientInformation, $initHashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->getFormData($abeClientInformation, $initHashMap);
    return $self;
}


sub getFormData {
    my ($self, $abeClientInformation, $hashMap) = @_;
        try {
            my $initializerData = 'org::allbinary::business::installer::InitializerData'->getInstance();
            $self->setAdminDbUserName($hashMap->get($initializerData->{DBUSER}));
            $self->setAdminDbPassword($hashMap->get($initializerData->{DBPASSWORD}));
            $self->setAdminJdbcDriver($hashMap->get($initializerData->{ADMINJDBCDRIVER}));
            $self->setAdminSchema($hashMap->get($initializerData->{ADMINSCHEMA}));
            $self->setAdminServer($hashMap->get($initializerData->{ADMINSERVER}));
            $self->setAdminPort($hashMap->get($initializerData->{ADMINPORT}));
            my $dbConnectionInfo = 'org::allbinary::business::init::db::DbConnectionInfo'->new();
            my $adminDbName = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            $dbConnectionInfo->setJdbcDriver($self->getAdminJdbcDriver());
            $dbConnectionInfo->setName($adminDbName);
            $dbConnectionInfo->setUserName($self->getAdminDbUserName());
            $dbConnectionInfo->setPassword($self->getAdminDbPassword());
            $dbConnectionInfo->setSchema($self->getAdminSchema());
            $dbConnectionInfo->setServer($self->getAdminServer());
            $dbConnectionInfo->setPort($self->getAdminPort());
            $self->{initDb} = 'org::allbinary::business::installer::DynamicInitDb'->new($abeClientInformation, $dbConnectionInfo);
        } catch ($e) {
            $self->{logUtil}->put("Unable to get form data", $self, "getFormData()", $e);
        }
}


sub isJdbcDriverValid {
    my ($self, $jdbcDriverClassPathString) = @_;
        try {
            'org::allbinary::business::installer::Class'->forName($jdbcDriverClassPathString)->newInstance();
            return 1;
        } catch ($e) {
            if ($org::allbinary::business::installer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::installer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRELOADERERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub isValid {
    my ($self) = @_;
        my $isValid = 1;
        if (!$self->isJdbcDriverValid($self->{adminJdbcDriver})) {
            $isValid = 0;
        }
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if (!$stringValidationUtil->isValidRequired($self->{adminDbUserName}, $org::allbinary::business::installer::InitializerDatabase::MIN, $org::allbinary::business::installer::InitializerDatabase::MAX)) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{adminDbPassword}, $org::allbinary::business::installer::InitializerDatabase::MINPASSWORD, $org::allbinary::business::installer::InitializerDatabase::MAX)) {
            $isValid = 0;
        }
        return $isValid;
}


sub getJdbcDriverValidationInfo {
    my ($self, $jdbcDriver) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("The JDBC driver (");
        $stringBuffer->append($jdbcDriver);
        $stringBuffer->append(") you have provided is not valid.<br/>");
        return $stringBuffer->toString();
}


sub getInvalidInfo {
    my ($self) = @_;
        my $isValid = 1;
        my $isJdbcDriversValid = 1;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        if (!$self->isJdbcDriverValid($self->{adminJdbcDriver})) {
            $isJdbcDriversValid = 0;
            $stringBuffer->append($self->getJdbcDriverValidationInfo($self->getAdminJdbcDriver()));
        }
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if (!$stringValidationUtil->isValidRequired($self->{adminDbUserName}, $org::allbinary::business::installer::InitializerDatabase::MIN, $org::allbinary::business::installer::InitializerDatabase::MAX)) {
            $stringBuffer->append("Admin username should be < " . $org::allbinary::business::installer::InitializerDatabase::MAX . " and > " . $org::allbinary::business::installer::InitializerDatabase::MIN . " characters in length.<br />");
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{adminDbPassword}, $org::allbinary::business::installer::InitializerDatabase::MINPASSWORD, $org::allbinary::business::installer::InitializerDatabase::MAX)) {
            $stringBuffer->append("Admin password should be < " . $org::allbinary::business::installer::InitializerDatabase::MAX . " and > " . $org::allbinary::business::installer::InitializerDatabase::MINPASSWORD . " characters in length.<br />");
        }
        if (!$isJdbcDriversValid) {
            $stringBuffer->append('org::allbinary::business::installer::InitializerData'->getInstance()->getJdbcDriverSolutionInfo());
        }
        return $stringBuffer->toString();
}


sub createUsers {
    my ($self) = @_;
        try {
            $self->{initDb}->addUsers();
            return 1;
        } catch ($e) {
            $self->{logUtil}->put("Unable to Create Users", $self, "createUsers()", $e);
            return 0;
        }
}


sub createDatabases {
    my ($self) = @_;
        try {
            $self->{initDb}->addDatabases();
            return 1;
        } catch ($e) {
            $self->{logUtil}->put("Unable to Create Databases", $self, "createDatabases()", $e);
            return 0;
        }
}


sub createTables {
    my ($self) = @_;
        try {
            $self->{initDb}->addTables();
            return 1;
        } catch ($e) {
            $self->{logUtil}->put("Unable to Create Tables", $self, "createTables()", $e);
            return 0;
        }
}


sub getAdminDbUserName {
    my ($self) = @_;
        return $self->{adminDbUserName};
}


sub setAdminDbUserName {
    my ($self, $adminDbUserName) = @_;
        $self->{adminDbUserName} = $adminDbUserName;
}


sub getAdminDbPassword {
    my ($self) = @_;
        return $self->{adminDbPassword};
}


sub setAdminDbPassword {
    my ($self, $adminDbPassword) = @_;
        $self->{adminDbPassword} = $adminDbPassword;
}


sub getAdminJdbcDriver {
    my ($self) = @_;
        return $self->{adminJdbcDriver};
}


sub setAdminJdbcDriver {
    my ($self, $adminJdbcDriver) = @_;
        $self->{adminJdbcDriver} = $adminJdbcDriver;
}


sub getAdminSchema {
    my ($self) = @_;
        return $self->{adminSchema};
}


sub setAdminSchema {
    my ($self, $adminSchema) = @_;
        $self->{adminSchema} = $adminSchema;
}


sub getAdminServer {
    my ($self) = @_;
        return $self->{adminServer};
}


sub setAdminServer {
    my ($self, $adminServer) = @_;
        $self->{adminServer} = $adminServer;
}


sub getAdminPort {
    my ($self) = @_;
        return $self->{adminPort};
}


sub setAdminPort {
    my ($self, $adminPort) = @_;
        $self->{adminPort} = $adminPort;
}

use java::util::HashMap;
# use java::util::Map;
# use java::util::Set;
use org::allbinary::business::init::db::DatabaseConnectionInfoInterface;
use org::allbinary::business::init::db::DbConnectionInfo;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::business::installer::InitializerData;
use org::allbinary::business::installer::DynamicInitDb;

1;

