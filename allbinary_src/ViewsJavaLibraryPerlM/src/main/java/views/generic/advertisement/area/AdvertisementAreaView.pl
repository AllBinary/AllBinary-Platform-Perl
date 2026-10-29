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

package views::generic::advertisement::area::AdvertisementAreaView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{advertisementAreaName} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{advertisementAreaName} = $self->getPropertiesHashMap()->get('org::allbinary::business::advertisement::area::AdvertisementAreaData'->getInstance()->{NAME});
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $advertisementAreasEntityInterface = 'org::allbinary::data::tables::advertisement::areas::AdvertisementAreasEntityFactory'->getInstance();
            my $advertisementAreaInterface = $advertisementAreasEntityInterface->get($self->getTransformInfoInterface()->getStoreName(), $self->{advertisementAreaName});
            return undef;
        } catch ($e) {
            if ($views::generic::advertisement::area::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::advertisement::area::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGINGERROR})) {
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
            if ($views::generic::advertisement::area::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::advertisement::area::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

use org::allbinary::business::advertisement::area::AdvertisementAreaData;
use org::allbinary::business::advertisement::area::AdvertisementAreaInterface;
use org::allbinary::data::tables::advertisement::areas::AdvertisementAreasEntityFactory;
use org::allbinary::data::tables::advertisement::areas::AdvertisementAreasEntityInterface;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

