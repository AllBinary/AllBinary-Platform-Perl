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

package views::business::context::modules::storefront::customizer::includes::style::theme::EditThemeValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::customizer::includes::style::theme::ThemeCustomizerView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            my $isValid = 1;
            my $categoryFactoryInterface = 'org::allbinary::business::category::store::theme::StoreThemeCategoryFactory'->new($self->getTransformInfoInterface());
            my $categoryLoaderInterface = 'org::allbinary::data::tree::category::CategoryLoaderFactory'->getInstance($categoryFactoryInterface);
            my $rootStoreThemeCategoryInterface = $categoryFactoryInterface->getRootInstance();
            my $storeThemeCategoryInterface = $categoryLoaderInterface->getAll($rootStoreThemeCategoryInterface);
            $self->{validationInterface} = 'org::allbinary::business::category::store::theme::StoreThemeCategoryPathValidationView'->new($storeThemeCategoryInterface);
            $isValid = $self->{validationInterface}->isValid();
            my $domNodeInterface = $self->{validationInterface};
            my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
            $document->appendChild($domNodeInterface->toXmlNode($document));
            my $documentString = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($document);
            if ($views::business::context::modules::storefront::customizer::includes::style::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::includes::style::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->putF("Setting Data: " . $documentString, $self, $self->{commonStrings}->{CONSTRUCTOR});
            }
            $self->getTransformInfoInterface()->setData($documentString);
            return $isValid;
        } catch ($e) {
            if ($views::business::context::modules::storefront::customizer::includes::style::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::includes::style::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{validationInterface}->validationInfo());
            return $stringBuffer->toString();
        } catch ($e) {
            if ($views::business::context::modules::storefront::customizer::includes::style::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::includes::style::theme::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Getting Validation Info";
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

use org::allbinary::business::category::CategoryFactoryInterface;
use org::allbinary::business::category::CategoryInterface;
use org::allbinary::business::category::store::theme::StoreThemeCategoryFactory;
use org::allbinary::business::category::store::theme::StoreThemeCategoryInterface;
use org::allbinary::business::category::store::theme::StoreThemeCategoryPathValidationView;
use org::allbinary::data::tree::category::CategoryLoaderFactory;
use org::allbinary::data::tree::category::CategoryLoaderInterface;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::customizer::includes::style::theme::ThemeCustomizerView;

1;

