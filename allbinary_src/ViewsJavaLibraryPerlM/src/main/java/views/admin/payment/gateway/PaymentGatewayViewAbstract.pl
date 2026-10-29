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

package views::admin::payment::gateway::PaymentGatewayViewAbstract;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::TransformInfoHttpComposite';


sub _init_fields {
    my ($self) = @_;
    $self->{paymentGatewayPrimaryKey} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->getFormData($self->getPageContext()->getRequest());
    return $self;
}


sub getFormData {
    my ($self, $request) = @_;
        my $storeName = $self->getWeblisketSession()->getStoreName();
        my $gatewayName = $request->getParameter($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString());
        $self->setPaymentGatewayPrimaryKey('org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPrimaryKey'->new($storeName, $gatewayName));
}


sub getPaymentGatewayPrimaryKey {
    my ($self) = @_;
        return $self->{paymentGatewayPrimaryKey};
}


sub setPaymentGatewayPrimaryKey {
    my ($self, $paymentGatewayPrimaryKey) = @_;
        $self->{paymentGatewayPrimaryKey} = $paymentGatewayPrimaryKey;
}

# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPrimaryKey;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpComposite;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;

1;

