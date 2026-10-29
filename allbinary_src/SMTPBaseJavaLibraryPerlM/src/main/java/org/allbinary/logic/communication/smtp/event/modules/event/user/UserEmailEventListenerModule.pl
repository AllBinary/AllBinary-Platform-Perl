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

package org::allbinary::logic::communication::smtp::event::modules::event::user::UserEmailEventListenerModule;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::smtp::event::UserEmailEventListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{userInterface} = undef;
}


sub new {
    my ($class, $userInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{userInterface} = $userInterface;
    return $self;
}


# throws Exception
sub onEmailSendFailure {
    my ($self, $emailEvent) = @_;
        my $to = $self->{userInterface}->getSecondaryEmail();
        my $email = 'org::allbinary::logic::communication::smtp::BasicEmail'->new($emailEvent->getEmailInfo(), $to);
        'org::allbinary::logic::communication::smtp::queue::EmailQueueFactory'->getInstance()->offer($email->getEmail());
}


# throws Exception
sub onEmailSendRequest {
    my ($self, $emailEvent) = @_;
        if ($org::allbinary::logic::communication::smtp::event::modules::event::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::event::modules::event::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF("Add Email To Que For Sending: " . $emailEvent->toString(), $self, "onEmailSendRequest");
        }
        my $to = $self->{userInterface}->getMainEmail();
        my $email = 'org::allbinary::logic::communication::smtp::BasicEmail'->new($emailEvent->getEmailInfo(), $to);
        'org::allbinary::logic::communication::smtp::queue::EmailQueueFactory'->getInstance()->offer($email->getEmail());
}

use org::allbinary::business::user::UserInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::BasicEmail;
use org::allbinary::logic::communication::smtp::EmailInterface;
use org::allbinary::logic::communication::smtp::event::EmailEvent;
use org::allbinary::logic::communication::smtp::event::UserEmailEventListenerInterface;
use org::allbinary::logic::communication::smtp::queue::EmailQueueFactory;

1;

