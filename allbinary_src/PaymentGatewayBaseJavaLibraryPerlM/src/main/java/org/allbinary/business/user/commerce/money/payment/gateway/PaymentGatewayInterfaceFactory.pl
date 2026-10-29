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

package org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $httpServletRequest) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        try {
            if ($org::allbinary::business::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PAYMENT})) {
                $self->{logUtil}->putF("Getting", $self, $commonStrings->{GET_INSTANCE});
            }
            return $self->getInstance('org::allbinary::logic::communication::http::request::RequestParams'->new($httpServletRequest)->toHashMap());
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PAYMENTERROR})) {
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "getInstance(HttpServletRequest)", $e);
            }
            die $e;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $paymentType) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString(), $paymentType->getName());
        return $self->getInstance($hashMap);
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $hashMap) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        try {
            my $gatewayName = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString());
            my $paymentType = 'org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil'->getInstance()->get($gatewayName);
            if ($org::allbinary::business::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PAYMENT})) {
                $self->{logUtil}->putF("Getting PaymentGatewayInterface for PaymentType: " . $paymentType->getName() . " with: " . $hashMap, $self, $commonStrings->{GET_INSTANCE});
            }
            my $paymentGatewayInterfaceFactoryInterface = $paymentType->getPaymentGatewayInterfaceFactoryInterface();
            return $paymentGatewayInterfaceFactoryInterface->getInstance($hashMap);
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PAYMENTERROR})) {
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::user::commerce::money::payment::types::BasicPaymentType;
use org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterfaceFactoryInterface;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;

1;

