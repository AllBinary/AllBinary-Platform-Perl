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

package org::allbinary::business::advertisement::area::AdvertisementArea;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::advertisement::area::AdvertisementAreaInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{storeName} = undef;
    $self->{description} = undef;
    $self->{advertisementAreaConstraintsInterface} = undef;
    $self->{campaign} = undef;
}


sub new {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $hashMap->get('org::allbinary::business::advertisement::area::AdvertisementAreaData'->getInstance()->{NAME});
        $self->{storeName} = $hashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        $self->{description} = $hashMap->get('org::allbinary::business::advertisement::area::AdvertisementAreaData'->getInstance()->{DESCRIPTION});
        my $constraintsDomString = $hashMap->get('org::allbinary::business::advertisement::area::AdvertisementAreaData'->getInstance()->{CONSTRAINTS});
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($constraintsDomString);
        $self->{advertisementAreaConstraintsInterface} = 'org::allbinary::business::advertisement::area::AdvertisementAreaConstraints'->new($document);
        $self->{campaign} = $hashMap->get('org::allbinary::business::advertisement::campaign::AdvertisementCampaignData'->getInstance()->{NAME});
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getStoreName {
    my ($self) = @_;
        return $self->{storeName};
}


sub getDescription {
    my ($self) = @_;
        return $self->{description};
}


sub getConstraints {
    my ($self) = @_;
        return $self->{advertisementAreaConstraintsInterface};
}


sub getCampaign {
    my ($self) = @_;
        return $self->{campaign};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub setStoreName {
    my ($self, $storeName) = @_;
        $self->{storeName} = $storeName;
}


sub setDescription {
    my ($self, $description) = @_;
        $self->{description} = $description;
}


sub setConstraints {
    my ($self, $advertisementConstraintsInterface) = @_;
        $self->{advertisementAreaConstraintsInterface} = $self->{advertisementAreaConstraintsInterface};
}


sub setCampaign {
    my ($self, $campaign) = @_;
        $self->{campaign} = $campaign;
}

use java::util::HashMap;
use org::allbinary::business::advertisement::campaign::AdvertisementCampaignData;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::w3c::dom::Document;
use org::allbinary::business::advertisement::area::AdvertisementAreaInterface;
use org::allbinary::business::advertisement::area::AdvertisementAreaData;
use org::allbinary::business::advertisement::area::AdvertisementAreaConstraints;

1;

