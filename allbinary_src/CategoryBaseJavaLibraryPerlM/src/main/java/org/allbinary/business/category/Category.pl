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

package org::allbinary::business::category::Category;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::CategoryInterface';

our $NOT_ROOT = "This is not the root so it has no file path.";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{categoryHierarchyInterface} = undef;
    $self->{categoryPropertiesInterface} = undef;
    $self->{childCategoryVector} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{typeVector} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{PROPERTIES} = 1;
    $self->{CATEGORY} = 0;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of Category takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $categoryPropertiesFactoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            $self->{logUtil}->putF($self->{commonStrings}->{CONSTRUCTOR}, $self, "Category(CategoryPropertiesFactoryInterface)");
        }
        $self->{categoryPropertiesInterface} = $categoryPropertiesFactoryInterface->getInstance();
        $self->{categoryHierarchyInterface} = 'org::allbinary::business::category::hierarchy::CategoryHierarchy'->new($self, $self);
        $self->log();
    return $self;
}


sub _new2 {
    my ($class, $categoryPropertiesFactoryInterface, $level) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{categoryPropertiesInterface} = $categoryPropertiesFactoryInterface->getInstance();
        $self->{categoryHierarchyInterface} = 'org::allbinary::business::category::hierarchy::CategoryHierarchy'->new($self, $self, $level);
        $self->log();
    return $self;
}


sub _new3 {
    my ($class, $rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesFactoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{categoryPropertiesInterface} = $categoryPropertiesFactoryInterface->getInstance();
        $self->{categoryHierarchyInterface} = 'org::allbinary::business::category::hierarchy::CategoryHierarchy'->new($rootCategoryInterface, $parentCategoryInterface);
        $self->log();
    return $self;
}


# throws Exception
sub getKey {
    my ($self) = @_;
        return $self->{categoryPropertiesInterface}->getKey();
}


# throws Exception
sub getRootFilePath {
    my ($self) = @_;
        my $rootAbPath = 'org::allbinary::logic::io::path::AbPath'->new($NOT_ROOT, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        my $categoryInterface = $self->{categoryHierarchyInterface}->getRoot();
        if ($categoryInterface->getProperties()->isRoot()) {
            my $rootCategoryPropertiesInterface = $categoryInterface->getProperties();
            $rootAbPath = $rootCategoryPropertiesInterface->getRootFilePath();
        }
        return $rootAbPath;
}


# throws Exception
sub getFilePath {
    my ($self) = @_;
        return 'org::allbinary::logic::io::path::AbPath'->new($self->getRootFilePath()->toString() . $self->getProperties()->getPath($self->getHierarchy())->toString(), $self->getProperties()->getFileName());
}


# throws Exception
sub getWebAppPath {
    my ($self) = @_;
        my $categoryInterface = $self->{categoryHierarchyInterface}->getRoot();
        return $categoryInterface->getProperties()->getWebAppPath();
}


# throws Exception
sub getPath {
    my ($self) = @_;
        return $self->{categoryPropertiesInterface}->getPath($self->{categoryHierarchyInterface});
}


sub addChildProperty {
    my ($self, $categoryPropertiesInterface) = @_;
        $self->{typeVector}->add($self->{PROPERTIES});
        return $self->{childCategoryVector}->add($categoryPropertiesInterface);
}


sub addChild {
    my ($self, $categoryInterface) = @_;
        $self->removeDuplicateChild($categoryInterface);
        if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            $self->{logUtil}->putF("adding", $self, "addChild");
        }
        my $childCategoryHierarchyInterface = $categoryInterface->getHierarchy();
        $childCategoryHierarchyInterface->setParent($self);
        $childCategoryHierarchyInterface->setRoot($self->getHierarchy()->getRoot());
        $categoryInterface->setHierarchy($childCategoryHierarchyInterface);
        $self->{typeVector}->add($self->{CATEGORY});
        return $self->{childCategoryVector}->add($categoryInterface);
}


sub getChildNodes {
    my ($self) = @_;
        return $self->{childCategoryVector};
}


sub removeChild {
    my ($self, $categoryInterface) = @_;
        my $removalVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $bool_return = 0;
        my $size = $self->{childCategoryVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            if ($self->{CATEGORY} == $self->{typeVector}->get($index)) {
                my $anyType = $self->{childCategoryVector}->get($index);
                my $currentCategoryInterface = $anyType;
                if ($currentCategoryInterface->getProperties()->getValue()->compareTo($categoryInterface->getProperties()->getValue()) == 0) {
                    $removalVector->add($currentCategoryInterface);
                    $bool_return = 1;
                }
            }
        }
        $self->removal($removalVector);
        return $bool_return;
}


sub removal {
    my ($self, $removalVector) = @_;
        my $removalSize = $removalVector->size();
        for (my $index = 0; $index < $removalSize; $index++) {
            my $anyType = $removalVector->get($index);
            my $objectIndex = $self->{childCategoryVector}->indexOf($anyType);
            $self->{typeVector}->remove($objectIndex);
            $self->{childCategoryVector}->remove($objectIndex);
        }
}


sub removeDuplicateChild {
    my ($self, $categoryInterface) = @_;
        my $removalVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $bool_return = 0;
        my $size = $self->{childCategoryVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $anyType = $self->{childCategoryVector}->get($index);
            if ($self->{PROPERTIES} == $self->{typeVector}->get($index)) {
                my $categoryPropertiesInterface = $anyType;
                if ($categoryInterface->getProperties()->getValue()->compareTo($categoryPropertiesInterface->getValue()) == 0) {
                    $removalVector->add($categoryPropertiesInterface);
                    $bool_return = 1;
                    last;
                }
            } elsif ($self->{CATEGORY} == $self->{typeVector}->get($index)) {
                my $existingCategoryInterface = $anyType;
                my $categoryPropertiesInterface = $existingCategoryInterface->getProperties();
                if ($categoryInterface->getProperties()->getValue()->compareTo($categoryPropertiesInterface->getValue()) == 0) {
                    $removalVector->add($existingCategoryInterface);
                    $bool_return = 1;
                    last;
                }
            }
        }
        $self->removal($removalVector);
        return $bool_return;
}


# throws Exception
sub isLeaf {
    my ($self) = @_;
        if (!defined($self->{childCategoryVector})) {
            die ("Category Error");
        }
        if ($self->{childCategoryVector}->size() == 0) {
            return 1;
        } else {
            return 0;
        }
}


sub getProperties {
    my ($self) = @_;
        return $self->{categoryPropertiesInterface};
}


sub setProperties {
    my ($self, $categoryPropertiesInterface) = @_;
        $self->{categoryPropertiesInterface} = $categoryPropertiesInterface;
}


sub getHierarchy {
    my ($self) = @_;
        return $self->{categoryHierarchyInterface};
}


sub setHierarchy {
    my ($self, $categoryHierarchyInterface) = @_;
        $self->{categoryHierarchyInterface} = $categoryHierarchyInterface;
}


# throws Exception
sub isValid {
    my ($self) = @_;
        if (!$self->{categoryPropertiesInterface}->isValid()) {
            return 0;
        }
        my $size = $self->{childCategoryVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $anyType = $self->{childCategoryVector}->get($index);
            if ($self->{PROPERTIES} == $self->{typeVector}->get($index)) {
                my $categoryPropertiesInterface = $anyType;
                if (!$categoryPropertiesInterface->isValid()) {
                    return 0;
                }
            } elsif ($self->{CATEGORY} == $self->{typeVector}->get($index)) {
                my $categoryInterface = $anyType;
                if (!$categoryInterface->isValid()) {
                    return 0;
                }
            }
        }
        return 1;
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


# throws Exception
sub toHashMap {
    my ($self) = @_;
        my $categoryHashMap = $self->{categoryPropertiesInterface}->toHashMap();
        return $categoryHashMap;
}


# throws Exception
sub toVector {
    my ($self) = @_;
        my $categoryVector = $self->{categoryPropertiesInterface}->toVector();
        $categoryVector->add($self->{childCategoryVector});
        return $categoryVector;
}


# throws Exception
sub log {
    my ($self) = @_;
        if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Category Name: ");
            $stringBuffer->append($self->{categoryPropertiesInterface}->getValue());
            $stringBuffer->append("\nPath = ");
            $stringBuffer->append($self->getPath()->toString());
            $stringBuffer->append("\nFile Path: ");
            $stringBuffer->append($self->getFilePath()->toString());
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "log()");
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::category::hierarchy::CategoryHierarchy;
use org::allbinary::business::category::hierarchy::CategoryHierarchyInterface;
use org::allbinary::business::category::properties::CategoryPropertiesFactoryInterface;
use org::allbinary::business::category::properties::CategoryPropertiesInterface;
use org::allbinary::business::category::properties::root::RootCategoryPropertiesInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::category::CategoryInterface;

1;

