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

package org::allbinary::business::user::commerce::money::payment::types::BasicPaymentType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{value} = undef;
    $self->{paymentGatewayInterfaceFactoryInterface} = undef;
    $self->{paymentGatewayDomNodeFactoryInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of BasicPaymentType takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $paymentMethod) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init($paymentMethod);
    return $self;
}


sub _new3 {
    my ($class, $paymentMethod, $paymentGatewayInterfaceFactoryInterface, $paymentGatewayDomNodeFactoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init($paymentMethod);
        $self->{paymentGatewayInterfaceFactoryInterface} = $paymentGatewayInterfaceFactoryInterface;
        $self->{paymentGatewayDomNodeFactoryInterface} = $paymentGatewayDomNodeFactoryInterface;
    return $self;
}


sub init {
    my ($self, $paymentMethod) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $UNDERSCORE = "_";
        $hashMap->put('org::allbinary::string::CommonSeps'->getInstance()->{SPACE}, $UNDERSCORE);
        $hashMap->put('org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP}, $UNDERSCORE);
        $hashMap->put("-", $UNDERSCORE);
        my $replace = 'org::allbinary::logic::string::regex::replace::Replace'->new($hashMap);
        $self->{name} = $replace->all($paymentMethod);
        $self->{value} = $paymentMethod;
        'org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil'->getInstance()->add($self);
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getValue {
    my ($self) = @_;
        return $self->{value};
}


# throws Exception
sub getPaymentGatewayInterfaceFactoryInterface {
    my ($self) = @_;
        if (!defined($self->{paymentGatewayInterfaceFactoryInterface})) {
            die ("PaymentGatewayInterfaceFactoryInterface is Null");
        }
        return $self->{paymentGatewayInterfaceFactoryInterface};
}


# throws Exception
sub getPaymentGatewayDomNodeFactoryInterface {
    my ($self) = @_;
        if (!defined($self->{paymentGatewayDomNodeFactoryInterface})) {
            die ("PaymentGatewayDomNodeFactoryInterface is Null");
        }
        return $self->{paymentGatewayDomNodeFactoryInterface};
}


sub getKey {
    my ($self) = @_;
        return $self->getName();
}


sub toVector {
    my ($self) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        $vector->add($self->{name});
        $vector->add($self->{value});
        return $vector;
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString(), $self->{name});
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::VALUE->toString(), $self->{value});
        return $hashMap;
}


sub toString {
    my ($self) = @_;
        return $self->{name};
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterfaceFactoryInterface;
use org::allbinary::business::user::commerce::money::payment::gateway::modules::gateway::PaymentGatewayDomNodeFactoryInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::regex::replace::Replace;
use org::allbinary::string::CommonSeps;
use org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil;

1;

