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

package views::admin::payment::gateway::PaymentGatewayComponent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{paymentGatewayInterface} = undef;
}


sub new {
    my ($class, $transformInfoInterface, $paymentGatewayInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{paymentGatewayInterface} = $paymentGatewayInterface;
    return $self;
}


# throws Exception
sub addDomNodeInterfaces {
    my ($self) = @_;
        my $paymentType = 'org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil'->getInstance()->get($self->{paymentGatewayInterface}->getName());
        my $paymentGatewayDomNodeFactoryInterface = $paymentType->getPaymentGatewayDomNodeFactoryInterface();
        my $domNodeInterface = $paymentGatewayDomNodeFactoryInterface->getInstance($self->{paymentGatewayInterface});
        $self->addDomNodeInterface($domNodeInterface);
}


sub view {
    my ($self) = @_;
        try {
            $self->addDomNodeInterfaces();
            return $self->SUPER::view();
        } catch ($e) {
            my $error = "Failed to view payment gateway";
            if ($views::admin::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            return $error;
        }
}

use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterface;
use org::allbinary::business::user::commerce::money::payment::gateway::modules::gateway::PaymentGatewayDomNodeFactoryInterface;
use org::allbinary::business::user::commerce::money::payment::types::BasicPaymentType;
use org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

