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

package org::allbinary::logic::communication::smtp::email::NewPasswordEmail;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{abeClientInformation} = undef;
    $self->{userInterface} = undef;
    $self->{newPassword} = undef;
}


sub new {
    my ($class, $abeClientInformation, $userInterface, $newPassword) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{abeClientInformation} = $abeClientInformation;
        $self->{userInterface} = $userInterface;
        $self->{newPassword} = $newPassword;
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
            if ($org::allbinary::logic::communication::smtp::email::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::email::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
                $self->{logUtil}->putF("notifyStoreAdmin", $self, "notifyStoreAdmin");
            }
            my $emailSubject = "New Password For User: " . $self->{userInterface}->getUserName();
            my $emailBody = "New Password: " . $self->{newPassword};
            my $basicEmailInfo = 'org::allbinary::logic::communication::smtp::info::AdminEmailInfo'->new($emailSubject, $emailBody);
            my $emailInfo = 'org::allbinary::logic::communication::smtp::info::EmailInfo'->new($basicEmailInfo);
            my $adminUserEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::AdminUserEmailEventHandlerSingletons'->getInstance()->getInstance($self->{abeClientInformation}, $org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::NEWPASSWORD);
            $adminUserEmailEventHandler->receiveEmailInfo($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::NEWPASSWORD, $emailInfo);
        } catch ($e) {
            if ($org::allbinary::logic::communication::smtp::email::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::email::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "emailAdmin", $e);
            }
        }
}


# throws Exception
sub notifyUser {
    my ($self) = @_;
        try {
            if ($org::allbinary::logic::communication::smtp::email::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::email::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
                $self->{logUtil}->putF("Email User", $self, "notifyUser()");
            }
            my $subject = "New Password";
            my $body = "New Password: " . $self->{newPassword};
            my $basicEmailInfo = 'org::allbinary::logic::communication::smtp::info::AdminEmailInfo'->new($subject, $body);
            my $emailInfo = 'org::allbinary::logic::communication::smtp::info::EmailInfo'->new($basicEmailInfo);
            my $userEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::UserEmailEventHandlerSingletons'->getInstance()->getInstance($self->{abeClientInformation}, $org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::NEWPASSWORD, $self->{userInterface});
            $userEmailEventHandler->receiveEmailInfo($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::NEWPASSWORD, $emailInfo);
        } catch ($e) {
            if ($org::allbinary::logic::communication::smtp::email::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::email::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "notifyUser", $e);
            }
            die $e;
        }
}

use org::allbinary::business::user::UserInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::event::UserEmailEventNameData;
use org::allbinary::logic::communication::smtp::event::handler::UserEmailEventHandler;
use org::allbinary::logic::communication::smtp::event::handler::factory::AdminUserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::event::handler::factory::UserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::info::AdminEmailInfo;
use org::allbinary::logic::communication::smtp::info::BasicEmailInfo;
use org::allbinary::logic::communication::smtp::info::EmailInfo;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonStrings;

1;

