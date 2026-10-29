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

package org::allbinary::business::installer::Initializer;
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
    $self->{userJdbcDriver} = undef;
    $self->{userName} = undef;
    $self->{userUserName} = undef;
    $self->{userPassword} = undef;
    $self->{userSchema} = undef;
    $self->{userServer} = undef;
    $self->{userPort} = undef;
    $self->{historyJdbcDriver} = undef;
    $self->{historyName} = undef;
    $self->{historyUserName} = undef;
    $self->{historyPassword} = undef;
    $self->{historySchema} = undef;
    $self->{historyServer} = undef;
    $self->{historyPort} = undef;
    $self->{logJdbcDriver} = undef;
    $self->{logName} = undef;
    $self->{logUserName} = undef;
    $self->{logPassword} = undef;
    $self->{logSchema} = undef;
    $self->{logServer} = undef;
    $self->{logPort} = undef;
    $self->{inventoryJdbcDriver} = undef;
    $self->{inventoryName} = undef;
    $self->{inventoryUserName} = undef;
    $self->{inventoryPassword} = undef;
    $self->{inventorySchema} = undef;
    $self->{inventoryServer} = undef;
    $self->{inventoryPort} = undef;
    $self->{staticPagesJdbcDriver} = undef;
    $self->{staticPagesName} = undef;
    $self->{staticPagesUserName} = undef;
    $self->{staticPagesPassword} = undef;
    $self->{staticPagesSchema} = undef;
    $self->{staticPagesServer} = undef;
    $self->{staticPagesPort} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of Initializer takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $map) = @_;
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
        $self->getFormData($hashMap);
    return $self;
}


sub _new1 {
    my ($class, $initHashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->getFormData($initHashMap);
    return $self;
}


sub getFormData {
    my ($self, $hashMap) = @_;
        try {
            my $initializerData = 'org::allbinary::business::installer::InitializerData'->getInstance();
            $self->{userJdbcDriver} = $hashMap->get($initializerData->{CUSTOMERJDBCDRIVER});
            $self->{userName} = $hashMap->get($initializerData->{CUSTOMERNAME});
            $self->{userUserName} = $hashMap->get($initializerData->{CUSTOMERUSERNAME});
            $self->{userPassword} = $hashMap->get($initializerData->{CUSTOMERPASSWORD});
            $self->{userSchema} = $hashMap->get($initializerData->{CUSTOMERSCHEMA});
            $self->{userServer} = $hashMap->get($initializerData->{CUSTOMERSERVER});
            $self->{userPort} = $hashMap->get($initializerData->{CUSTOMERPORT});
            $self->{historyJdbcDriver} = $hashMap->get($initializerData->{HISTORYJDBCDRIVER});
            $self->{historyName} = $hashMap->get($initializerData->{HISTORYNAME});
            $self->{historyUserName} = $hashMap->get($initializerData->{HISTORYUSERNAME});
            $self->{historyPassword} = $hashMap->get($initializerData->{HISTORYPASSWORD});
            $self->{historySchema} = $hashMap->get($initializerData->{HISTORYSCHEMA});
            $self->{historyServer} = $hashMap->get($initializerData->{HISTORYSERVER});
            $self->{historyPort} = $hashMap->get($initializerData->{HISTORYPORT});
            $self->{logJdbcDriver} = $hashMap->get($initializerData->{LOGJDBCDRIVER});
            $self->{logName} = $hashMap->get($initializerData->{LOGNAME});
            $self->{logUserName} = $hashMap->get($initializerData->{LOGUSERNAME});
            $self->{logPassword} = $hashMap->get($initializerData->{LOGPASSWORD});
            $self->{logSchema} = $hashMap->get($initializerData->{LOGSCHEMA});
            $self->{logServer} = $hashMap->get($initializerData->{LOGSERVER});
            $self->{logPort} = $hashMap->get($initializerData->{LOGPORT});
            $self->{inventoryJdbcDriver} = $hashMap->get($initializerData->{INVENTORYJDBCDRIVER});
            $self->{inventoryName} = $hashMap->get($initializerData->{INVENTORYNAME});
            $self->{inventoryUserName} = $hashMap->get($initializerData->{INVENTORYUSERNAME});
            $self->{inventoryPassword} = $hashMap->get($initializerData->{INVENTORYPASSWORD});
            $self->{inventorySchema} = $hashMap->get($initializerData->{INVENTORYSCHEMA});
            $self->{inventoryServer} = $hashMap->get($initializerData->{INVENTORYSERVER});
            $self->{inventoryPort} = $hashMap->get($initializerData->{INVENTORYPORT});
            $self->{staticPagesJdbcDriver} = $hashMap->get($initializerData->{STATICPAGESJDBCDRIVER});
            $self->{staticPagesName} = $hashMap->get($initializerData->{STATICPAGESNAME});
            $self->{staticPagesUserName} = $hashMap->get($initializerData->{STATICPAGESUSERNAME});
            $self->{staticPagesPassword} = $hashMap->get($initializerData->{STATICPAGESPASSWORD});
            $self->{staticPagesSchema} = $hashMap->get($initializerData->{STATICPAGESSCHEMA});
            $self->{staticPagesServer} = $hashMap->get($initializerData->{STATICPAGESSERVER});
            $self->{staticPagesPort} = $hashMap->get($initializerData->{STATICPAGESPORT});
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
        if (!$self->isJdbcDriverValid($self->{userJdbcDriver})) {
            $isValid = 0;
        }
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if (!$stringValidationUtil->isValidRequired($self->{userName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAXDB)) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{userUserName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAX)) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{userPassword}, $org::allbinary::business::installer::Initializer::MINPASSWORD, $org::allbinary::business::installer::Initializer::MAX)) {
            $isValid = 0;
        }
        if (!$self->isJdbcDriverValid($self->{historyJdbcDriver})) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{historyName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAXDB)) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{historyUserName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAX)) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{historyPassword}, $org::allbinary::business::installer::Initializer::MINPASSWORD, $org::allbinary::business::installer::Initializer::MAX)) {
            $isValid = 0;
        }
        if (!$self->isJdbcDriverValid($self->{logJdbcDriver})) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{logName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAXDB)) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{logUserName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAX)) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{logPassword}, $org::allbinary::business::installer::Initializer::MINPASSWORD, $org::allbinary::business::installer::Initializer::MAX)) {
            $isValid = 0;
        }
        if (!$self->isJdbcDriverValid($self->{inventoryJdbcDriver})) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{inventoryName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAXDB)) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{inventoryUserName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAX)) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{inventoryPassword}, $org::allbinary::business::installer::Initializer::MINPASSWORD, $org::allbinary::business::installer::Initializer::MAX)) {
            $isValid = 0;
        }
        if (!$self->isJdbcDriverValid($self->{staticPagesJdbcDriver})) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{staticPagesName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAXDB)) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{staticPagesUserName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAX)) {
            $isValid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{staticPagesPassword}, $org::allbinary::business::installer::Initializer::MINPASSWORD, $org::allbinary::business::installer::Initializer::MAX)) {
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


sub getJdbcDriverSolutionInfo {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("The following describes the possible problems and solutions regarding the Jdbc Driver error(s):<p/>");
        $stringBuffer->append("1. A JDBC driver you specified is not in your classpath.<br/>");
        $stringBuffer->append("Solution 1: Move the JDBC driver into any directory specified in the existing classpath. <br/>");
        $stringBuffer->append("Solution 2: Add the directory that contains the JDBC driver to the classpath.<br/>");
        $stringBuffer->append("Solution 3: Add the JDBC driver to the WEB-INF/lib directory where you installed this webapp.<br/>");
        $stringBuffer->append("2. The JDBC driver you specified does not exit.<br/>");
        $stringBuffer->append("Solution: Get a JDBC driver. <br/>");
        $stringBuffer->append("3. The JDBC driver you specified is not valid.<br/>");
        $stringBuffer->append("Solution: Use a valid JDBC driver.<p/>");
        return $stringBuffer->toString();
}


sub getInvalidInfo {
    my ($self) = @_;
        my $isJdbcDriversValid = 1;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        if (!$self->isJdbcDriverValid($self->{userJdbcDriver})) {
            $isJdbcDriversValid = 0;
            $stringBuffer->append($self->getJdbcDriverValidationInfo($self->{userJdbcDriver}));
        }
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if (!$stringValidationUtil->isValidRequired($self->{userName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAXDB)) {
            $stringBuffer->append("User db name should be < " . $org::allbinary::business::installer::Initializer::MAXDB . " and > " . $org::allbinary::business::installer::Initializer::MIN . " characters in length.<br />");
        }
        if (!$stringValidationUtil->isValidRequired($self->{userUserName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAX)) {
            $stringBuffer->append("User db username should be < " . $org::allbinary::business::installer::Initializer::MAX . " and > " . $org::allbinary::business::installer::Initializer::MIN . " characters in length.<br />");
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{userPassword}, $org::allbinary::business::installer::Initializer::MINPASSWORD, $org::allbinary::business::installer::Initializer::MAX)) {
            $stringBuffer->append("User DB password should be < " . $org::allbinary::business::installer::Initializer::MAX . " and > " . $org::allbinary::business::installer::Initializer::MINPASSWORD . " characters in length.<br />");
        }
        if (!$self->isJdbcDriverValid($self->{historyJdbcDriver})) {
            $isJdbcDriversValid = 0;
            $stringBuffer->append($self->getJdbcDriverValidationInfo($self->{historyJdbcDriver}));
        }
        if (!$stringValidationUtil->isValidRequired($self->{historyName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAXDB)) {
            $stringBuffer->append("History db should be < " . $org::allbinary::business::installer::Initializer::MAXDB . " and > " . $org::allbinary::business::installer::Initializer::MIN . " characters in length.<br />");
        }
        if (!$stringValidationUtil->isValidRequired($self->{historyUserName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAX)) {
            $stringBuffer->append("History db username should be < " . $org::allbinary::business::installer::Initializer::MAX . " and > " . $org::allbinary::business::installer::Initializer::MIN . " characters in length.<br />");
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{historyPassword}, $org::allbinary::business::installer::Initializer::MINPASSWORD, $org::allbinary::business::installer::Initializer::MAX)) {
            $stringBuffer->append("History db password should be < " . $org::allbinary::business::installer::Initializer::MAX . " and > " . $org::allbinary::business::installer::Initializer::MINPASSWORD . " characters in length.<br />");
        }
        if (!$self->isJdbcDriverValid($self->{logJdbcDriver})) {
            $isJdbcDriversValid = 0;
            $stringBuffer->append($self->getJdbcDriverValidationInfo($self->{logJdbcDriver}));
        }
        if (!$stringValidationUtil->isValidRequired($self->{logName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAXDB)) {
            $stringBuffer->append("Log db should be < " . $org::allbinary::business::installer::Initializer::MAXDB . " and > " . $org::allbinary::business::installer::Initializer::MIN . " characters in length.<br />");
        }
        if (!$stringValidationUtil->isValidRequired($self->{logUserName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAX)) {
            $stringBuffer->append("Log db username should be < " . $org::allbinary::business::installer::Initializer::MAX . " and > " . $org::allbinary::business::installer::Initializer::MIN . " characters in length.<br />");
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{logPassword}, $org::allbinary::business::installer::Initializer::MINPASSWORD, $org::allbinary::business::installer::Initializer::MAX)) {
            $stringBuffer->append("Log db password should be < " . $org::allbinary::business::installer::Initializer::MAX . " and > " . $org::allbinary::business::installer::Initializer::MINPASSWORD . " characters in length.<br />");
        }
        if (!$self->isJdbcDriverValid($self->{inventoryJdbcDriver})) {
            $isJdbcDriversValid = 0;
            $stringBuffer->append($self->getJdbcDriverValidationInfo($self->{inventoryJdbcDriver}));
        }
        if (!$stringValidationUtil->isValidRequired($self->{inventoryName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAXDB)) {
            $stringBuffer->append("Inventory db should be < " . $org::allbinary::business::installer::Initializer::MAXDB . " and > " . $org::allbinary::business::installer::Initializer::MIN . " characters in length.<br />");
        }
        if (!$stringValidationUtil->isValidRequired($self->{inventoryUserName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAX)) {
            $stringBuffer->append("Inventory db username should be < " . $org::allbinary::business::installer::Initializer::MAX . " and > " . $org::allbinary::business::installer::Initializer::MIN . " characters in length.<br />");
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{inventoryPassword}, $org::allbinary::business::installer::Initializer::MINPASSWORD, $org::allbinary::business::installer::Initializer::MAX)) {
            $stringBuffer->append("Inventory DB password should be < " . $org::allbinary::business::installer::Initializer::MAX . " and > " . $org::allbinary::business::installer::Initializer::MINPASSWORD . " characters in length.<br />");
        }
        if (!$self->isJdbcDriverValid($self->{staticPagesJdbcDriver})) {
            $isJdbcDriversValid = 0;
            $stringBuffer->append($self->getJdbcDriverValidationInfo($self->{staticPagesJdbcDriver}));
        }
        if (!$stringValidationUtil->isValidRequired($self->{staticPagesName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAXDB)) {
            $stringBuffer->append("Static Pages db should be < " . $org::allbinary::business::installer::Initializer::MAXDB . " and > " . $org::allbinary::business::installer::Initializer::MIN . " characters in length.<br />");
        }
        if (!$stringValidationUtil->isValidRequired($self->{staticPagesUserName}, $org::allbinary::business::installer::Initializer::MIN, $org::allbinary::business::installer::Initializer::MAX)) {
            $stringBuffer->append("Static Pages db username should be < " . $org::allbinary::business::installer::Initializer::MAX . " and > " . $org::allbinary::business::installer::Initializer::MIN . " characters in length.<br />");
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{staticPagesPassword}, $org::allbinary::business::installer::Initializer::MINPASSWORD, $org::allbinary::business::installer::Initializer::MAX)) {
            $stringBuffer->append("Static Pages DB password should be < " . $org::allbinary::business::installer::Initializer::MAX . " and > " . $org::allbinary::business::installer::Initializer::MINPASSWORD . " characters in length.<br />");
        }
        if (!$isJdbcDriversValid) {
            $stringBuffer->append($self->getJdbcDriverSolutionInfo());
        }
        return $stringBuffer->toString();
}


# throws Exception
sub set {
    my ($self) = @_;
        $self->{logUtil}->putF("Creating DB connection files", $self, "set()");
        my $userDbInitInfo = 'org::allbinary::business::init::db::UserDbInitInfo'->new(0);
        $userDbInitInfo->setJdbcDriver($self->{userJdbcDriver});
        $userDbInitInfo->setName($self->{userName});
        $userDbInitInfo->setUserName($self->{userUserName});
        $userDbInitInfo->setPassword($self->{userPassword});
        $userDbInitInfo->setSchema($self->{userSchema});
        $userDbInitInfo->setServer($self->{userServer});
        $userDbInitInfo->setPort($self->{userPort});
        $userDbInitInfo->setHasRead(1);
        $userDbInitInfo->write();
        my $historyDbInitInfo = 'org::allbinary::business::init::db::HistoryDbInitInfo'->new(0);
        $historyDbInitInfo->setJdbcDriver($self->{historyJdbcDriver});
        $historyDbInitInfo->setName($self->{historyName});
        $historyDbInitInfo->setUserName($self->{historyUserName});
        $historyDbInitInfo->setPassword($self->{historyPassword});
        $historyDbInitInfo->setSchema($self->{historySchema});
        $historyDbInitInfo->setServer($self->{historyServer});
        $historyDbInitInfo->setPort($self->{historyPort});
        $historyDbInitInfo->setHasRead(1);
        $historyDbInitInfo->write();
        my $logDbInitInfo = 'org::allbinary::business::init::db::LogDbInitInfo'->new(0);
        $logDbInitInfo->setJdbcDriver($self->{logJdbcDriver});
        $logDbInitInfo->setName($self->{logName});
        $logDbInitInfo->setUserName($self->{logUserName});
        $logDbInitInfo->setPassword($self->{logPassword});
        $logDbInitInfo->setSchema($self->{logSchema});
        $logDbInitInfo->setServer($self->{logServer});
        $logDbInitInfo->setPort($self->{logPort});
        $logDbInitInfo->setHasRead(1);
        $logDbInitInfo->write();
        my $staticPagesDbInitInfo = 'org::allbinary::business::init::db::StaticPagesDbInitInfo'->new(0);
        $staticPagesDbInitInfo->setJdbcDriver($self->{staticPagesJdbcDriver});
        $staticPagesDbInitInfo->setName($self->{staticPagesName});
        $staticPagesDbInitInfo->setUserName($self->{staticPagesUserName});
        $staticPagesDbInitInfo->setPassword($self->{staticPagesPassword});
        $staticPagesDbInitInfo->setSchema($self->{staticPagesSchema});
        $staticPagesDbInitInfo->setServer($self->{staticPagesServer});
        $staticPagesDbInitInfo->setPort($self->{staticPagesPort});
        $staticPagesDbInitInfo->setHasRead(1);
        $staticPagesDbInitInfo->write();
        my $inventoryDbInitInfo = 'org::allbinary::business::init::db::InventoryDbInitInfo'->new(0);
        $inventoryDbInitInfo->setJdbcDriver($self->{inventoryJdbcDriver});
        $inventoryDbInitInfo->setName($self->{inventoryName});
        $inventoryDbInitInfo->setUserName($self->{inventoryUserName});
        $inventoryDbInitInfo->setPassword($self->{inventoryPassword});
        $inventoryDbInitInfo->setSchema($self->{inventorySchema});
        $inventoryDbInitInfo->setServer($self->{inventoryServer});
        $inventoryDbInitInfo->setPort($self->{inventoryPort});
        $inventoryDbInitInfo->setHasRead(1);
        $inventoryDbInitInfo->write();
        $self->{logUtil}->putF("Created DB connection files", $self, "set()");
}

use java::util::HashMap;
# use java::util::Map;
# use java::util::Set;
use org::allbinary::business::init::db::HistoryDbInitInfo;
use org::allbinary::business::init::db::InventoryDbInitInfo;
use org::allbinary::business::init::db::LogDbInitInfo;
use org::allbinary::business::init::db::StaticPagesDbInitInfo;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::business::installer::InitializerData;

1;

