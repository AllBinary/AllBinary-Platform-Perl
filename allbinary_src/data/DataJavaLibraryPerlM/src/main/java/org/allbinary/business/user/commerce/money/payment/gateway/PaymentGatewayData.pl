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
use parent -norequire,'java::lang::Object';

our $CRYPTNUM = 5;
tie our $ID, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PAYMENTGATEWAY_ID") };
tie our $NAME, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PAYMENTGATEWAY_NAME") };
tie our $VALUE, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PAYMENTGATEWAY_VALUE") };
tie our $PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PAYMENTGATEWAY_PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE") };
tie our $PAYMENTPROCESSORINTERFACEFACTORYINTERFACE, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PAYMENTGATEWAY_PAYMENTPROCESSORINTERFACEFACTORYINTERFACE") };
tie our $MODE, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("MODE") };
tie our $SERVERPROTOCOL, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SERVERPROTOCOL") };
tie our $SERVER, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SERVER") };
tie our $SERVERPORT, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SERVERPORT") };
tie our $SERVERPATH, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SERVERPATH") };
tie our $TESTPROTOCOL, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("TESTSERVERPROTOCOL") };
tie our $TESTSERVER, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("TESTSERVER") };
tie our $TESTPORT, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("TESTPORT") };
tie our $TESTPATH, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("TESTSERVERPATH") };
tie our $TIMEOUT, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("TIMEOUT") };
tie our $PROXYPROTOCOL, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYPROTOCOL") };
tie our $PROXYSERVER, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYSERVER") };
tie our $PROXYPATH, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYPATH") };
tie our $PROXYUSERNAME, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYUSERNAME") };
tie our $PROXYPASSWORD, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYPASSWORD") };
tie our $PROXYPORT, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYPORT") };
tie our $PROXYTIMEOUT, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("PROXYTIMEOUT") };
tie our $SPECIAL1, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL1") };
tie our $SPECIAL2, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL2") };
tie our $SPECIAL3, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL3") };
tie our $SPECIAL4, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL4") };
tie our $SPECIAL5, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL5") };
tie our $SPECIAL6, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL6") };
tie our $SPECIAL7, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL7") };
tie our $SPECIAL8, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL8") };
tie our $SPECIAL9, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData'->new("SPECIAL9") };

sub _init_fields {
    my ($self) = @_;
    $self->{key} = undef;
}


sub new {
    my ($class, $value) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{key} = $value;
    return $self;
}


sub toString {
    my ($self) = @_;
        return $self->{key};
}

use java::lang::Object ();
use java::lang::LazyStatic ();

1;

