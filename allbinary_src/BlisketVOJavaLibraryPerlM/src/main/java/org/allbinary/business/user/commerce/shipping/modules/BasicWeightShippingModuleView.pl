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

package org::allbinary::business::user::commerce::shipping::modules::BasicWeightShippingModuleView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::shipping::modules::BasicWeightShippingModule','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub isValid {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


sub validationInfo {
    my ($self) = @_;
        return undef;
}


sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $shippingMethodNode = $document->createElement($org::allbinary::business::user::commerce::shipping::ShippingMethodData::NAME);
            $shippingMethodNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::shipping::ShippingMethodData::NAME, $self->getName()));
            $shippingMethodNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::shipping::ShippingMethodData::DESCRIPTION, $self->getDescription()));
            return $shippingMethodNode;
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::shipping::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::shipping::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "toXmlNode", $e);
            }
            return undef;
        }
}


sub toXmlDoc {
    my ($self) = @_;
        try {
            my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
            return $document;
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::shipping::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::shipping::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "toXmlDoc", $e);
            }
            return undef;
        }
}


sub view {
    my ($self) = @_;
        try {
            return $self->{commonStrings}->{NOT_IMPLEMENTED};
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::shipping::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::shipping::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view", $e);
            }
            return undef;
        }
}

use org::allbinary::business::user::commerce::shipping::ShippingMethodData;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::user::commerce::shipping::modules::BasicWeightShippingModule;

1;

