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

package org::allbinary::data::tables::advertisement::campaign::internal::AdvertisementCampaignInternalEntityFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $CLASSNAME = "org.allbinary.data.tables.AdvertisementCampaignEntity";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            return 'org::allbinary::data::tables::advertisement::campaign::internal::AdvertisementCampaignInternalEntity'->new();
        } catch ($e) {
            if ($org::allbinary::data::tables::advertisement::campaign::internal::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::advertisement::campaign::internal::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{ENTITYFACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $logUtil->put($commonStrings->{EXCEPTION}, "AdvertisementCampaignEntityFactory", $commonStrings->{GET_INSTANCE}, $e);
            }
            return undef;
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::data::tables::advertisement::campaign::internal::AdvertisementCampaignInternalEntity;

1;

