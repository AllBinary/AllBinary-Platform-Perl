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

package views::business::context::modules::storefront::customizer::generic::page::PageValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::customizer::generic::page::PageView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        if ($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("View Name: " . $transformInfoInterface->getName(), $self, "PageViewValidation()");
        }
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            my $isValid = 1;
            if ($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{IS_VALID});
            }
            my $transformInfoEntityInterface = 'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance();
            my $pageObjectConfigInterface = $self->getTransformInfoInterface()->getObjectConfigInterface();
            my $allViewsToBeModifiedVector = $pageObjectConfigInterface->getGroupTransforms();
            if ($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Views To Be Modified: " . $allViewsToBeModifiedVector->size(), $self, "get(transformInfoInterface)");
            }
            my $size = $allViewsToBeModifiedVector->size();
            for (my $index = 0; $index < $size; $index++) {
                my $transformInfoInterface = $allViewsToBeModifiedVector->get($index);
                my $viewNameOfViewToBeModified = $transformInfoInterface->getName();
                if ($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append($self->getTransformInfoInterface()->getName());
                    $stringBuffer->append(" is modifying view: ");
                    $stringBuffer->append($viewNameOfViewToBeModified);
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, "insert()");
                }
                my $httpTransformInfoInterface = $self->getTransformInfoInterface();
                my $specifiedTransformInfoInterface = $transformInfoEntityInterface->get($viewNameOfViewToBeModified, $httpTransformInfoInterface->getPropertiesHashMap(), $httpTransformInfoInterface->getPageContext());
                if ($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append($self->getTransformInfoInterface()->getName());
                    $stringBuffer->append(" is adding data to view: ");
                    $stringBuffer->append($viewNameOfViewToBeModified);
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, "insert()");
                }
                my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
                my $title = $specifiedTransformInfoInterface->getName()->substring($self->getTransformInfoInterface()->getStoreName()->length());
                if (($title cmp "index") == 0) {
                    $hashMap->put('org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{TEXT}, $self->getTransformInfoInterface()->getStoreName() . " - Home Page");
                } else {
                    $hashMap->put('org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{TEXT}, $self->getTransformInfoInterface()->getStoreName() . " -" . $title);
                }
                my $pageValidation = 'org::allbinary::logic::visual::transform::template::customizer::page::PageValidation'->new($hashMap);
                if ($pageValidation->isValid() == 0) {
                    $isValid = 0;
                }
                if ($isValid == 1) {
                    my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
                    $document->appendChild($pageValidation->toXmlNode($document));
                    my $documentString = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($document);
                    if ($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                        $stringBuffer->append($viewNameOfViewToBeModified);
                        $stringBuffer->append(" is changing data in ");
                        $stringBuffer->append($specifiedTransformInfoInterface->getDataFilePath()->toString());
                        $stringBuffer->append(" to the following data:\n");
                        $stringBuffer->append($documentString);
                        $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
                    }
                    'views::business::context::modules::storefront::customizer::CustomizerUtil'->getInstance()->write($specifiedTransformInfoInterface, $documentString);
                }
            }
            return $isValid;
        } catch ($e) {
            if ($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            my $transformInfoEntityInterface = 'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance();
            my $objectConfig = $self->getTransformInfoInterface()->getObjectConfigInterface();
            my $httpTransformInfoInterface = $self->getTransformInfoInterface();
            my $allViewsToBeModifiedVector = $objectConfig->getGroupTransforms();
            my $size = $allViewsToBeModifiedVector->size();
            for (my $index = 0; $index < $size; $index++) {
                my $transformInfoInterface = $allViewsToBeModifiedVector->get($index);
                my $viewNameOfViewToBeModified = $transformInfoInterface->getName();
                my $specifiedTransformInfoInterface = $transformInfoEntityInterface->get($viewNameOfViewToBeModified, $httpTransformInfoInterface->getPropertiesHashMap(), $httpTransformInfoInterface->getPageContext());
                my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
                my $title = $specifiedTransformInfoInterface->getName()->substring($self->getTransformInfoInterface()->getStoreName()->length());
                if (($title cmp "index") == 0) {
                    $hashMap->put('org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{TEXT}, $self->getTransformInfoInterface()->getStoreName() . " - Home Page");
                } else {
                    $hashMap->put('org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{TEXT}, $self->getTransformInfoInterface()->getStoreName() . " -" . $title);
                }
                my $pageValidation = 'org::allbinary::logic::visual::transform::template::customizer::page::PageValidation'->new($hashMap);
                if ($pageValidation->isValid() == 0) {
                    $stringBuffer->append("TransformInfo Name for PageValidation:" . $specifiedTransformInfoInterface->getName());
                    $stringBuffer->append("PageValidation:" . $hashMap);
                    $stringBuffer->append("PageValidation Info:" . $pageValidation->validationInfo());
                }
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::generic::page::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "An auto generated page name was invalid.";
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

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::data::tables::transform::info::TransformInfoEntity;
use org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfo;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigInterface;
use org::allbinary::logic::visual::transform::template::customizer::page::PageValidation;
use org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::customizer::CustomizerUtil;
use views::business::context::modules::storefront::customizer::generic::page::PageView;

1;

