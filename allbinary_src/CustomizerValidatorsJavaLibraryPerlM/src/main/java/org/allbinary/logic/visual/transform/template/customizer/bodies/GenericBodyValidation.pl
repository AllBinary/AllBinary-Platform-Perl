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

package org::allbinary::logic::visual::transform::template::customizer::bodies::GenericBodyValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::Validation','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{body} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of GenericBodyValidation takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{body} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    return $self;
}


sub _new1 {
    my ($class, $document) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $nodeList = $document->getElementsByTagName('org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData'->getInstance()->{NAME});
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $aBodyNode = $nodeList->item($index);
            my $aBodyValueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::data::tree::dom::DomData::VALUE, $aBodyNode->getChildNodes());
            $self->{body} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($aBodyValueNode);
        }
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
        $self->{body} = $hashMap->get('org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData'->getInstance()->{NAME});
}


sub isValid {
    my ($self) = @_;
        try {
            my $isValid = 1;
            if ($org::allbinary::logic::visual::transform::template::customizer::bodies::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{IS_VALID});
            }
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidNotRequired($self->{body}, 'org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData'->getInstance()->{MIN}, $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB)) {
                $isValid = 0;
            }
            if ($org::allbinary::logic::visual::transform::template::customizer::bodies::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("BodyValidation: " . $isValid, $self, $self->{commonStrings}->{IS_VALID});
            }
            return $isValid;
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::template::customizer::bodies::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
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
            if ($org::allbinary::logic::visual::transform::template::customizer::bodies::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::bodies::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
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
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData'->getInstance()->{NAME}, $self->{body});
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
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData;

1;

