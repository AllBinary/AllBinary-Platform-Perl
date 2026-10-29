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

package admin::taghelpers::OrderItemsRequestHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelper';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{request} = undef;
    $self->{id} = undef;
    $self->{groupId} = undef;
    $self->{status} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{request} = $pageContext->getRequest();
        $self->getFormData();
    return $self;
}


sub getFormData {
    my ($self) = @_;
        $self->{id} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderData::ID);
        $self->{groupId} = $self->{request}->getParameter($org::allbinary::business::user::commerce::shipping::ShippingMethodData::GROUP);
        $self->{status} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS);
}


sub setOrderStatus {
    my ($self, $newStatus) = @_;
        try {
            if (!defined($newStatus)) {
                $newStatus = $self->{status};
            }
            my $success = "Status successfully set to: " . $newStatus;
            'org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntityFactory'->getInstance()->setStatus($self->{id}, $self->{groupId}, $newStatus);
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "setOrderStatus(newStatus)");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to view order table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "setOrderStatus(newStatus)", $e);
            }
            return $error;
        }
}


# Java overloaded method: Perl keeps the last definition
sub setOrderStatus {
    my ($self) = @_;
        try {
            my $success = "Status successfully set to: " . $self->{status};
            'org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntityFactory'->getInstance()->setStatus($self->{id}, $self->{groupId}, $self->{status});
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "setOrderStatus(newStatus)");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to view order table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "setOrderStatus(newStatus)", $e);
            }
            return $error;
        }
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::user::commerce::inventory::order::OrderData;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::business::user::commerce::shipping::ShippingMethodData;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntityFactory;
use org::allbinary::logic::communication::log::LogUtil;
use admin::taghelpers::TagHelper;

1;

