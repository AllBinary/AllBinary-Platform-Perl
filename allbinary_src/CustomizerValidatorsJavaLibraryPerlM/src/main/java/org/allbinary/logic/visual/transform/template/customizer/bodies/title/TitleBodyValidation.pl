#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 leIIgal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::visual::transform::template::customizer::bodies::title::TitleBodyValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::Validation','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{body} = undef;
    $self->{titleValidation} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of TitleBodyValidation takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        if ($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $self->{body} = $stringUtil->{EMPTY_STRING};
        $self->{titleValidation} = 'org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleNotRequiredValidation'->new();
    return $self;
}


sub _new1 {
    my ($class, $document) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        if ($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF($self->{commonStrings}->{CONSTRUCTOR}, $self, "Constructor(document)");
        }
        my $nodeList = $document->getElementsByTagName('org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData'->getInstance()->{NAME});
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $aBodyNode = $nodeList->item($index);
            my $aBodyValueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::data::tree::dom::DomData::VALUE, $aBodyNode->getChildNodes());
            $self->{body} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($aBodyValueNode);
            my $titleNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{NAME}, $aBodyNode->getChildNodes());
            $self->{titleValidation} = 'org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleNotRequiredValidation'->new($titleNode);
            if ($index > 1) {
                if ($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("To Many Body Nodes", $self, $self->{commonStrings}->{CONSTRUCTOR});
                }
            }
        }
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        if ($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "Constructor(hashmap)");
        }
        $self->getFormData($hashMap);
    return $self;
}


# throws Exception
sub getFormData {
    my ($self, $hashMap) = @_;
        $self->{body} = $hashMap->get('org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData'->getInstance()->{NAME});
        $self->{titleValidation} = 'org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleNotRequiredValidation'->new($hashMap);
}


sub isValid {
    my ($self) = @_;
        try {
            my $isValid = 1;
            if ($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("TitleBodyValidation", $self, $self->{commonStrings}->{IS_VALID});
            }
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidNotRequired($self->{body}, 'org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData'->getInstance()->{MIN}, $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB)) {
                $isValid = 0;
            }
            if (!$self->{titleValidation}->isValid()) {
                $isValid = 0;
            }
            if ($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("TitleBodyValidation: " . $isValid, $self, $self->{commonStrings}->{IS_VALID});
            }
            return $isValid;
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            {
                $stringBuffer->append("Error: Data submitted is < ");
                $stringBuffer->appendint(int('org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData'->getInstance()->{MIN}));
                $stringBuffer->append(" or > ");
                $stringBuffer->appendint(int($org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB));
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
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
        if ($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Title Body: " . $self->{body}, $self, "toXmlNode(document)");
        }
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData'->getInstance()->{NAME}, $self->{body});
        $node->appendChild($self->{titleValidation}->toXmlNode($document));
        return $node;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomData;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlData;
use org::allbinary::logic::control::validate::Validation;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData;
use org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData;
use org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleNotRequiredValidation;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;

1;

