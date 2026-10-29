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

package org::allbinary::logic::visual::transform::template::customizer::hedges::heading::HeadingValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::Validation','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{title} = undef;
    $self->{logo} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of HeadingValidation takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{title} = 'org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleValidation'->new();
        $self->{logo} = 'org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoValidation'->new();
    return $self;
}


sub _new1 {
    my ($class, $document) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $headingNodeList = $document->getElementsByTagName($org::allbinary::logic::visual::transform::template::customizer::hedges::heading::HeadingData::NAME);
        my $titleNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{NAME}, $headingNodeList->item(0)->getChildNodes());
        my $logoNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData'->getInstance()->{NAME}, $headingNodeList->item(0)->getChildNodes());
        $self->{title} = 'org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleValidation'->new($titleNode);
        $self->{logo} = 'org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoValidation'->new($logoNode);
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->getFormData($hashMap);
    return $self;
}


# throws Exception
sub getFormData {
    my ($self, $hashMap) = @_;
        $self->{title} = 'org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleValidation'->new($hashMap);
        $self->{logo} = 'org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoValidation'->new($hashMap);
}


sub isValid {
    my ($self) = @_;
        try {
            my $valid = 1;
            my $titleValid = 1;
            my $logoValid = 1;
            if ($org::allbinary::logic::visual::transform::template::customizer::hedges::heading::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::hedges::heading::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{IS_VALID});
            }
            if (!$self->{title}->isValid()) {
                $titleValid = 0;
            }
            if (!$self->{logo}->isValid()) {
                $logoValid = 0;
            } else {
                $self->{logo}->processLogoFile();
            }
            if (!$titleValid && !$logoValid) {
                $valid = 0;
            }
            if ($org::allbinary::logic::visual::transform::template::customizer::hedges::heading::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::hedges::heading::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("HeadingValidation: " . $valid, $self, $self->{commonStrings}->{IS_VALID});
            }
            return $valid;
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::template::customizer::hedges::heading::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::hedges::heading::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $valid = 1;
            my $titleValid = 1;
            my $logoValid = 1;
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if (!$self->{title}->isValid()) {
                $titleValid = 0;
            }
            if (!$self->{logo}->isValid()) {
                $logoValid = 0;
            }
            if (!$titleValid && !$logoValid) {
                $valid = 0;
            }
            if (!$valid) {
                $stringBuffer->append("Include a title and/or logo for the header.");
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::template::customizer::hedges::heading::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::hedges::heading::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
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
        my $node = $document->createElement($org::allbinary::logic::visual::transform::template::customizer::hedges::heading::HeadingData::NAME);
        $node->appendChild($self->{logo}->toXmlNode($document));
        $node->appendChild($self->{title}->toXmlNode($document));
        return $node;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::Validation;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData;
use org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoValidation;
use org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData;
use org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleValidation;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::visual::transform::template::customizer::hedges::heading::HeadingData;

1;

