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

package views::admin::payment::gateways::PaymentGatewaysView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{paymentGatewayVector} = undef;
}


sub new {
    my ($class, $transformInfoInterface, $gatewayVector) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{paymentGatewayVector} = $gatewayVector;
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $storeName = $self->getTransformInfoInterface()->getStoreName();
            my $paymentGatewaysNode = $document->createElement($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewaysData::NAME);
            my $size = $self->{paymentGatewayVector}->size();
            for (my $index = 0; $index < $size; $index++) {
                my $paymentType = $self->{paymentGatewayVector}->get($index);
                my $hashMap = $paymentType->toHashMap();
                $hashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT}, 'org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil'->getInstance()->getDefault($storeName)->getBasicPaymentType()->getName());
                my $paymentGatewayNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, $org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString(), $hashMap);
                $paymentGatewaysNode->appendChild($paymentGatewayNode);
            }
            return $paymentGatewaysNode;
        } catch ($e) {
            if ($views::admin::payment::gateways::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::payment::gateways::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "toXmlNode", $e);
            }
            die $e;
        }
}


sub addDomNodeInterfaces {
    my ($self) = @_;
        $self->addDomNodeInterface($self);
}


sub view {
    my ($self) = @_;
        try {
            $self->addDomNodeInterfaces();
            return $self->SUPER::view();
        } catch ($e) {
            my $error = "Failed to view payment gateways";
            if ($views::admin::payment::gateways::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::payment::gateways::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            return $error;
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewaysData;
use org::allbinary::business::user::commerce::money::payment::types::BasicPaymentType;
use org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

