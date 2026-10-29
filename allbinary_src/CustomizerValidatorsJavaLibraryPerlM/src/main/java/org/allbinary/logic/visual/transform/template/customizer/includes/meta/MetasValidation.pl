#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# II
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::visual::transform::template::customizer::includes::meta::MetasValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::Validation','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{storeFrontInterface} = undef;
    $self->{metaValidationVector} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of MetasValidation takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $storeName) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{storeFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($storeName);
        $self->{metaValidationVector} = 'org::allbinary::util::BasicArrayListD'->new();
        my $contentValue = $self->{storeFrontInterface}->getName() . " E-Commerce Site";
        my $keywordsMetaValidation = 'org::allbinary::logic::visual::transform::template::customizer::includes::meta::MetaValidation'->new('org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeDataFactory'->getInstance()->{NAME}, "Keywords", 'org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeValuesData'->getInstance()->{KEYWORDS}, $contentValue);
        my $abstractMetaValidation = 'org::allbinary::logic::visual::transform::template::customizer::includes::meta::MetaValidation'->new('org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeDataFactory'->getInstance()->{NAME}, "Abstract", 'org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeValuesData'->getInstance()->{ABSTRACT}, $contentValue);
        my $descriptionMetaValidation = 'org::allbinary::logic::visual::transform::template::customizer::includes::meta::MetaValidation'->new('org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeDataFactory'->getInstance()->{NAME}, "Description", 'org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeValuesData'->getInstance()->{DESCRIPTION}, $contentValue);
        $self->{metaValidationVector}->add($keywordsMetaValidation);
        $self->{metaValidationVector}->add($abstractMetaValidation);
        $self->{metaValidationVector}->add($descriptionMetaValidation);
    return $self;
}


sub _new1 {
    my ($class, $document) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        die ('org::allbinary::string::CommonStrings'->getInstance()->{NOT_IMPLEMENTED});
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            my $valid = 1;
            return $valid;
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::template::customizer::includes::meta::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::includes::meta::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::template::customizer::includes::meta::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::includes::meta::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
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


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement('org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetasData'->getInstance()->{NAME});
        my $metaArray = $self->{metaValidationVector}->toArrayType([(undef) x ($self->{metaValidationVector}->size())]);
        my $size = scalar(@{$metaArray});
        for (my $i = 0; $i < $size; $i++) {
            my $metaValidation = $metaArray->[$i];
            $node->appendChild($metaValidation->toXmlNode($document));
        }
        return $node;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::Validation;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeDataFactory;
use org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeValuesData;
use org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetasData;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::transform::template::customizer::includes::meta::MetaValidation;

1;

