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

package org::allbinary::business::user::commerce::inventory::order::status::OrderStatusEmail;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{abeClientInformation} = undef;
    $self->{orderHistory} = undef;
    $self->{storeFrontInterface} = undef;
    $self->{user} = undef;
}


sub new {
    my ($class, $abeClientInformation, $orderHistory) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{abeClientInformation} = $abeClientInformation;
        $self->{orderHistory} = $orderHistory;
        my $storeName = $orderHistory->getStoreName();
        $self->{storeFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($storeName);
        $self->{user} = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->getUser($orderHistory->getUserName());
    return $self;
}


# throws Exception
sub process {
    my ($self) = @_;
        $self->notifyStoreAdmin();
        $self->notifyUser();
}


# throws Exception
sub notifyStoreAdmin {
    my ($self) = @_;
        try {
            if ($org::allbinary::business::user::commerce::inventory::order::status::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::order::status::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
                $self->{logUtil}->putF("Order Email", $self, "emailStoreAdmin");
            }
            my $adminEmailSubject = "Order " . $self->{orderHistory}->getStatus() . " Attempt";
            my $adminEmailTextBody = "Order attempt: " . $self->{orderHistory}->getId() . " Preprocessing by: " . $self->{user}->getUserName();
            my $adminBasicEmailInfo = 'org::allbinary::logic::communication::smtp::info::AdminEmailInfo'->new($adminEmailSubject, $adminEmailTextBody);
            my $storeAdminBasicEmailInfo = 'org::allbinary::logic::communication::smtp::info::StoreEmailInfo'->new($self->{storeFrontInterface}, $adminEmailSubject, $adminEmailTextBody);
            my $storeAdminEmailInfo = 'org::allbinary::logic::communication::smtp::info::EmailInfo'->new($storeAdminBasicEmailInfo);
            my $adminEmailInfo = 'org::allbinary::logic::communication::smtp::info::EmailInfo'->new($adminBasicEmailInfo);
            my $userEmailEventNameData = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->getInstance($self->{orderHistory}->getStatus());
            my $adminUserEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::AdminUserEmailEventHandlerSingletons'->getInstance()->getInstance($self->{abeClientInformation}, $userEmailEventNameData);
            my $storeAdminUserEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::StoreAdminUserEmailEventHandlerSingletons'->getInstance()->getInstance($userEmailEventNameData, $self->{abeClientInformation}, $self->{storeFrontInterface});
            $storeAdminUserEmailEventHandler->receiveEmailInfo($userEmailEventNameData, $storeAdminEmailInfo);
            $adminUserEmailEventHandler->receiveEmailInfo($userEmailEventNameData, $adminEmailInfo);
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::inventory::order::status::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::order::status::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "emailAdmin", $e);
            }
        }
}


# throws Exception
sub notifyUser {
    my ($self) = @_;
        try {
            if ($org::allbinary::business::user::commerce::inventory::order::status::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::order::status::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
                $self->{logUtil}->putF("Email User", $self, "notifyUser()");
            }
            my $subject = "Order " . $self->{orderHistory}->getStatus() . " Attempt";
            my $textBody = "Order attempt: " . $self->{orderHistory}->getId() . " Preprocessing by: " . $self->{user}->getUserName();
            my $basicEmailInfo = 'org::allbinary::logic::communication::smtp::info::StoreEmailInfo'->new($self->{storeFrontInterface}, $subject, $textBody);
            my $emailInfo = 'org::allbinary::logic::communication::smtp::info::EmailInfo'->new($basicEmailInfo);
            my $userEmailEventNameData = 'org::allbinary::logic::communication::smtp::event::UserEmailEventNameData'->getInstance($self->{orderHistory}->getStatus());
            my $userEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::UserEmailEventHandlerSingletons'->getInstance()->getInstance($self->{abeClientInformation}, $userEmailEventNameData, $self->{user});
            $userEmailEventHandler->receiveEmailInfo($userEmailEventNameData, $emailInfo);
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::inventory::order::status::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::order::status::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "notifyUser", $e);
            }
            die $e;
        }
}

use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::UserInterface;
use org::allbinary::business::user::commerce::inventory::order::OrderHistory;
use org::allbinary::data::tables::user::UserEntityFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::event::UserEmailEventNameData;
use org::allbinary::logic::communication::smtp::event::handler::UserEmailEventHandler;
use org::allbinary::logic::communication::smtp::event::handler::factory::AdminUserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::event::handler::factory::StoreAdminUserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::event::handler::factory::UserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::info::AdminEmailInfo;
use org::allbinary::logic::communication::smtp::info::BasicEmailInfo;
use org::allbinary::logic::communication::smtp::info::EmailInfo;
use org::allbinary::logic::communication::smtp::info::StoreEmailInfo;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonStrings;

1;

