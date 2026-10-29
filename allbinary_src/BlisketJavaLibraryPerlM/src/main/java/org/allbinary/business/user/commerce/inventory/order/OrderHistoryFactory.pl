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

#Retrieves a single order for a user
package org::allbinary::business::user::commerce::inventory::order::OrderHistoryFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class, $id) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            my $orderHistoryEntityInterface = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntity'->new();
            return $orderHistoryEntityInterface->getOrder($id);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            if ($org::allbinary::business::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{FACTORYERROR})) {
                $logUtil->put($commonStrings->{EXCEPTION}, "OrderHistoryFactory", $commonStrings->{GET_INSTANCE}, $e);
            }
            return undef;
        }
}

use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntity;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

