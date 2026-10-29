#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# III
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::visual::transform::template::customizer::includes::meta::MetaValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::Validation','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{label} = undef;
    $self->{name} = undef;
    $self->{httpEquiv} = undef;
    $self->{content} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new4(@arguments) if scalar(@arguments) == 4;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of MetaValidation takes " . scalar(@arguments) . " arguments";
}


sub _new4 {
    my ($class, $htmlMetaAttributeData, $label, $attributeValue, $contentValue) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{label} = $label;
        if ($htmlMetaAttributeData->equals('org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeDataFactory'->getInstance()->{HTTP_EQUIV})) {
            $self->{httpEquiv} = $attributeValue;
        } elsif ($htmlMetaAttributeData->equals('org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeDataFactory'->getInstance()->{NAME})) {
            $self->{name} = $attributeValue;
        }
        $self->{content} = $contentValue;
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


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $htmlMetaAttributeDataFactory = 'org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeDataFactory'->getInstance();
        $hashMap->put('org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaData'->getInstance()->{LABEL}->toString(), $self->{label});
        $hashMap->put($htmlMetaAttributeDataFactory->{NAME}->toString(), $self->{name});
        $hashMap->put($htmlMetaAttributeDataFactory->{HTTP_EQUIV}->toString(), $self->{httpEquiv});
        $hashMap->put($htmlMetaAttributeDataFactory->{CONTENT}->toString(), $self->{content});
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaData'->getInstance()->{NAME}->toString(), $self->toHashMap());
        return $node;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::Validation;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeData;
use org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeDataFactory;
use org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaData;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;

1;

