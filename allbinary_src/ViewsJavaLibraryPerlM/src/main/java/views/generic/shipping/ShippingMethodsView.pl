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

package views::generic::shipping::ShippingMethodsView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{shippingMethods} = undef;
    $self->{storeFrontInterface} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{storeFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->getTransformInfoInterface()->getStoreName());
        $self->{shippingMethods} = 'org::allbinary::business::user::commerce::shipping::ShippingMethods'->new($self->{abeClientInformation}, $self->{storeFrontInterface});
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $shippingMethodsNode = $document->createElement($org::allbinary::business::user::commerce::shipping::ShippingMethodsData::SHIPPINGMETHODSORDERSUMMARIES);
            my $order = $self->getWeblisketSession()->getOrder();
            my $basket = $self->getWeblisketSession()->getOrder()->getBasket();
            my $shippingAddressesEntityInterface = 'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory'->getInstance()->getInstance($self->getWeblisketSession()->getUserName());
            my $streetAddress = $shippingAddressesEntityInterface->getDefault();
            my $shippingVector = $self->{shippingMethods}->get();
            my $size = $shippingVector->size();
            for (my $index = 0; $index < $size; $index++) {
                my $shippingMethodNode = $document->createElement($org::allbinary::business::user::commerce::shipping::ShippingMethodsData::SHIPPINGMETHODORDERSUMMARY);
                my $shipping = $shippingVector->get($index);
                my $shippingView = $shipping;
                $shippingMethodNode->appendChild($shippingView->toXmlNode($document));
                my $shippingCost = $shipping->getCost($order);
                my $subTotal = $basket->getSubTotal();
                my $taxRate = 'org::allbinary::business::user::commerce::money::tax::TaxFactory'->getInstance()->getInstance($self->{abeClientInformation}, $self->{storeFrontInterface})->getTaxRate($streetAddress, $self->{storeFrontInterface});
                my $tax = 'org::allbinary::business::user::commerce::money::Money'->new();
                my $total = 'org::allbinary::business::user::commerce::money::Money'->new();
                $total->add($shippingCost->toString());
                $total->add($subTotal->toString());
                $tax->add($total->toString());
                $tax->multiply($taxRate);
                $total->add($tax->toString());
                $shippingMethodNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::shipping::ShippingMethodsData::SHIPPINGCOST, $shippingCost->toString()));
                $shippingMethodNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::shipping::ShippingMethodsData::TAXRATE, ("" . ($taxRate))));
                $shippingMethodNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::shipping::ShippingMethodsData::SUBTOTAL, $subTotal->toString()));
                $shippingMethodNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::shipping::ShippingMethodsData::TAX, $tax->toString()));
                $shippingMethodNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::shipping::ShippingMethodsData::TOTAL, $total->toString()));
                $shippingMethodNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT}, $self->{shippingMethods}->getDefault()->getName()));
                $shippingMethodsNode->appendChild($shippingMethodNode);
            }
            return $shippingMethodsNode;
        } catch ($e) {
            if ($views::generic::shipping::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::shipping::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "toXmlNode", $e);
            }
            die $e;
        }
}


sub addDomNodeInterfaces {
    my ($self) = @_;
        $self->addDomNodeInterface($self);
}


sub view {
    my ($self) = @_;
        try {
            $self->addDomNodeInterfaces();
            return $self->SUPER::view();
        } catch ($e) {
            my $error = "Failed to view ShippingMethods";
            if ($views::generic::shipping::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::shipping::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            return $error;
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::commerce::inventory::basket::BasketInterface;
use org::allbinary::business::user::commerce::inventory::order::OrderInterface;
use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::business::user::commerce::money::tax::TaxFactory;
use org::allbinary::business::user::commerce::shipping::ShippingMethods;
use org::allbinary::business::user::commerce::shipping::ShippingMethodsData;
use org::allbinary::business::user::commerce::shipping::modules::ShippingInterface;
use org::allbinary::data::tables::user::address::StreetAddressesEntityInterface;
use org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

