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

package org::allbinary::business::category::properties::CategoryProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::properties::CategoryPropertiesInterface';

our $MAXDEPTH = 100;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{category} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of CategoryProperties takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{category} = $name;
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{category} = 'org::allbinary::business::category::CategoryUtil'->getNameFromNode($node);
    return $self;
}


sub _new1 {
    my ($class, $categoryPropertiesHashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{category} = ("" . $categoryPropertiesHashMap->get('org::allbinary::business::category::CategoryData'->getInstance()->{NAME}));
    return $self;
}


sub isRealRoot {
    my ($self) = @_;
        return 0;
}


sub isRoot {
    my ($self) = @_;
        return 0;
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
sub getPath {
    my ($self, $categoryHierarchyInterface) = @_;
        my $abPathData = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
        my $pathStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        my $nextParentCategoryInterface = $categoryHierarchyInterface->getParent();
        if ($self != $nextParentCategoryInterface->getProperties()) {
            my $depthIndex = 0;
            while (defined($nextParentCategoryInterface)) {
                if ($nextParentCategoryInterface->getProperties()->isRealRoot()) {
                    last;
                }
                if ($nextParentCategoryInterface->getProperties()->isRoot()) {
                    $list->addAt(0, $nextParentCategoryInterface->getPath()->toString());
                } else {
                    $pathStringBuffer->delete(0, $pathStringBuffer->length());
                    $list->addAt(0, $pathStringBuffer->append($abPathData->{SEPARATOR})->append($nextParentCategoryInterface->getProperties()->getValue())->toString());
                }
                if ($nextParentCategoryInterface == $nextParentCategoryInterface->getHierarchy()->getParent()) {
                    last;
                }
                $nextParentCategoryInterface = $nextParentCategoryInterface->getHierarchy()->getParent();
                $depthIndex++;
                if ($depthIndex > $org::allbinary::business::category::properties::CategoryProperties::MAXDEPTH) {
                    die ("Probably Major Error");
                }
            }
        }
        $pathStringBuffer->delete(0, $pathStringBuffer->length());
        $pathStringBuffer->append($abPathData->{SEPARATOR})->append($self->getValue());
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            $pathStringBuffer->append($list->get($index));
        }
        $pathStringBuffer->append($abPathData->{SEPARATOR});
        if ($org::allbinary::business::category::properties::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::properties::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            $self->{logUtil}->putF("path = " . $pathStringBuffer->toString(), $self, "getPath");
        }
        return 'org::allbinary::logic::io::path::AbPath'->new($pathStringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


sub getFileName {
    my ($self) = @_;
        return $self->getValue() + 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP} + 'org::allbinary::business::category::CategoryData'->getInstance()->{UNCRYPTED_EXTENSION};
}


# throws Exception
sub getWebAppPath {
    my ($self) = @_;
        die ("Not Root");
}


sub setValue {
    my ($self, $value) = @_;
        $self->{category} = $value;
}


sub isValid {
    my ($self) = @_;
        my $returnBoolean = 0;
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($self->{category}, 1, $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING)) {
            $returnBoolean = 1;
        }
        return $returnBoolean;
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
use org::allbinary::business::category::CategoryData;
use org::allbinary::business::category::CategoryInterface;
use org::allbinary::business::category::CategoryUtil;
use org::allbinary::business::category::hierarchy::CategoryHierarchyInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlData;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::category::properties::CategoryPropertiesInterface;

1;

