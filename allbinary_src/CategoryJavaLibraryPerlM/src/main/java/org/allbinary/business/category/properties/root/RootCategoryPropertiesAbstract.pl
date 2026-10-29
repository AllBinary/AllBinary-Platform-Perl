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

package org::allbinary::business::category::properties::root::RootCategoryPropertiesAbstract;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::properties::root::RootCategoryPropertiesInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{category} = 'org::allbinary::business::category::CategoryData'->getInstance()->{ROOTCATEGORY};
    $self->{fileName} = $self->{category} . 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP} . 'org::allbinary::business::category::CategoryData'->getInstance()->{UNCRYPTED_EXTENSION};
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getKey {
    my ($self) = @_;
        return $self->getValue();
}


sub getValue {
    my ($self) = @_;
        return $self->{category};
}


# throws Exception
sub setValue {
    my ($self, $value) = @_;
        die ("No Value Allowed");
}


# throws Exception
sub setRootFilePath {
    my ($self, $value) = @_;
        die ("RuntimeException");
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub setRootFilePath {
    my ($self, $value) = @_;
        die ("No Value Allowed");
}


# throws Exception
sub getRootFilePath {
    my ($self) = @_;
        die ("No Value Allowed");
}


# throws Exception
sub isRealRoot {
    my ($self) = @_;
        die ("No A Real Root");
}


# throws Exception
sub isRoot {
    my ($self) = @_;
        die ("Root but not implemented");
}


# throws Exception
sub getWebAppPath {
    my ($self, $categoryHierarchyInterface) = @_;
        die ("Not Root");
}


sub getPath {
    my ($self, $categoryHierarchyInterface) = @_;
        return 'org::allbinary::logic::io::path::AbPath'->createAbPath();
}


sub getFileName {
    my ($self) = @_;
        return $self->{fileName};
}


sub isValid {
    my ($self) = @_;
        return 1;
}


sub toHashMap {
    my ($self) = @_;
        my $categoryHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $categoryHashMap->put('org::allbinary::business::category::CategoryData'->getInstance()->{NAME}, $self->{category});
        return $categoryHashMap;
}


sub toVector {
    my ($self) = @_;
        my $categoryVector = 'org::allbinary::util::BasicArrayListD'->new();
        $categoryVector->add($self->{category});
        return $categoryVector;
}


# throws Exception
sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


# throws Exception
sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


# throws Exception
sub validationInfo {
    my ($self) = @_;
        return undef;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::category::CategoryData;
use org::allbinary::business::category::hierarchy::CategoryHierarchyInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::category::properties::root::RootCategoryPropertiesInterface;

1;

