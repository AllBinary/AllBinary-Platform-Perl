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

package org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{PAYMENTGATEWAYFILEPATHSTRING} = undef;
    $self->{SHIPPINGMETHODSFILENAME} = "paymentGatewayTypes.xml";
    $self->{defaultName} = undef;
    $self->{paymentTypeVector} = 'org::allbinary::util::BasicArrayListD'->new();
}


{ # Java static initializer
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $sep = 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR};
        $stringBuffer->append($sep);
        $stringBuffer->append("generic");
        $stringBuffer->append($sep);
        $stringBuffer->append("user");
        $stringBuffer->append($sep);
        $stringBuffer->append("commerce");
        $stringBuffer->append($sep);
        $stringBuffer->append("money");
        $stringBuffer->append($sep);
        $stringBuffer->append("payment");
        $stringBuffer->append($sep);
        $stringBuffer->append("gateway");
        $stringBuffer->append($sep);
        $self->{PAYMENTGATEWAYFILEPATHSTRING} = $stringBuffer->toString();
    return $self;
}


sub add {
    my ($self, $paymentType) = @_;
        $self->{paymentTypeVector}->add($paymentType);
}


# throws Exception
sub get {
    my ($self, $paymentTypeString) = @_;
        my $size = $self->{paymentTypeVector}->size();
        for (my $i = 0; $i < $size; $i++) {
            my $paymentType = $self->{paymentTypeVector}->get($i);
            if ($paymentType->getBasicPaymentType()->getName()->compareTo($paymentTypeString) == 0) {
                return $paymentType;
            }
        }
        die ("Unknown PaymentType: " . $paymentTypeString);
}


# throws Exception
sub initDefault {
    my ($self, $storeName) = @_;
        if ($org::allbinary::business::user::commerce::money::payment::types::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::payment::types::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PAYMENT})) {
            $self->{logUtil}->putF("initDefault Payment: " . $self->{defaultName}, $self, "initDefault");
        }
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{defaultName})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getMainPath());
            $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH});
            $stringBuffer->append($storeName);
            $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
            $stringBuffer->append($self->{PAYMENTGATEWAYFILEPATHSTRING});
            my $abPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), $self->{SHIPPINGMETHODSFILENAME});
            my $data = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{ENCRYPTED_EXTENSION})->get($abPath);
            my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($data);
            my $nodeList = $document->getElementsByTagName($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewaysData::NAME);
            for (my $index = 0; $index < $nodeList->getLength(); $index++) {
                my $node = $nodeList->item($index);
                my $defaultPaymentGatewayNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT}, $node->getChildNodes());
                my $defaultPaymentGatewayNodeValue = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($defaultPaymentGatewayNode);
                if ($org::allbinary::business::user::commerce::money::payment::types::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::payment::types::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PAYMENT})) {
                    $self->{logUtil}->putF("DefaultPaymentGatewayNodeValue: " . $defaultPaymentGatewayNodeValue, $self, "initDefault");
                }
                if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($defaultPaymentGatewayNodeValue)) {
                    $self->{defaultName} = $defaultPaymentGatewayNodeValue;
                }
            }
        }
}


# throws Exception
sub getDefault {
    my ($self, $storeName) = @_;
        if ($org::allbinary::business::user::commerce::money::payment::types::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::payment::types::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PAYMENT})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getDefault");
        }
        $self->initDefault($storeName);
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{defaultName})) {
            return $self->get($self->{defaultName});
        }
        die ("No Default: " . $self->{defaultName});
}


sub isContain {
    my ($self, $paymentType) = @_;
        return $self->{paymentTypeVector}->contains($paymentType);
}


sub difference {
    my ($self, $a_PaymentTypeVector) = @_;
        my $diff = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $self->{paymentTypeVector}->size();
        for (my $i = 0; $i < $size; $i++) {
            my $paymentType = $self->{paymentTypeVector}->get($i);
            if (!$a_PaymentTypeVector->contains($paymentType)) {
                $diff->add($paymentType);
            }
        }
        return $diff;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewaysData;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::crypt::file::CryptFileReader;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;

1;

