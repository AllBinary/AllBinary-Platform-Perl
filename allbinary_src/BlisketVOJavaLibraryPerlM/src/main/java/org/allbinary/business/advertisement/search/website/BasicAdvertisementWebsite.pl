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

package org::allbinary::business::advertisement::search::website::BasicAdvertisementWebsite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::advertisement::search::website::AdvertisementWebsiteInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{websiteId} = undef;
}


sub new {
    my ($class, $websiteId) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{websiteId} = $websiteId;
    return $self;
}


sub toString {
    my ($self) = @_;
        return $self->{websiteId};
}

use org::allbinary::business::advertisement::search::website::AdvertisementWebsiteInterface;

1;

