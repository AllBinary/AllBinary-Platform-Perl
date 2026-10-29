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

package views::admin::payment::gateway::GatewayView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::admin::payment::gateway::PaymentGatewayViewAbstract';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getFormData {
    my ($self, $request) = @_;
        $self->SUPER::getFormData($request);
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->getPaymentGatewayPrimaryKey()->getName())) {
            $self->getPaymentGatewayPrimaryKey()->setName($self->getWeblisketSession()->getPaymentMethod());
        }
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            my $paymentGatewayInterface = 'org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntityFactory'->getInstance()->getPaymentGatewayInterface($self->getPaymentGatewayPrimaryKey()->getStoreName(), 'org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil'->getInstance()->get($self->getPaymentGatewayPrimaryKey()->getName()));
            return 'views::admin::payment::gateway::PaymentGatewayComponent'->new($self->getTransformInfoInterface(), $paymentGatewayInterface)->view();
        } catch ($e) {
            if ($views::admin::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::payment::gateway::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "edit()", $e);
            }
            die $e;
        }
}

# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterface;
use org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil;
use org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntityFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use views::admin::payment::gateway::PaymentGatewayViewAbstract;
use views::admin::payment::gateway::PaymentGatewayComponent;

1;

