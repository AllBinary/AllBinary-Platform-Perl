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
package org::allbinary::logic::communication::ftp::configuration::FtpConfigurationInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getServer {
    my ($self) = @_;
    die "abstract method getServer";
}


sub getPath {
    my ($self) = @_;
    die "abstract method getPath";
}


sub getUserName {
    my ($self) = @_;
    die "abstract method getUserName";
}


sub getPassword {
    my ($self) = @_;
    die "abstract method getPassword";
}


sub setServer {
    my ($self, $value) = @_;
    die "abstract method setServer";
}


sub setPath {
    my ($self, $value) = @_;
    die "abstract method setPath";
}


sub setUserName {
    my ($self, $value) = @_;
    die "abstract method setUserName";
}


sub setPassword {
    my ($self, $value) = @_;
    die "abstract method setPassword";
}


1;

