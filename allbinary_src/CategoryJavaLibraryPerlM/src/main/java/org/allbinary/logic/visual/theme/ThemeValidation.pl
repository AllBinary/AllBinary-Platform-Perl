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

package org::allbinary::logic::visual::theme::ThemeValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::theme::ThemeInterface','org::allbinary::logic::control::validate::ValidationInterface','org::allbinary::data::tree::dom::DomNodeInterface','org::allbinary::logic::visual::transform::info::CompositeTransformInfoInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{transformInfoInterface} = undef;
    $self->{styleValidationInterface} = undef;
    $self->{themeName} = undef;
    $self->{themePreviewImageName} = undef;
    $self->{webAppAbPath} = undef;
    $self->{categoryAbPath} = undef;
    $self->{fileAbPath} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of ThemeValidation takes " . scalar(@arguments) . " arguments";
}


sub _new3 {
    my ($class, $transformInfoInterface, $cssStyleValidation, $categoryThemePath) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{transformInfoInterface} = $transformInfoInterface;
        my $pathData = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
        my $pathUtil = 'org::allbinary::logic::io::path::PathUtil'->getInstance();
        $self->{categoryAbPath} = $pathUtil->removeNameFromPath($categoryThemePath);
        $self->{themeName} = $pathData->getNameFromPath($categoryThemePath);
        $self->{styleValidationInterface} = $cssStyleValidation;
        $self->init();
    return $self;
}


sub _new2 {
    my ($class, $transformInfoInterface, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{transformInfoInterface} = $transformInfoInterface;
        my $categoryThemeAbPath = 'org::allbinary::logic::io::path::AbPath'->new($hashMap->get('org::allbinary::logic::visual::theme::ThemeData'->getInstance()->{PATH}), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        my $pathData = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
        my $pathUtil = 'org::allbinary::logic::io::path::PathUtil'->getInstance();
        $self->{categoryAbPath} = $pathUtil->removeNameFromPath($categoryThemeAbPath->toString());
        $self->{themeName} = $pathData->getNameFromPath($categoryThemeAbPath->toString());
        if ($org::allbinary::logic::visual::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("CategoryThemePath: ");
            $stringBuffer->append($categoryThemeAbPath->toString());
            $stringBuffer->append(" & CategoryPath: ");
            $stringBuffer->append($self->{categoryAbPath}->toString());
            $stringBuffer->append(" & ThemeName: ");
            $stringBuffer->append($self->{themeName});
            $self->{logUtil}->putF("Http Request Constructor", $self, $stringBuffer->toString());
        }
        $self->init();
    return $self;
}


sub _new2 {
    my ($class, $storeThemeCategoryInterface, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{transformInfoInterface} = $storeThemeCategoryInterface->getTransformInfoInterface();
        $self->{categoryAbPath} = $storeThemeCategoryInterface->getPath();
        my $themeNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::visual::theme::ThemeData'->getInstance()->{NAME}, $node->getChildNodes());
        my $valueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::data::tree::dom::DomData::VALUE, $themeNameNode->getChildNodes());
        $self->{themeName} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($valueNode);
        my $previewImageNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::visual::theme::ThemeData'->getInstance()->{PREVIEW_IMAGE_NAME}, $node->getChildNodes());
        my $previewImageNameValueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::data::tree::dom::DomData::VALUE, $previewImageNameNode->getChildNodes());
        $self->{themePreviewImageName} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($previewImageNameValueNode);
        $self->{webAppAbPath} = $storeThemeCategoryInterface->getWebAppPath();
        $self->init($storeThemeCategoryInterface);
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        my $categoryFactoryInterface = 'org::allbinary::business::category::store::theme::StoreThemeCategoryFactory'->new($self->getTransformInfoInterface());
        my $categoryLoaderInterface = 'org::allbinary::data::tree::category::CategoryLoaderFactory'->getInstance($categoryFactoryInterface);
        my $rootStoreThemeCategoryInterface = $categoryFactoryInterface->getRootInstance();
        $self->init($rootStoreThemeCategoryInterface);
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub init {
    my ($self, $storeThemeCategoryInterface) = @_;
        $self->{fileAbPath} = 'org::allbinary::logic::io::path::AbPath'->new($storeThemeCategoryInterface->getRootFilePath()->toString() . $self->{categoryAbPath}->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        $self->{webAppAbPath} = $storeThemeCategoryInterface->getWebAppPath();
}


# throws Exception
sub getTransformInfoInterface {
    my ($self) = @_;
        return $self->{transformInfoInterface};
}


sub getName {
    my ($self) = @_;
        return $self->{themeName};
}


sub getPreviewImageName {
    my ($self) = @_;
        return $self->{themePreviewImageName};
}


sub getPreviewImagePath {
    my ($self) = @_;
        return $self->{webAppAbPath}->toString() . $self->{categoryAbPath}->toString();
}


sub getPath {
    my ($self) = @_;
        return $self->{categoryAbPath}->toString();
}


# throws Exception
sub getCssStyleValidation {
    my ($self) = @_;
        if (!defined($self->{styleValidationInterface})) {
            my $cssStyleFileAbPath = 'org::allbinary::logic::io::path::AbPath'->new($self->{fileAbPath}->toString(), $self->{themeName} . 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP} . 'org::allbinary::business::category::CategoryData'->getInstance()->{UNCRYPTED_EXTENSION});
            my $cryptFileReader = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new('org::allbinary::business::category::CategoryData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::business::category::CategoryData'->getInstance()->{ENCRYPTED_EXTENSION});
            my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($cryptFileReader->get($cssStyleFileAbPath));
            $self->{styleValidationInterface} = 'org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::CssStyleValidation'->new($document);
        }
        return $self->{styleValidationInterface};
}


sub isValid {
    my ($self) = @_;
        try {
            my $isValid = 1;
            if ($org::allbinary::logic::visual::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{IS_VALID});
            }
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($self->{categoryAbPath}->toString(), $org::allbinary::logic::communication::sql::AbSqlData::MINSTRING, $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING)) {
                $isValid = 0;
            }
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($self->{themeName}, $org::allbinary::logic::communication::sql::AbSqlData::MINSTRING, $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING)) {
                $isValid = 0;
            }
            if (!$self->getCssStyleValidation()->isValid()) {
                $isValid = 0;
            }
            if ($org::allbinary::logic::visual::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("End: " . $isValid, $self, $self->{commonStrings}->{IS_VALID});
            }
            return $isValid;
        } catch ($e) {
            if ($org::allbinary::logic::visual::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Theme Validation Error");
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::logic::visual::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Validating Form";
        }
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


sub getKey {
    my ($self) = @_;
        return $self->getName();
}


sub toVector {
    my ($self) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        $vector->add($self->getName());
        $vector->add($self->getPath());
        $vector->add($self->getPreviewImageName());
        $vector->add($self->getPreviewImagePath());
        return $vector;
}


sub toHashMap {
    my ($self) = @_;
        my $themeData = 'org::allbinary::logic::visual::theme::ThemeData'->getInstance();
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($themeData->{NAME}, $self->getName());
        $hashMap->put($themeData->{PATH}, $self->getPath());
        $hashMap->put($themeData->{PREVIEW_IMAGE_NAME}, $self->getPreviewImageName());
        $hashMap->put($themeData->{PREVIEW_IMAGE_PATH}, $self->getPreviewImagePath());
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::theme::ThemeData'->getInstance()->{NAME}, $self->toHashMap());
        my $domNodeInterface = $self->getCssStyleValidation();
        $node->appendChild($domNodeInterface->toXmlNode($document));
        return $node;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::category::CategoryData;
use org::allbinary::business::category::CategoryFactoryInterface;
use org::allbinary::business::category::store::theme::StoreThemeCategoryFactory;
use org::allbinary::business::category::store::theme::StoreThemeCategoryInterface;
use org::allbinary::data::tree::category::CategoryLoaderFactory;
use org::allbinary::data::tree::category::CategoryLoaderInterface;
use org::allbinary::data::tree::dom::DomData;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlData;
use org::allbinary::logic::control::crypt::file::CryptFileReader;
use org::allbinary::logic::control::validate::ValidationInterface;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::io::path::PathUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::info::CompositeTransformInfoInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::CssStyleValidation;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::theme::ThemeInterface;
use org::allbinary::logic::visual::theme::ThemeData;

1;

