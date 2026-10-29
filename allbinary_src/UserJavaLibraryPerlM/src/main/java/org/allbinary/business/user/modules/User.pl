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

package org::allbinary::business::user::modules::User;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::UserInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{userName} = undef;
    $self->{prefixName} = undef;
    $self->{firstName} = undef;
    $self->{lastName} = undef;
    $self->{middleName} = undef;
    $self->{suffixName} = undef;
    $self->{company} = undef;
    $self->{positionAtCompany} = undef;
    $self->{mainEmail} = undef;
    $self->{secondaryEmail} = undef;
    $self->{homePhone} = undef;
    $self->{cellPhone} = undef;
    $self->{workPhone} = undef;
    $self->{otherContact} = undef;
    $self->{electronicDevice} = undef;
    $self->{fax} = undef;
    $self->{role} = undef;
    $self->{encryption} = undef;
    $self->{secret} = undef;
    $self->{password} = undef;
    $self->{enable} = undef;
    $self->{permissions} = undef;
    $self->{userConfigurationInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of User takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{userConfigurationInterface} = 'org::allbinary::business::user::modules::configuration::UserConfigurationInterfaceFactory'->getInstance();
        $self->{password} = 'org::allbinary::business::user::password::Password'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
    return $self;
}


sub _new1 {
    my ($class, $request) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->getFormData('org::allbinary::logic::communication::http::request::RequestParams'->new($request)->toHashMap());
        $self->{userConfigurationInterface} = 'org::allbinary::business::user::modules::configuration::UserConfigurationInterfaceFactory'->getInstance($self->getRole());
    return $self;
}


sub _new1 {
    my ($class, $userHashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->getFormData($userHashMap);
        $self->{userConfigurationInterface} = 'org::allbinary::business::user::modules::configuration::UserConfigurationInterfaceFactory'->getInstance($self->getRole());
    return $self;
}


# throws Exception
sub getFormData {
    my ($self, $userHashMap) = @_;
        $self->{userName} = 'org::allbinary::business::user::username::UserName'->new($userHashMap)->get();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $passwordString = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::PASSWORD));
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if ($stringValidationUtil->isEmpty($self->{userName}) && $stringValidationUtil->isEmpty($passwordString)) {
            $self->{userName} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEUSERNAME));
            $passwordString = $stringUtil->getNonNull($userHashMap->get($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEPASSWORD));
        }
        my $encryption = $stringUtil->getNonNull($userHashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{ENCRYPTION}));
        my $secret = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::SECRET));
        $self->{password} = 'org::allbinary::business::user::password::Password'->new($passwordString);
        $self->{prefixName} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::PREFIXNAME));
        $self->{firstName} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::FIRSTNAME));
        $self->{lastName} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::LASTNAME));
        $self->{middleName} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::MIDDLENAME));
        $self->{suffixName} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::SUFFIXNAME));
        $self->{company} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::COMPANY));
        $self->{positionAtCompany} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::POSITIONATCOMPANY));
        $self->{mainEmail} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::MAINEMAIL));
        $self->{secondaryEmail} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::SECONDARYEMAIL));
        $self->{homePhone} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::HOMEPHONE));
        $self->{cellPhone} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::CELLPHONE));
        $self->{workPhone} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::WORKPHONE));
        $self->{otherContact} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::OTHERCONTACT));
        $self->{electronicDevice} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::ELECTRONICDEVICE));
        $self->{fax} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::FAX));
        $self->{role} = 'org::allbinary::business::user::role::UserRoleB'->getRole($userHashMap->get($org::allbinary::business::user::role::UserRoleData::NAME->toString()));
        $self->{permissions} = $stringUtil->getNonNull($userHashMap->get($org::allbinary::business::user::UserData::PERMISSIONS));
        if (!$stringValidationUtil->isEmpty($self->{permissions}) && ($self->{permissions} cmp 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}) == 0) {
            $self->{permissions} = $stringUtil->getNonNull($userHashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}));
        } elsif (!defined($self->{permissions})) {
            $self->{permissions} = "No Permissions";
        }
        $self->{enable} = $stringUtil->getNonNull($userHashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE}));
}


sub isValid {
    my ($self) = @_;
        try {
            my $valid = 1;
            if (!'org::allbinary::business::user::username::UserName'->getInstance()->isValid($self->{userName})) {
                $valid = 0;
            }
            if (!$self->{password}->isValid()) {
                $valid = 0;
            }
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            if (!$stringValidationUtil->isValidRequired($self->{firstName}, 1, $org::allbinary::business::user::UserData::MAXLEN)) {
                $valid = 0;
            }
            if (!$stringValidationUtil->isValidRequired($self->{lastName}, 1, $org::allbinary::business::user::UserData::MAXLEN)) {
                $valid = 0;
            }
            if (!$stringValidationUtil->isValidRequired($self->{mainEmail}, 1, $org::allbinary::business::user::UserData::MAXLEN) || index($self->{mainEmail}, "\@") == -1) {
                $valid = 0;
            }
            return $valid;
        } catch ($e) {
            if ($org::allbinary::business::user::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VALIDATIONERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put("Failed to validate form", $self, $commonStrings->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::business::user::username::UserName'->getValidationInfo($self->{userName}));
            $stringBuffer->append($self->{password}->getValidationInfo());
            if (!$stringValidationUtil->isValidRequired($self->{firstName}, 1, $org::allbinary::business::user::UserData::MAXLEN)) {
                $stringBuffer->append("Please enter a valid First Name.<br />");
            }
            if (!$stringValidationUtil->isValidRequired($self->{lastName}, 1, $org::allbinary::business::user::UserData::MAXLEN)) {
                $stringBuffer->append("Please enter a valid Last Name.<br />");
            }
            if (!$stringValidationUtil->isValidRequired($self->{mainEmail}, 1, $org::allbinary::business::user::UserData::MAXLEN) || index($self->{mainEmail}, "\@") == -1) {
                $stringBuffer->append("Please enter a valid email address.<br />");
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::business::user::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Validating Form";
        }
}


sub setUserName {
    my ($self, $value) = @_;
        $self->{userName} = $value;
}


sub setPrefixName {
    my ($self, $value) = @_;
        $self->{prefixName} = $value;
}


sub setFirstName {
    my ($self, $value) = @_;
        $self->{firstName} = $value;
}


sub setLastName {
    my ($self, $value) = @_;
        $self->{lastName} = $value;
}


sub setMiddleName {
    my ($self, $value) = @_;
        $self->{middleName} = $value;
}


sub setSuffixName {
    my ($self, $value) = @_;
        $self->{suffixName} = $value;
}


sub setCompany {
    my ($self, $value) = @_;
        $self->{company} = $value;
}


sub setPositionAtCompany {
    my ($self, $value) = @_;
        $self->{positionAtCompany} = $value;
}


sub setMainEmail {
    my ($self, $value) = @_;
        $self->{mainEmail} = $value;
}


sub setSecondaryEmail {
    my ($self, $value) = @_;
        $self->{secondaryEmail} = $value;
}


sub setHomePhone {
    my ($self, $value) = @_;
        $self->{homePhone} = $value;
}


sub setCellPhone {
    my ($self, $value) = @_;
        $self->{cellPhone} = $value;
}


sub setWorkPhone {
    my ($self, $value) = @_;
        $self->{workPhone} = $value;
}


sub setOtherContact {
    my ($self, $value) = @_;
        $self->{otherContact} = $value;
}


sub setElectronicContact {
    my ($self, $value) = @_;
        $self->{electronicDevice} = $value;
}


sub setFax {
    my ($self, $value) = @_;
        $self->{fax} = $value;
}


sub setRole {
    my ($self, $role) = @_;
        $self->{role} = $role;
}


sub setPermissions {
    my ($self, $value) = @_;
        $self->{permissions} = $value;
}


sub setEncryption {
    my ($self, $value) = @_;
        $self->{encryption} = $value;
}


sub setSecret {
    my ($self, $value) = @_;
        $self->{secret} = $value;
}


sub setPassword {
    my ($self, $value) = @_;
        $self->{password}->set($value);
}


sub enable {
    my ($self) = @_;
        $self->setEnable("Yes");
}


sub disable {
    my ($self) = @_;
        $self->setEnable("No");
}


sub setEnable {
    my ($self, $enable) = @_;
        $self->{enable} = $enable;
}


sub getUserName {
    my ($self) = @_;
        return $self->{userName};
}


sub getPrefixName {
    my ($self) = @_;
        return $self->{prefixName};
}


sub getFirstName {
    my ($self) = @_;
        return $self->{firstName};
}


sub getLastName {
    my ($self) = @_;
        return $self->{lastName};
}


sub getMiddleName {
    my ($self) = @_;
        return $self->{middleName};
}


sub getSuffixName {
    my ($self) = @_;
        return $self->{suffixName};
}


sub getCompany {
    my ($self) = @_;
        return $self->{company};
}


sub getPositionAtCompany {
    my ($self) = @_;
        return $self->{positionAtCompany};
}


sub getMainEmail {
    my ($self) = @_;
        return $self->{mainEmail};
}


sub getSecondaryEmail {
    my ($self) = @_;
        return $self->{secondaryEmail};
}


sub getHomePhone {
    my ($self) = @_;
        return $self->{homePhone};
}


sub getCellPhone {
    my ($self) = @_;
        return $self->{cellPhone};
}


sub getWorkPhone {
    my ($self) = @_;
        return $self->{workPhone};
}


sub getOtherContact {
    my ($self) = @_;
        return $self->{otherContact};
}


sub getElectronicContact {
    my ($self) = @_;
        return $self->{electronicDevice};
}


sub getFax {
    my ($self) = @_;
        return $self->{fax};
}


sub getRole {
    my ($self) = @_;
        return $self->{role};
}


sub getPermissions {
    my ($self) = @_;
        return $self->{permissions};
}


sub getEncryption {
    my ($self) = @_;
        return $self->{encryption};
}


sub getSecret {
    my ($self) = @_;
        return $self->{secret};
}


sub getPassword {
    my ($self) = @_;
        return $self->{password}->get();
}


# throws Exception
sub toVector {
    my ($self) = @_;
        my $values = 'org::allbinary::util::BasicArrayListD'->new();
        $values->add($self->{userName});
        $values->add($self->{prefixName});
        $values->add($self->{firstName});
        $values->add($self->{lastName});
        $values->add($self->{middleName});
        $values->add($self->{suffixName});
        $values->add($self->{company});
        $values->add($self->{positionAtCompany});
        $values->add($self->{mainEmail});
        $values->add($self->{secondaryEmail});
        $values->add($self->{homePhone});
        $values->add($self->{cellPhone});
        $values->add($self->{workPhone});
        $values->add($self->{otherContact});
        $values->add($self->{electronicDevice});
        $values->add($self->{fax});
        $values->add($self->getRole()->toString());
        my $userConfigurationDomDocumentMapping = 'org::allbinary::business::user::modules::configuration::UserConfigurationDomDocumentMapping'->new($self->getUserConfigurationInterface());
        $values->add($userConfigurationDomDocumentMapping->toDomDocumentString());
        $values->add($self->{permissions});
        $values->addAllList($self->{password}->toVector($self->{secret}));
        $values->add($self->{enable});
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = ("" . $calendar->getTimeInMillis()->toString());
        $values->add($time);
        $values->add($time);
        return $values;
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        my $values = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $values->put($org::allbinary::business::user::UserData::USERNAME, $self->{userName});
        $values->put($org::allbinary::business::user::UserData::PREFIXNAME, $self->{prefixName});
        $values->put($org::allbinary::business::user::UserData::FIRSTNAME, $self->{firstName});
        $values->put($org::allbinary::business::user::UserData::LASTNAME, $self->{lastName});
        $values->put($org::allbinary::business::user::UserData::MIDDLENAME, $self->{middleName});
        $values->put($org::allbinary::business::user::UserData::SUFFIXNAME, $self->{suffixName});
        $values->put($org::allbinary::business::user::UserData::COMPANY, $self->{company});
        $values->put($org::allbinary::business::user::UserData::POSITIONATCOMPANY, $self->{positionAtCompany});
        $values->put($org::allbinary::business::user::UserData::MAINEMAIL, $self->{mainEmail});
        $values->put($org::allbinary::business::user::UserData::SECONDARYEMAIL, $self->{secondaryEmail});
        $values->put($org::allbinary::business::user::UserData::HOMEPHONE, $self->{homePhone});
        $values->put($org::allbinary::business::user::UserData::CELLPHONE, $self->{cellPhone});
        $values->put($org::allbinary::business::user::UserData::WORKPHONE, $self->{workPhone});
        $values->put($org::allbinary::business::user::UserData::OTHERCONTACT, $self->{otherContact});
        $values->put($org::allbinary::business::user::UserData::ELECTRONICDEVICE, $self->{electronicDevice});
        $values->put($org::allbinary::business::user::UserData::FAX, $self->{fax});
        if (defined($self->getRole())) {
            $values->put($org::allbinary::business::user::role::UserRoleData::NAME->toString(), $self->getRole()->toString());
        }
        my $userConfigurationDomDocumentMapping = 'org::allbinary::business::user::modules::configuration::UserConfigurationDomDocumentMapping'->new($self->getUserConfigurationInterface());
        $values->put($org::allbinary::business::user::UserData::CONFIGURATION, $userConfigurationDomDocumentMapping->toDomDocumentString());
        $values->put($org::allbinary::business::user::UserData::PERMISSIONS, $self->{permissions});
        $values->putAll($self->{password}->toHashMap($self->{secret}));
        $values->put('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE}, $self->{enable});
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = ("" . $calendar->getTimeInMillis()->toString());
        $values->put('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}, $time);
        return $values;
}


sub toPasswordHashMap {
    my ($self) = @_;
        return $self->{password}->toHashMap($self->{secret});
}


sub validateSession {
    my ($self, $weblisketSession) = @_;
        $weblisketSession->setAuthenticated();
        $weblisketSession->setRole($self->getRole());
        $weblisketSession->setUserName($self->getUserName());
}


sub updateSession {
    my ($self, $weblisketSession) = @_;
}


sub isSessionValid {
    my ($self) = @_;
        return 1;
}


# throws Exception
sub getKey {
    my ($self) = @_;
        return $self->{userName};
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


sub getUserConfigurationInterface {
    my ($self) = @_;
        return $self->{userConfigurationInterface};
}


sub setUserConfigurationInterface {
    my ($self, $userConfigurationInterface) = @_;
        $self->{userConfigurationInterface} = $userConfigurationInterface;
}

use java::util::Calendar;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::UserInterface;
use org::allbinary::business::user::modules::configuration::UserConfigurationDomDocumentMapping;
use org::allbinary::business::user::modules::configuration::UserConfigurationInterface;
use org::allbinary::business::user::modules::configuration::UserConfigurationInterfaceFactory;
use org::allbinary::business::user::password::Password;
use org::allbinary::business::user::role::UserRole;
use org::allbinary::business::user::role::UserRoleB;
use org::allbinary::business::user::role::UserRoleData;
use org::allbinary::business::user::username::UserName;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionData;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;

1;

