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

package views::generic::basket::mini::MiniBasketView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::data::tree::dom::DomNodeInterface';


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
sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $basketInterface = $self->getWeblisketSession()->getOrder()->getBasket();
            my $basketNode = $document->createElement($org::allbinary::business::user::commerce::inventory::basket::BasketData::BASKET);
            my $totalNumberNode = $document->createElement($org::allbinary::logic::control::search::SearchData::TOTAL_NUMBER_ITEMS);
            my $totalNumberTextNode = $document->createTextNode($basketInterface->getNumberOfItems()->toString());
            $totalNumberNode->appendChild($totalNumberTextNode);
            my $totalWeightNode = $document->createElement($org::allbinary::business::user::commerce::inventory::basket::BasketData::TOTALWEIGHT);
            my $totalWeightTextNode = $document->createTextNode($basketInterface->getTotalWeight()->toString());
            $totalWeightNode->appendChild($totalWeightTextNode);
            my $subTotalNode = $document->createElement($org::allbinary::business::user::commerce::inventory::basket::BasketData::SUBTOTAL);
            my $subTotalTextNode = $document->createTextNode($basketInterface->getSubTotal()->toString());
            $subTotalNode->appendChild($subTotalTextNode);
            $basketNode->appendChild($totalNumberNode);
            $basketNode->appendChild($totalWeightNode);
            $basketNode->appendChild($subTotalNode);
            return $basketNode;
        } catch ($e) {
            if ($views::generic::basket::mini::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::basket::mini::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGINGERROR})) {
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
            if ($views::generic::basket::mini::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::basket::mini::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

use org::allbinary::business::user::commerce::inventory::basket::BasketData;
use org::allbinary::business::user::commerce::inventory::basket::BasketInterface;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::search::SearchData;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

