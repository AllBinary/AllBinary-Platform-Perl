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
package org::allbinary::business::category::CategoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::TableMappingInterface','org::allbinary::logic::control::validate::ValidationInterface';



sub getChildNodes {
    my ($self) = @_;
    die "abstract method getChildNodes";
}


sub addChildProperty {
    my ($self, $categoryPropertiesInterface) = @_;
    die "abstract method addChildProperty";
}


sub addChild {
    my ($self, $categoryInterface) = @_;
    die "abstract method addChild";
}


sub removeChild {
    my ($self, $categoryInterface) = @_;
    die "abstract method removeChild";
}


# throws Exception
sub isLeaf {
    my ($self) = @_;
    die "abstract method isLeaf";
}


sub getProperties {
    my ($self) = @_;
    die "abstract method getProperties";
}


sub setProperties {
    my ($self, $categoryPropertiesInterface) = @_;
    die "abstract method setProperties";
}


sub getHierarchy {
    my ($self) = @_;
    die "abstract method getHierarchy";
}


sub setHierarchy {
    my ($self, $categoryHierarchyInterface) = @_;
    die "abstract method setHierarchy";
}


# throws Exception
sub getPath {
    my ($self) = @_;
    die "abstract method getPath";
}


# throws Exception
sub getFilePath {
    my ($self) = @_;
    die "abstract method getFilePath";
}


# throws Exception
sub getWebAppPath {
    my ($self) = @_;
    die "abstract method getWebAppPath";
}


# throws Exception
sub getRootFilePath {
    my ($self) = @_;
    die "abstract method getRootFilePath";
}


# throws Exception
sub log {
    my ($self) = @_;
    die "abstract method log";
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::category::hierarchy::CategoryHierarchyInterface;
use org::allbinary::business::category::properties::CategoryPropertiesInterface;
use org::allbinary::data::tables::TableMappingInterface;
use org::allbinary::logic::control::validate::ValidationInterface;
use org::allbinary::logic::io::path::AbPath;

1;

