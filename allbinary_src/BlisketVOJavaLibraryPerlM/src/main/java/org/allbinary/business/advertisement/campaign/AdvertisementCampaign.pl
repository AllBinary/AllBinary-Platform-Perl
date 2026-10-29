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

package org::allbinary::business::advertisement::campaign::AdvertisementCampaign;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::advertisement::campaign::AdvertisementCampaignInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{hashMap} = undef;
}


sub new {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{hashMap} = $hashMap;
    return $self;
}


sub getComponent {
    my ($self) = @_;
        return undef;
}


sub getName {
    my ($self) = @_;
        return $self->{hashMap}->get('org::allbinary::business::advertisement::campaign::AdvertisementCampaignData'->getInstance()->{NAME});
}


sub setComponentName {
    my ($self, $name) = @_;
        $self->{hashMap}->put($org::allbinary::business::DynamicObjectData::NAME, $name);
}


sub setName {
    my ($self, $name) = @_;
        $self->{hashMap}->put('org::allbinary::business::advertisement::campaign::AdvertisementCampaignData'->getInstance()->{NAME}, $name);
}


sub search {
    my ($self, $advertisementSearchInterface) = @_;
        return undef;
}

use java::util::HashMap;
use org::allbinary::business::DynamicObjectData;
use org::allbinary::business::advertisement::AdvertisementsInterface;
use org::allbinary::business::advertisement::search::AdvertisementSearchInterface;
use org::allbinary::business::advertisement::campaign::AdvertisementCampaignInterface;
use org::allbinary::business::advertisement::campaign::AdvertisementCampaignData;

1;

