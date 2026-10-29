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

package views::generic::address::billing::BillingAddressesView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{request} = undef;
    $self->{streetAddresses} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        my $httpTransformInfoInterface = $self->getTransformInfoInterface();
        $self->{request} = $httpTransformInfoInterface->getPageContext()->getRequest();
    return $self;
}


sub getRequest {
    my ($self) = @_;
        return $self->{request};
}


sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $billingAddressesNode = $document->createElement($org::allbinary::business::user::address::BillingAddressData::MULTIPLE);
            my $size = $self->{streetAddresses}->size();
            for (my $index = 0; $index < $size; $index++) {
                my $streetAddress = $self->{streetAddresses}->get($index);
                $billingAddressesNode->appendChild($streetAddress->toXmlNode($document));
            }
            $billingAddressesNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::address::StreetAddressData::NUMBEROFADDRESSES, $self->{streetAddresses}->size()->toString()));
            return $billingAddressesNode;
        } catch ($e) {
            if ($views::generic::address::billing::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::address::billing::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGINGERROR})) {
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
            if ($views::generic::address::billing::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::address::billing::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::user::address::BillingAddressData;
use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::address::StreetAddressData;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

