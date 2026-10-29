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
package org::allbinary::business::init::db::DatabaseConnectionInfoInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getUrl {
    my ($self) = @_;
    die "abstract method getUrl";
}


sub getJdbcDriver {
    my ($self) = @_;
    die "abstract method getJdbcDriver";
}


sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub getUserName {
    my ($self) = @_;
    die "abstract method getUserName";
}


sub getPassword {
    my ($self) = @_;
    die "abstract method getPassword";
}


sub getHost {
    my ($self) = @_;
    die "abstract method getHost";
}


sub getSchema {
    my ($self) = @_;
    die "abstract method getSchema";
}


sub getServer {
    my ($self) = @_;
    die "abstract method getServer";
}


sub getPort {
    my ($self) = @_;
    die "abstract method getPort";
}


sub setJdbcDriver {
    my ($self, $value) = @_;
    die "abstract method setJdbcDriver";
}


sub setName {
    my ($self, $value) = @_;
    die "abstract method setName";
}


sub setUserName {
    my ($self, $value) = @_;
    die "abstract method setUserName";
}


sub setPassword {
    my ($self, $value) = @_;
    die "abstract method setPassword";
}


sub setSchema {
    my ($self, $value) = @_;
    die "abstract method setSchema";
}


sub setServer {
    my ($self, $value) = @_;
    die "abstract method setServer";
}


sub setPort {
    my ($self, $value) = @_;
    die "abstract method setPort";
}


sub getUserNameKey {
    my ($self) = @_;
    die "abstract method getUserNameKey";
}


sub getPasswordKey {
    my ($self) = @_;
    die "abstract method getPasswordKey";
}


1;

