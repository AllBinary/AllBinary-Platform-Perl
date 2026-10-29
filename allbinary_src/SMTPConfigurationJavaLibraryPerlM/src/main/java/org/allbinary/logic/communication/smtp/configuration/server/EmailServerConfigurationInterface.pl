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
package org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub setSmtpServer {
    my ($self, $value) = @_;
    die "abstract method setSmtpServer";
}


sub getSmtpServer {
    my ($self) = @_;
    die "abstract method getSmtpServer";
}


sub getAccountName {
    my ($self) = @_;
    die "abstract method getAccountName";
}


sub setAccountName {
    my ($self, $accountName) = @_;
    die "abstract method setAccountName";
}


sub getPassword {
    my ($self) = @_;
    die "abstract method getPassword";
}


sub setPassword {
    my ($self, $password) = @_;
    die "abstract method setPassword";
}


sub log {
    my ($self) = @_;
    die "abstract method log";
}


sub toString {
    my ($self) = @_;
    die "abstract method toString";
}


1;

