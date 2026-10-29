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

# Java interface
package org::allbinary::business::user::UserInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::TableMappingInterface','org::allbinary::logic::control::validate::ValidationInterface';



sub setUserName {
    my ($self, $value) = @_;
    die "abstract method setUserName";
}


sub setPrefixName {
    my ($self, $value) = @_;
    die "abstract method setPrefixName";
}


sub setFirstName {
    my ($self, $value) = @_;
    die "abstract method setFirstName";
}


sub setLastName {
    my ($self, $value) = @_;
    die "abstract method setLastName";
}


sub setMiddleName {
    my ($self, $value) = @_;
    die "abstract method setMiddleName";
}


sub setSuffixName {
    my ($self, $value) = @_;
    die "abstract method setSuffixName";
}


sub setCompany {
    my ($self, $value) = @_;
    die "abstract method setCompany";
}


sub setPositionAtCompany {
    my ($self, $value) = @_;
    die "abstract method setPositionAtCompany";
}


sub setMainEmail {
    my ($self, $value) = @_;
    die "abstract method setMainEmail";
}


sub setSecondaryEmail {
    my ($self, $value) = @_;
    die "abstract method setSecondaryEmail";
}


sub setHomePhone {
    my ($self, $value) = @_;
    die "abstract method setHomePhone";
}


sub setCellPhone {
    my ($self, $value) = @_;
    die "abstract method setCellPhone";
}


sub setWorkPhone {
    my ($self, $value) = @_;
    die "abstract method setWorkPhone";
}


sub setOtherContact {
    my ($self, $value) = @_;
    die "abstract method setOtherContact";
}


sub setElectronicContact {
    my ($self, $value) = @_;
    die "abstract method setElectronicContact";
}


sub setFax {
    my ($self, $value) = @_;
    die "abstract method setFax";
}


sub setRole {
    my ($self, $aRole) = @_;
    die "abstract method setRole";
}


sub setEncryption {
    my ($self, $value) = @_;
    die "abstract method setEncryption";
}


sub setSecret {
    my ($self, $value) = @_;
    die "abstract method setSecret";
}


sub setPassword {
    my ($self, $value) = @_;
    die "abstract method setPassword";
}


sub setPermissions {
    my ($self, $value) = @_;
    die "abstract method setPermissions";
}


sub enable {
    my ($self) = @_;
    die "abstract method enable";
}


sub setEnable {
    my ($self, $enable) = @_;
    die "abstract method setEnable";
}


sub getUserName {
    my ($self) = @_;
    die "abstract method getUserName";
}


sub getPrefixName {
    my ($self) = @_;
    die "abstract method getPrefixName";
}


sub getFirstName {
    my ($self) = @_;
    die "abstract method getFirstName";
}


sub getLastName {
    my ($self) = @_;
    die "abstract method getLastName";
}


sub getMiddleName {
    my ($self) = @_;
    die "abstract method getMiddleName";
}


sub getSuffixName {
    my ($self) = @_;
    die "abstract method getSuffixName";
}


sub getCompany {
    my ($self) = @_;
    die "abstract method getCompany";
}


sub getPositionAtCompany {
    my ($self) = @_;
    die "abstract method getPositionAtCompany";
}


sub getMainEmail {
    my ($self) = @_;
    die "abstract method getMainEmail";
}


sub getSecondaryEmail {
    my ($self) = @_;
    die "abstract method getSecondaryEmail";
}


sub getHomePhone {
    my ($self) = @_;
    die "abstract method getHomePhone";
}


sub getCellPhone {
    my ($self) = @_;
    die "abstract method getCellPhone";
}


sub getWorkPhone {
    my ($self) = @_;
    die "abstract method getWorkPhone";
}


sub getOtherContact {
    my ($self) = @_;
    die "abstract method getOtherContact";
}


sub getElectronicContact {
    my ($self) = @_;
    die "abstract method getElectronicContact";
}


sub getFax {
    my ($self) = @_;
    die "abstract method getFax";
}


sub getRole {
    my ($self) = @_;
    die "abstract method getRole";
}


sub getEncryption {
    my ($self) = @_;
    die "abstract method getEncryption";
}


sub getSecret {
    my ($self) = @_;
    die "abstract method getSecret";
}


sub getPassword {
    my ($self) = @_;
    die "abstract method getPassword";
}


sub getPermissions {
    my ($self) = @_;
    die "abstract method getPermissions";
}


sub getUserConfigurationInterface {
    my ($self) = @_;
    die "abstract method getUserConfigurationInterface";
}


sub setUserConfigurationInterface {
    my ($self, $userConfigurationInterface) = @_;
    die "abstract method setUserConfigurationInterface";
}


sub toPasswordHashMap {
    my ($self) = @_;
    die "abstract method toPasswordHashMap";
}


sub validateSession {
    my ($self, $weblisketSession) = @_;
    die "abstract method validateSession";
}


sub updateSession {
    my ($self, $weblisketSession) = @_;
    die "abstract method updateSession";
}


sub isSessionValid {
    my ($self) = @_;
    die "abstract method isSessionValid";
}

use java::util::HashMap;
use org::allbinary::business::user::modules::configuration::UserConfigurationInterface;
use org::allbinary::business::user::role::UserRole;
use org::allbinary::data::tables::TableMappingInterface;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionInterface;
use org::allbinary::logic::control::validate::ValidationInterface;

1;

