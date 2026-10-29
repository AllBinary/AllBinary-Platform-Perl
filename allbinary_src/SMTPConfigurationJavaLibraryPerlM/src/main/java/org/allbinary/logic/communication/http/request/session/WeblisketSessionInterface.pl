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
package org::allbinary::logic::communication::http::request::session::WeblisketSessionInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub clear {
    my ($self) = @_;
    die "abstract method clear";
}


sub getAttempts {
    my ($self) = @_;
    die "abstract method getAttempts";
}


sub getAuthentication {
    my ($self) = @_;
    die "abstract method getAuthentication";
}


sub getCreationTime {
    my ($self) = @_;
    die "abstract method getCreationTime";
}


sub getId {
    my ($self) = @_;
    die "abstract method getId";
}


sub getLastAccessedTime {
    my ($self) = @_;
    die "abstract method getLastAccessedTime";
}


# throws Exception
sub getOrder {
    my ($self) = @_;
    die "abstract method getOrder";
}


sub getPassword {
    my ($self) = @_;
    die "abstract method getPassword";
}


sub getPaymentMethod {
    my ($self) = @_;
    die "abstract method getPaymentMethod";
}


# throws Exception
sub getRole {
    my ($self) = @_;
    die "abstract method getRole";
}


sub getStoreName {
    my ($self) = @_;
    die "abstract method getStoreName";
}


sub getTimeout {
    my ($self) = @_;
    die "abstract method getTimeout";
}


sub getUserName {
    my ($self) = @_;
    die "abstract method getUserName";
}


sub getWebAppPath {
    my ($self) = @_;
    die "abstract method getWebAppPath";
}


sub removeBasket {
    my ($self) = @_;
    die "abstract method removeBasket";
}


sub setAttempts {
    my ($self, $value) = @_;
    die "abstract method setAttempts";
}


sub setAuthenticated {
    my ($self) = @_;
    die "abstract method setAuthenticated";
}


# Java overloaded method: Perl keeps the last definition
sub setAuthenticated {
    my ($self, $value) = @_;
    die "abstract method setAuthenticated";
}


sub setPassword {
    my ($self, $password) = @_;
    die "abstract method setPassword";
}


sub setPaymentMethod {
    my ($self, $value) = @_;
    die "abstract method setPaymentMethod";
}


sub setRole {
    my ($self, $aRole) = @_;
    die "abstract method setRole";
}


sub setStoreName {
    my ($self, $value) = @_;
    die "abstract method setStoreName";
}


sub setTimeout {
    my ($self, $value) = @_;
    die "abstract method setTimeout";
}


sub setUserName {
    my ($self, $userName) = @_;
    die "abstract method setUserName";
}

use org::allbinary::business::user::commerce::inventory::order::OrderInterface;
use org::allbinary::business::user::role::UserRole;

1;

