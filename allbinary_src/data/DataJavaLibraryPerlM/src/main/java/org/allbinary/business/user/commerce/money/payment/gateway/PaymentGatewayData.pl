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

package org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $CRYPTNUM = 5;
our $ID = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PAYMENTGATEWAY_ID");
our $NAME = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PAYMENTGATEWAY_NAME");
our $VALUE = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PAYMENTGATEWAY_VALUE");
our $PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PAYMENTGATEWAY_PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE");
our $PAYMENTPROCESSORINTERFACEFACTORYINTERFACE = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PAYMENTGATEWAY_PAYMENTPROCESSORINTERFACEFACTORYINTERFACE");
our $MODE = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("MODE");
our $SERVERPROTOCOL = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SERVERPROTOCOL");
our $SERVER = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SERVER");
our $SERVERPORT = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SERVERPORT");
our $SERVERPATH = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SERVERPATH");
our $TESTPROTOCOL = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("TESTSERVERPROTOCOL");
our $TESTSERVER = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("TESTSERVER");
our $TESTPORT = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("TESTPORT");
our $TESTPATH = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("TESTSERVERPATH");
our $TIMEOUT = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("TIMEOUT");
our $PROXYPROTOCOL = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYPROTOCOL");
our $PROXYSERVER = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYSERVER");
our $PROXYPATH = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYPATH");
our $PROXYUSERNAME = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYUSERNAME");
our $PROXYPASSWORD = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYPASSWORD");
our $PROXYPORT = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYPORT");
our $PROXYTIMEOUT = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYTIMEOUT");
our $SPECIAL1 = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL1");
our $SPECIAL2 = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL2");
our $SPECIAL3 = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL3");
our $SPECIAL4 = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL4");
our $SPECIAL5 = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL5");
our $SPECIAL6 = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL6");
our $SPECIAL7 = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL7");
our $SPECIAL8 = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL8");
our $SPECIAL9 = 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL9");

sub _init_fields {
    my ($self) = @_;
    $self->{key} = undef;
}


sub new {
    my ($class, $value) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{key} = $value;
    return $self;
}


sub toString {
    my ($self) = @_;
        return $self->{key};
}


1;

