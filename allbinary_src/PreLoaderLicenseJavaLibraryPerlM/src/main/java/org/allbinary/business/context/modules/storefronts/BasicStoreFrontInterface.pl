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
package org::allbinary::business::context::modules::storefronts::BasicStoreFrontInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getTestHtmlPath {
    my ($self) = @_;
    die "abstract method getTestHtmlPath";
}


sub getCurrentHostName {
    my ($self) = @_;
    die "abstract method getCurrentHostName";
}


sub getCurrentHostNamePath {
    my ($self) = @_;
    die "abstract method getCurrentHostNamePath";
}


sub getCurrentHomeHostName {
    my ($self) = @_;
    die "abstract method getCurrentHomeHostName";
}


sub getCurrentHomeHostNamePath {
    my ($self) = @_;
    die "abstract method getCurrentHomeHostNamePath";
}


sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub getUserName {
    my ($self) = @_;
    die "abstract method getUserName";
}


sub getBasketName {
    my ($self) = @_;
    die "abstract method getBasketName";
}


sub getHomeHostName {
    my ($self) = @_;
    die "abstract method getHomeHostName";
}


sub getHomeHostNamePath {
    my ($self) = @_;
    die "abstract method getHomeHostNamePath";
}


sub getHostName {
    my ($self) = @_;
    die "abstract method getHostName";
}


sub getHostNamePath {
    my ($self) = @_;
    die "abstract method getHostNamePath";
}


sub getTestHomeHostName {
    my ($self) = @_;
    die "abstract method getTestHomeHostName";
}


sub getTestHomeHostNamePath {
    my ($self) = @_;
    die "abstract method getTestHomeHostNamePath";
}


sub getTestHostName {
    my ($self) = @_;
    die "abstract method getTestHostName";
}


sub getTestHostNamePath {
    my ($self) = @_;
    die "abstract method getTestHostNamePath";
}


sub getStaticPath {
    my ($self) = @_;
    die "abstract method getStaticPath";
}


sub getCategoryPath {
    my ($self) = @_;
    die "abstract method getCategoryPath";
}


# throws Exception
sub getSubStores {
    my ($self) = @_;
    die "abstract method getSubStores";
}


sub getTagLocation {
    my ($self) = @_;
    die "abstract method getTagLocation";
}


sub getPackageLocation {
    my ($self) = @_;
    die "abstract method getPackageLocation";
}


sub getInventoryControl {
    my ($self) = @_;
    die "abstract method getInventoryControl";
}


sub getFtp {
    my ($self) = @_;
    die "abstract method getFtp";
}


sub getFtpPath {
    my ($self) = @_;
    die "abstract method getFtpPath";
}


sub getFtpUserName {
    my ($self) = @_;
    die "abstract method getFtpUserName";
}


sub getFtpPassword {
    my ($self) = @_;
    die "abstract method getFtpPassword";
}


sub getTestFtp {
    my ($self) = @_;
    die "abstract method getTestFtp";
}


sub getTestFtpPath {
    my ($self) = @_;
    die "abstract method getTestFtpPath";
}


sub getTestFtpUserName {
    my ($self) = @_;
    die "abstract method getTestFtpUserName";
}


sub getTestFtpPassword {
    my ($self) = @_;
    die "abstract method getTestFtpPassword";
}


sub getTimeCreated {
    my ($self) = @_;
    die "abstract method getTimeCreated";
}


sub getLastModified {
    my ($self) = @_;
    die "abstract method getLastModified";
}

use org::allbinary::util::BasicArrayList;

1;

