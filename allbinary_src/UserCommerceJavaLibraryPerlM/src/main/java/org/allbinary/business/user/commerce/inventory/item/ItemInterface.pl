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
package org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::TableMappingInterface';



sub setId {
    my ($self, $itemId) = @_;
    die "abstract method setId";
}


sub setNumber {
    my ($self, $number) = @_;
    die "abstract method setNumber";
}


sub setInBaskets {
    my ($self, $value) = @_;
    die "abstract method setInBaskets";
}


sub setWeight {
    my ($self, $value) = @_;
    die "abstract method setWeight";
}


sub setEnabled {
    my ($self, $value) = @_;
    die "abstract method setEnabled";
}


sub setNewOrUsed {
    my ($self, $value) = @_;
    die "abstract method setNewOrUsed";
}


sub setSummary {
    my ($self, $value) = @_;
    die "abstract method setSummary";
}


sub setDistributor {
    my ($self, $value) = @_;
    die "abstract method setDistributor";
}


sub setIdUsedByDistributor {
    my ($self, $value) = @_;
    die "abstract method setIdUsedByDistributor";
}


sub setProducedBy {
    my ($self, $value) = @_;
    die "abstract method setProducedBy";
}


sub setProductionDate {
    my ($self, $value) = @_;
    die "abstract method setProductionDate";
}


sub setStartProductionDate {
    my ($self, $value) = @_;
    die "abstract method setStartProductionDate";
}


sub setDescription {
    my ($self, $value) = @_;
    die "abstract method setDescription";
}


sub setKeywords {
    my ($self, $value) = @_;
    die "abstract method setKeywords";
}


sub setCategory {
    my ($self, $value) = @_;
    die "abstract method setCategory";
}


sub setType {
    my ($self, $value) = @_;
    die "abstract method setType";
}


sub setSmallImage {
    my ($self, $value) = @_;
    die "abstract method setSmallImage";
}


sub setMediumImage {
    my ($self, $value) = @_;
    die "abstract method setMediumImage";
}


sub setLargeImage {
    my ($self, $value) = @_;
    die "abstract method setLargeImage";
}


sub setTimeEntered {
    my ($self, $value) = @_;
    die "abstract method setTimeEntered";
}


sub setLastModified {
    my ($self, $value) = @_;
    die "abstract method setLastModified";
}


sub setPrice {
    my ($self, $value) = @_;
    die "abstract method setPrice";
}


sub setComment {
    my ($self, $value) = @_;
    die "abstract method setComment";
}


sub setCustoms {
    my ($self, $value) = @_;
    die "abstract method setCustoms";
}


sub setDownloads {
    my ($self, $value) = @_;
    die "abstract method setDownloads";
}


sub setGroups {
    my ($self, $value) = @_;
    die "abstract method setGroups";
}


sub setOptions {
    my ($self, $value) = @_;
    die "abstract method setOptions";
}


sub setPermissions {
    my ($self, $value) = @_;
    die "abstract method setPermissions";
}


sub setSpecials {
    my ($self, $value) = @_;
    die "abstract method setSpecials";
}


sub getId {
    my ($self) = @_;
    die "abstract method getId";
}


sub getNumber {
    my ($self) = @_;
    die "abstract method getNumber";
}


sub getInBaskets {
    my ($self) = @_;
    die "abstract method getInBaskets";
}


sub getWeight {
    my ($self) = @_;
    die "abstract method getWeight";
}


sub getEnabled {
    my ($self) = @_;
    die "abstract method getEnabled";
}


sub getNewOrUsed {
    my ($self) = @_;
    die "abstract method getNewOrUsed";
}


sub getSummary {
    my ($self) = @_;
    die "abstract method getSummary";
}


sub getDistributor {
    my ($self) = @_;
    die "abstract method getDistributor";
}


sub getIdUsedByDistributor {
    my ($self) = @_;
    die "abstract method getIdUsedByDistributor";
}


sub getProducedBy {
    my ($self) = @_;
    die "abstract method getProducedBy";
}


sub getProductionDate {
    my ($self) = @_;
    die "abstract method getProductionDate";
}


sub getStartProductionDate {
    my ($self) = @_;
    die "abstract method getStartProductionDate";
}


sub getDescription {
    my ($self) = @_;
    die "abstract method getDescription";
}


sub getKeywords {
    my ($self) = @_;
    die "abstract method getKeywords";
}


sub getCategory {
    my ($self) = @_;
    die "abstract method getCategory";
}


sub getType {
    my ($self) = @_;
    die "abstract method getType";
}


sub getSmallImage {
    my ($self) = @_;
    die "abstract method getSmallImage";
}


sub getMediumImage {
    my ($self) = @_;
    die "abstract method getMediumImage";
}


sub getLargeImage {
    my ($self) = @_;
    die "abstract method getLargeImage";
}


sub getTimeEntered {
    my ($self) = @_;
    die "abstract method getTimeEntered";
}


sub getLastModified {
    my ($self) = @_;
    die "abstract method getLastModified";
}


sub getPrice {
    my ($self) = @_;
    die "abstract method getPrice";
}


sub getComment {
    my ($self) = @_;
    die "abstract method getComment";
}


sub getCustoms {
    my ($self) = @_;
    die "abstract method getCustoms";
}


sub getDownloads {
    my ($self) = @_;
    die "abstract method getDownloads";
}


sub getGroups {
    my ($self) = @_;
    die "abstract method getGroups";
}


sub getOptions {
    my ($self) = @_;
    die "abstract method getOptions";
}


sub getPermissions {
    my ($self) = @_;
    die "abstract method getPermissions";
}


sub getSpecials {
    my ($self) = @_;
    die "abstract method getSpecials";
}


sub getTotal {
    my ($self) = @_;
    die "abstract method getTotal";
}

use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::data::tables::TableMappingInterface;

1;

