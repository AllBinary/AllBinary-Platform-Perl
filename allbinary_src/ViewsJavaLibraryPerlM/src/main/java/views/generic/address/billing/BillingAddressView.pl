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

package views::generic::address::billing::BillingAddressView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{request} = undef;
    $self->{streetAddress} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{request} = $self->getPageContext()->getRequest();
    return $self;
}


sub getRequest {
    my ($self) = @_;
        return $self->{request};
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $formNode = $document->createElement($org::allbinary::business::user::address::StreetAddressData::FORM);
            $formNode->appendChild($self->{streetAddress}->toXmlNode($document));
            return $formNode;
        } catch ($e) {
            if ($views::generic::address::billing::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::address::billing::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "toXmlNode", $e);
            }
            die $e;
        }
}


sub addDomNodeInterfaces {
    my ($self) = @_;
        $self->addDomNodeInterface($self);
        $self->addDomNodeInterface('views::generic::address::StatesView'->new());
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

# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::address::StreetAddressData;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;
use views::generic::address::StatesView;

1;

