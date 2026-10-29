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
package org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub init {
    my ($self) = @_;
    die "abstract method init";
}


sub getOperatingSystemInterface {
    my ($self) = @_;
    die "abstract method getOperatingSystemInterface";
}


sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub getSpecialName {
    my ($self) = @_;
    die "abstract method getSpecialName";
}


sub getVersion {
    my ($self) = @_;
    die "abstract method getVersion";
}


sub getLicenseId {
    my ($self) = @_;
    die "abstract method getLicenseId";
}


sub getLicenseServers {
    my ($self) = @_;
    die "abstract method getLicenseServers";
}


sub getLicenseServer {
    my ($self, $index) = @_;
    die "abstract method getLicenseServer";
}


sub getNumberOfLicenseServers {
    my ($self) = @_;
    die "abstract method getNumberOfLicenseServers";
}


sub toHashtable {
    my ($self) = @_;
    die "abstract method toHashtable";
}


sub isSameId {
    my ($self, $alicenseId) = @_;
    die "abstract method isSameId";
}


sub isLargerOrDifferentServerList {
    my ($self, $vector) = @_;
    die "abstract method isLargerOrDifferentServerList";
}


sub isHardSale {
    my ($self) = @_;
    die "abstract method isHardSale";
}


sub toShortString {
    my ($self) = @_;
    die "abstract method toShortString";
}

use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;

1;

