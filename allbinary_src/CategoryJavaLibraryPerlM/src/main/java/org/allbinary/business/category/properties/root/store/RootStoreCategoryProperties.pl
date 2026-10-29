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

package org::allbinary::business::category::properties::root::store::RootStoreCategoryProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::properties::root::RootCategoryPropertiesInterface','org::allbinary::business::category::properties::CategoryPropertiesInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{pathData} = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
    $self->{fileAbPath} = undef;
    $self->{abPath} = undef;
    $self->{category} = undef;
    $self->{isRealRoot} = undef;
    $self->{webAppAbPath} = undef;
    $self->{transformInfoInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of RootStoreCategoryProperties takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $transformInfoInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{transformInfoInterface} = $transformInfoInterface;
        $self->{abPath} = 'org::allbinary::logic::io::path::AbPath'->createAbPath();
        $self->{category} = 'org::allbinary::business::category::CategoryData'->getInstance()->{ROOTCATEGORY};
        $self->{isRealRoot} = 1;
        $self->initPath();
        $self->log();
    return $self;
}


sub _new2 {
    my ($class, $transformInfoInterface, $categoryAbPath) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{transformInfoInterface} = $transformInfoInterface;
        $self->{abPath} = $categoryAbPath;
        $self->{category} = $self->{pathData}->getNameFromPath($categoryAbPath->toString());
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{category})) {
            $self->{isRealRoot} = 1;
            $self->{category} = 'org::allbinary::business::category::CategoryData'->getInstance()->{ROOTCATEGORY};
        }
        $self->initPath();
        $self->log();
    return $self;
}


sub _new2 {
    my ($class, $transformInfoInterface, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{transformInfoInterface} = $transformInfoInterface;
        my $categoryPath = 'org::allbinary::business::category::CategoryUtil'->getNameFromNode($node);
        $self->{abPath} = 'org::allbinary::logic::io::path::AbPath'->new($categoryPath, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        $self->{category} = $self->{pathData}->getNameFromPath($categoryPath);
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{category})) {
            $self->{isRealRoot} = 1;
            $self->{category} = 'org::allbinary::business::category::CategoryData'->getInstance()->{ROOTCATEGORY};
        }
        $self->initPath();
        $self->log();
    return $self;
}


sub _new2 {
    my ($class, $transformInfoInterface, $categoryPropertiesHashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{transformInfoInterface} = $transformInfoInterface;
        my $categoryPath = ("" . $categoryPropertiesHashMap->get('org::allbinary::business::category::CategoryData'->getInstance()->{NAME}));
        $self->{abPath} = 'org::allbinary::logic::io::path::AbPath'->new($categoryPath, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        $self->{category} = $self->{pathData}->getNameFromPath($categoryPath);
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{category})) {
            $self->{isRealRoot} = 1;
            $self->{category} = 'org::allbinary::business::category::CategoryData'->getInstance()->{ROOTCATEGORY};
        }
        $self->initPath();
        $self->log();
    return $self;
}


# throws Exception
sub initPath {
    my ($self) = @_;
        my $transformInfoHttpStoreInterface = $self->{transformInfoInterface};
        my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($transformInfoHttpStoreInterface->getStoreName());
        my $postPath = $storeFrontInterface->getCurrentHostNamePath() + $storeFrontInterface->getCategoryPath();
        my $httpServletRequest = $transformInfoHttpStoreInterface->getPageContext()->getRequest();
        $self->{webAppAbPath} = 'org::allbinary::logic::io::path::AbPath'->new($httpServletRequest->getContextPath() . $postPath, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        $self->setRootFilePath('org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getMainPath() . $postPath, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}));
}


sub isRealRoot {
    my ($self) = @_;
        return $self->{isRealRoot};
}


sub isRoot {
    my ($self) = @_;
        return 1;
}


sub getKey {
    my ($self) = @_;
        return $self->getValue();
}


sub setPath {
    my ($self, $path) = @_;
        $self->{abPath} = $path;
}


sub setRootFilePath {
    my ($self, $value) = @_;
        $self->{fileAbPath} = $value;
}


sub getRootFilePath {
    my ($self) = @_;
        return $self->{fileAbPath};
}


sub getValue {
    my ($self) = @_;
        return $self->{category};
}


# throws Exception
sub getWebAppPath {
    my ($self) = @_;
        return $self->{webAppAbPath};
}


sub getPath {
    my ($self, $categoryHierarchyInterface) = @_;
        return $self->{abPath};
}


sub getFileName {
    my ($self) = @_;
        return $self->getValue() + 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP} + 'org::allbinary::business::category::CategoryData'->getInstance()->{UNCRYPTED_EXTENSION};
}


sub setValue {
    my ($self, $value) = @_;
        $self->{category} = $value;
}


sub isValid {
    my ($self) = @_;
        return 1;
}


sub toHashMap {
    my ($self) = @_;
        my $categoryHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $categoryHashMap->put('org::allbinary::business::category::CategoryData'->getInstance()->{NAME}, $self->getValue());
        return $categoryHashMap;
}


sub toVector {
    my ($self) = @_;
        my $categoryVector = 'org::allbinary::util::BasicArrayListD'->new();
        $categoryVector->add($self->getValue());
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


sub log {
    my ($self) = @_;
        if ($org::allbinary::business::category::properties::root::store::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::properties::root::store::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("filePath = ")->append($self->{fileAbPath}->toString())->append("\npath = ")->append($self->{abPath}->toString())->append("\ncategory = ")->append($self->{category})->toString(), $self, "log()");
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::category::CategoryData;
use org::allbinary::business::category::CategoryUtil;
use org::allbinary::business::category::hierarchy::CategoryHierarchyInterface;
use org::allbinary::business::category::properties::CategoryPropertiesInterface;
use org::allbinary::business::category::properties::root::RootCategoryPropertiesInterface;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;

1;

