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

package views::admin::orderhistory::UserNameOrderHistoryView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::logic::control::validate::ValidationComponentInterface','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{request} = undef;
    $self->{userName} = undef;
    $self->{shipped} = undef;
    $self->{partiallyShipped} = undef;
    $self->{processing} = undef;
    $self->{preprocessing} = undef;
    $self->{cancelled} = undef;
    $self->{ON} = "on";
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{request} = $self->getPageContext()->getRequest();
        $self->{userName} = $self->{request}->getParameter($org::allbinary::business::user::UserData::USERNAME);
        $self->{preprocessing} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PREPROCESSINGNAME);
        $self->{shipped} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDNAME);
        $self->{partiallyShipped} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PARTIALLYSHIPPEDNAME);
        $self->{processing} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PROCESSINGNAME);
        $self->{cancelled} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELLEDNAME);
    return $self;
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
            if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}


sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $node = $document->createElement($org::allbinary::business::user::commerce::inventory::order::OrderData::ORDERS);
            my $orderHistoryEntity = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntity'->new();
            my $orderReviewVector = $orderHistoryEntity->getOrders($self->{userName});
            my $size = $orderReviewVector->size();
            for (my $index = 0; $index < $size; $index++) {
                my $orderHistory = $orderReviewVector->get($index);
                my $orderHistoryNode = $orderHistory->toXmlNode($document);
                my $orderNode = $document->createElement($orderHistory->getPaymentMethod());
                $node->appendChild($orderHistory->toXmlNode($document));
            }
            if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
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
            if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "toXmlNode", $e);
            }
            return undef;
        }
}


sub isValid {
    my ($self) = @_;
        if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Started", $self, $self->{commonStrings}->{IS_VALID});
        }
        if ('org::allbinary::business::user::username::UserName'->getInstance()->isValid($self->{userName}) == 1) {
            return 1;
        }
        return 0;
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


sub validationInfo {
    my ($self) = @_;
        if (!defined($self->{userName})) {
            return "No User Name Specified<br />";
        }
        if ('org::allbinary::business::user::username::UserName'->getInstance()->isValid($self->{userName}) == 0) {
            return "Invalid User Name<br />";
        }
        return "Unknown Error<br />";
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::commerce::inventory::order::OrderData;
use org::allbinary::business::user::commerce::inventory::order::OrderHistory;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::business::user::username::UserName;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntity;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::globals::GLOBALS2;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

