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

package views::admin::payment::gateways::SelectExistingView;
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


# throws Exception
sub view {
    my ($self) = @_;
        try {
            my $paymentGatewayEntityInterface = 'org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntityFactory'->getInstance();
            my $existingGateways = $paymentGatewayEntityInterface->findPaymentTypeVectorByStore($self->getPaymentGatewayPrimaryKey()->getStoreName());
            return 'views::admin::payment::gateways::PaymentGatewaysView'->new($self->getTransformInfoInterface(), $existingGateways)->view();
        } catch ($e) {
            if ($views::admin::payment::gateways::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::payment::gateways::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view", $e);
            }
            die $e;
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntityFactory;
use org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntityInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use views::admin::payment::gateway::PaymentGatewayViewAbstract;
use views::admin::payment::gateways::PaymentGatewaysView;

1;

