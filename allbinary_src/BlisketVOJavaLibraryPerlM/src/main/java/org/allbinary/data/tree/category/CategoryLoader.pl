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

package org::allbinary::data::tree::category::CategoryLoader;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::category::CategoryModifierTree','org::allbinary::data::tree::category::CategoryLoaderInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $categoryFactoryInterface) = @_;
    my $self = $class->SUPER::new($categoryFactoryInterface);
    $self->_init_fields();
        # super(...) made $self above
        if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "CategoryLoader(CategoryFactoryInterface categoryFactoryInterface)");
        }
    return $self;
}


sub getDoc {
    my ($self, $categoryInterface) = @_;
        try {
            if (defined($categoryInterface->getProperties()->getPath($categoryInterface->getHierarchy()))) {
                if ($categoryInterface->getHierarchy()->getLevel() == 1) {
                    my $rootAbFile = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($categoryInterface->getRootFilePath());
                    if (!$rootAbFile->isDirectory()) {
                        $rootAbFile->mkdirs();
                        if (!$rootAbFile->isDirectory()) {
                            die ("Could Not Create Directory");
                        }
                        $self->save($categoryInterface);
                    }
                }
                my $fileAbPath = $categoryInterface->getFilePath();
                my $cryptFileReader = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new('org::allbinary::business::category::CategoryData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::business::category::CategoryData'->getInstance()->{ENCRYPTED_EXTENSION});
                my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($cryptFileReader->get($fileAbPath));
                return $document;
            } else {
                die ("Null Category");
            }
        } catch ($e) {
            if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                try {
                    $categoryInterface->log();
                } catch ($e2) {
                    $self->{logUtil}->put("Could Not Log Category", $self, "getDoc", $e);
                }
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "getDoc", $e);
            }
            return undef;
        }
}


sub get {
    my ($self, $categoryInterface) = @_;
        try {
            my $document = $self->getDoc($categoryInterface);
            my $categoryNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::business::category::CategoryData'->getInstance()->{NAME}, $document->getChildNodes());
            return $self->addProperties($categoryInterface, $categoryNode->getChildNodes());
        } catch ($e) {
            if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{GET}, $e);
            }
            return undef;
        }
}


# Java overloaded method: Perl keeps the last definition
sub get {
    my ($self, $document) = @_;
        try {
            my $categoryNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::business::category::CategoryData'->getInstance()->{NAME}, $document->getChildNodes());
            my $loadedCategoryInterface = $self->{categoryFactoryInterface}->getRootInstanceFromNode($categoryNode);
            return $self->addProperties($loadedCategoryInterface, $categoryNode->getChildNodes());
        } catch ($e) {
            if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{GET}, $e);
            }
            return undef;
        }
}


sub getAll {
    my ($self, $categoryInterface) = @_;
        try {
            my $document = $self->getDoc($categoryInterface);
            return $self->getAll($document);
        } catch ($e) {
            if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{GET}, $e);
            }
            return undef;
        }
}


# Java overloaded method: Perl keeps the last definition
sub getAll {
    my ($self, $document) = @_;
        try {
            my $categoryNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::business::category::CategoryData'->getInstance()->{NAME}, $document->getChildNodes());
            my $loadedCategoryInterface = $self->{categoryFactoryInterface}->getRootInstanceFromNode($categoryNode);
            return $self->addProperties($loadedCategoryInterface, $categoryNode->getChildNodes());
        } catch ($e) {
            if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{GET}, $e);
            }
            return undef;
        }
}


# Java overloaded method: Perl keeps the last definition
sub getAll {
    my ($self, $parentCategoryInterface, $categoryNodeList) = @_;
        try {
            if (defined($categoryNodeList)) {
                for (my $index = 0; $index < $categoryNodeList->getLength(); $index++) {
                    my $categoryNode = $categoryNodeList->item($index);
                    if (defined($categoryNode) && $categoryNode->getNodeName()->compareTo('org::allbinary::business::category::CategoryData'->getInstance()->{NAME}) == 0) {
                        my $categoryInterface = $self->{categoryFactoryInterface}->getInstance($parentCategoryInterface->getHierarchy()->getRoot(), $parentCategoryInterface, $categoryNode);
                        $parentCategoryInterface->addChild($categoryInterface);
                    }
                }
            }
            return $parentCategoryInterface;
        } catch ($e) {
            if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{GET}, $e);
            }
            return undef;
        }
}


sub addProperties {
    my ($self, $loadedCategoryInterface, $categoryNodeList) = @_;
        try {
            if (defined($categoryNodeList)) {
                for (my $index = 0; $index < $categoryNodeList->getLength(); $index++) {
                    my $categoryNode = $categoryNodeList->item($index);
                    if (defined($categoryNode) && $categoryNode->getNodeName()->compareTo('org::allbinary::business::category::CategoryData'->getInstance()->{NAME}) == 0) {
                        my $categoryPropertiesInterface = 'org::allbinary::business::category::properties::CategoryProperties'->new($categoryNode);
                        $loadedCategoryInterface->addChildProperty($categoryPropertiesInterface);
                    }
                }
            }
            return $loadedCategoryInterface;
        } catch ($e) {
            if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{GET}, $e);
            }
            return undef;
        }
}

use org::allbinary::business::category::CategoryData;
use org::allbinary::business::category::CategoryFactoryInterface;
use org::allbinary::business::category::CategoryInterface;
use org::allbinary::business::category::properties::CategoryProperties;
use org::allbinary::business::category::properties::CategoryPropertiesInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::crypt::file::CryptFileReader;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::path::AbPath;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::data::tree::category::CategoryModifierTree;
use org::allbinary::data::tree::category::CategoryLoaderInterface;

1;

