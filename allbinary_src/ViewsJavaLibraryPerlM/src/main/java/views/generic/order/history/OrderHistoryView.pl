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

package views::generic::order::history::OrderHistoryView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{request} = undef;
    $self->{shipped} = undef;
    $self->{partiallyShipped} = undef;
    $self->{processing} = undef;
    $self->{preprocessing} = undef;
    $self->{cancelled} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{request} = $self->getPageContext()->getRequest();
        $self->{preprocessing} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PREPROCESSINGNAME);
        $self->{shipped} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDNAME);
        $self->{partiallyShipped} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PARTIALLYSHIPPEDNAME);
        $self->{processing} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PROCESSINGNAME);
        $self->{cancelled} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELLEDNAME);
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $node = $document->createElement($org::allbinary::business::user::commerce::inventory::order::OrderData::ORDERS);
            my $orderHistoryEntity = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntity'->new();
            my $orderReviewVector = $orderHistoryEntity->getOrders($self->getWeblisketSession()->getUserName());
            my $size = $orderReviewVector->size();
            for (my $index = 0; $index < $size; $index++) {
                my $orderHistory = $orderReviewVector->get($index);
                my $orderHistoryNode = $orderHistory->toXmlNode($document);
                my $orderNode = $document->createElement($orderHistory->getPaymentMethod());
                $node->appendChild($orderHistory->toXmlNode($document));
            }
            if ($views::generic::order::history::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::order::history::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Attempt to View a users order history", $self, "view");
            }
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PREPROCESSINGNAME, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PREPROCESSING));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PROCESSINGNAME, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PROCESSING));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELLEDNAME, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELLED));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PARTIALLYSHIPPEDNAME, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PARTIALLYSHIPPED));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDNAME, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPED));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::globals::GLOBALS2::VIEWNAME, $org::allbinary::globals::GLOBALS2::VIEW));
            return $node;
        } catch ($e) {
            if ($views::generic::order::history::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::order::history::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "toXmlNode", $e);
            }
            die $e;
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
            if ($views::generic::order::history::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::order::history::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::user::commerce::inventory::order::OrderData;
use org::allbinary::business::user::commerce::inventory::order::OrderHistory;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntity;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::globals::GLOBALS2;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

