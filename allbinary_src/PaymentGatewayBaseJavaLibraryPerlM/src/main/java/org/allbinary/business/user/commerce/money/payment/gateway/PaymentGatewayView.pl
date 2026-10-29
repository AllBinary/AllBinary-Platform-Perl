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

package org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{paymentGatewayInterface} = undef;
}


sub new {
    my ($class, $paymentGatewayInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{paymentGatewayInterface} = $paymentGatewayInterface;
    return $self;
}


sub getPaymentGatewayInterface {
    my ($self) = @_;
        return $self->{paymentGatewayInterface};
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        try {
            if ($org::allbinary::business::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "toXmlNode");
            }
            my $hashMap = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayMapping'->new($self->{paymentGatewayInterface})->toHashMap();
            $hashMap->putAll($self->toHashMap());
            my $paymentGatewayNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, $org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString(), $hashMap);
            return $paymentGatewayNode;
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "toXmlNode", $e);
            }
            die $e;
        }
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayMapping;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;

1;

