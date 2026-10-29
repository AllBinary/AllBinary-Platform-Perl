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

package org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::CssStyleValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::Validation','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{cssStyleElementVector} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of CssStyleValidation takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{cssStyleElementVector} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub _new1 {
    my ($class, $document) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{cssStyleElementVector} = 'org::allbinary::logic::visual::dhtml::style::StylesValidationFactory'->getInstance()->getInstance($document);
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{cssStyleElementVector} = 'org::allbinary::logic::visual::dhtml::style::StylesValidationFactory'->getInstance($hashMap);
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            my $isValid = 1;
            if ($org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{IS_VALID});
            }
            my $size = $self->{cssStyleElementVector}->size();
            for (my $i = 0; $i < $size; $i++) {
                my $styleValidationInterface = $self->{cssStyleElementVector}->get($i);
                if (!$styleValidationInterface->isValid()) {
                    $isValid = 0;
                }
            }
            if ($org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("End: " . $isValid, $self, $self->{commonStrings}->{IS_VALID});
            }
            return $isValid;
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
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
            if ($org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
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
        my $node = $document->createElement('org::allbinary::logic::visual::dhtml::style::StylesData'->getInstance()->{NAME});
        my $styleNode = $document->createElement('org::allbinary::logic::visual::dhtml::style::StyleData'->getInstance()->{NAME});
        $node->appendChild($styleNode);
        my $size = $self->{cssStyleElementVector}->size();
        for (my $i = 0; $i < $size; $i++) {
            my $styleDomNodeInterface = $self->{cssStyleElementVector}->get($i);
            $styleNode->appendChild($styleDomNodeInterface->toXmlNode($document));
        }
        return $node;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::Validation;
use org::allbinary::logic::control::validate::ValidationInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::dhtml::style::StyleData;
use org::allbinary::logic::visual::dhtml::style::StylesData;
use org::allbinary::logic::visual::dhtml::style::StylesValidationFactory;
use org::w3c::dom::Document;
use org::w3c::dom::Node;

1;

