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
package org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::TableMappingInterface';



sub isNameValid {
    my ($self) = @_;
    die "abstract method isNameValid";
}


sub isValid {
    my ($self) = @_;
    die "abstract method isValid";
}


sub nameValidationInfo {
    my ($self) = @_;
    die "abstract method nameValidationInfo";
}


sub validationInfo {
    my ($self) = @_;
    die "abstract method validationInfo";
}


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


sub getContextConfigurationInterface {
    my ($self) = @_;
    die "abstract method getContextConfigurationInterface";
}


sub setContextConfigurationInterface {
    my ($self, $contextConfigurationInterface) = @_;
    die "abstract method setContextConfigurationInterface";
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


sub setName {
    my ($self, $value) = @_;
    die "abstract method setName";
}


sub setBasketName {
    my ($self, $value) = @_;
    die "abstract method setBasketName";
}


sub setHomeHostName {
    my ($self, $value) = @_;
    die "abstract method setHomeHostName";
}


# throws Exception
sub setHomeHostNamePath {
    my ($self, $value) = @_;
    die "abstract method setHomeHostNamePath";
}


sub setHostName {
    my ($self, $value) = @_;
    die "abstract method setHostName";
}


# throws Exception
sub setHostNamePath {
    my ($self, $value) = @_;
    die "abstract method setHostNamePath";
}


sub setTestHomeHostName {
    my ($self, $value) = @_;
    die "abstract method setTestHomeHostName";
}


# throws Exception
sub setTestHomeHostNamePath {
    my ($self, $value) = @_;
    die "abstract method setTestHomeHostNamePath";
}


sub setTestHostName {
    my ($self, $value) = @_;
    die "abstract method setTestHostName";
}


# throws Exception
sub setTestHostNamePath {
    my ($self, $value) = @_;
    die "abstract method setTestHostNamePath";
}


# throws Exception
sub setImagePath {
    my ($self, $value) = @_;
    die "abstract method setImagePath";
}


# throws Exception
sub setStaticPath {
    my ($self, $value) = @_;
    die "abstract method setStaticPath";
}


# throws Exception
sub setCategoryPath {
    my ($self, $value) = @_;
    die "abstract method setCategoryPath";
}


sub setPackageLocation {
    my ($self, $value) = @_;
    die "abstract method setPackageLocation";
}


sub setInventoryControl {
    my ($self, $value) = @_;
    die "abstract method setInventoryControl";
}


sub setFtp {
    my ($self, $value) = @_;
    die "abstract method setFtp";
}


# throws Exception
sub setFtpPath {
    my ($self, $value) = @_;
    die "abstract method setFtpPath";
}


sub setFtpUserName {
    my ($self, $value) = @_;
    die "abstract method setFtpUserName";
}


sub setFtpPassword {
    my ($self, $value) = @_;
    die "abstract method setFtpPassword";
}


sub setTestFtp {
    my ($self, $value) = @_;
    die "abstract method setTestFtp";
}


# throws Exception
sub setTestFtpPath {
    my ($self, $value) = @_;
    die "abstract method setTestFtpPath";
}


sub setTestFtpUserName {
    my ($self, $value) = @_;
    die "abstract method setTestFtpUserName";
}


sub setTestFtpPassword {
    my ($self, $value) = @_;
    die "abstract method setTestFtpPassword";
}


sub setTimeCreated {
    my ($self, $value) = @_;
    die "abstract method setTimeCreated";
}


sub setLastModified {
    my ($self, $value) = @_;
    die "abstract method setLastModified";
}


# throws Exception
sub install {
    my ($self, $current, $total) = @_;
    die "abstract method install";
}

use org::allbinary::business::context::configuration::ContextConfigurationInterface;
use org::allbinary::data::tables::TableMappingInterface;
use org::allbinary::util::BasicArrayList;

1;

