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

package views::generic::order::OrderView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{request} = undef;
    $self->{order} = undef;
    $self->{orderHistory} = undef;
    $self->{basketReview} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{request} = $self->getPageContext()->getRequest();
        $self->getFormData();
    return $self;
}


# throws Exception
sub getFormData {
    my ($self) = @_;
        my $id = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderData::ID);
        if (!defined($id)) {
            $id = $self->getWeblisketSession()->getOrder()->getId();
        }
        $self->{order} = 'org::allbinary::business::user::commerce::inventory::order::Order'->new('org::allbinary::business::user::commerce::inventory::basket::Basket'->new());
        $self->{order}->setId($id);
}


sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $orderHistoryNode = $self->{orderHistory}->toXmlNode($document);
            my $node = $document->createElement($self->{orderHistory}->getPaymentMethod());
            $orderHistoryNode->appendChild($self->{basketReview}->toXmlNode($document));
            $node->appendChild($orderHistoryNode);
            return $node;
        } catch ($e) {
            if ($views::generic::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "toXmlNode", $e);
            }
            return undef;
        }
}


sub addDomNodeInterfaces {
    my ($self) = @_;
        $self->addDomNodeInterface($self);
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            $self->addDomNodeInterfaces();
            return $self->SUPER::view();
        } catch ($e) {
            if ($views::generic::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::user::commerce::inventory::basket::Basket;
use org::allbinary::business::user::commerce::inventory::basket::BasketReview;
use org::allbinary::business::user::commerce::inventory::order::Order;
use org::allbinary::business::user::commerce::inventory::order::OrderData;
use org::allbinary::business::user::commerce::inventory::order::OrderHistory;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

