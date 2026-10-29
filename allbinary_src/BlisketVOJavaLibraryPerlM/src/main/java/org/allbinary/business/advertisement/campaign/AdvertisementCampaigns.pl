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

package org::allbinary::business::advertisement::campaign::AdvertisementCampaigns;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::advertisement::campaign::AdvertisementCampaignsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{advertisementsVector} = undef;
}


sub new {
    my ($class, $vector) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{advertisementsVector} = $self->{advertisementsVector};
    return $self;
}


sub add {
    my ($self, $advertisementInterface) = @_;
        $self->{advertisementsVector}->add($advertisementInterface);
}


sub get {
    my ($self, $index) = @_;
        return $self->{advertisementsVector}->get($index);
}


sub size {
    my ($self) = @_;
        return $self->{advertisementsVector}->size();
}


sub isEnabled {
    my ($self) = @_;
        return 1;
}


sub search {
    my ($self, $advertisementSearchInterface) = @_;
        return undef;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::advertisement::AdvertisementInterface;
use org::allbinary::business::advertisement::AdvertisementsInterface;
use org::allbinary::business::advertisement::search::AdvertisementSearchInterface;
use org::allbinary::business::advertisement::campaign::AdvertisementCampaignsInterface;

1;

