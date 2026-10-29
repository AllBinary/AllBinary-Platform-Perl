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

package org::allbinary::logic::communication::smtp::event::handler::UserEmailEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{emailVector} = undef;
    $self->{emailInfo} = undef;
    $self->{userEmailEventNameData} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{emailVector} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


# throws Exception
sub receiveEmailInfo {
    my ($self, $userEmailEventNameData, $emailInfo) = @_;
        $self->{userEmailEventNameData} = $userEmailEventNameData;
        $self->{emailInfo} = $emailInfo;
        $self->fireEmailEvent();
}


sub addListener {
    my ($self, $vector) = @_;
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $userEmailEventListenerInterface = $vector->get($index);
            $self->addListener($userEmailEventListenerInterface);
        }
}


# Java overloaded method: Perl keeps the last definition
sub addListener {
    my ($self, $emailEventListenerInterface) = @_;
        $self->{emailVector}->add($emailEventListenerInterface);
}


sub removeListener {
    my ($self, $emailEventListenerInterface) = @_;
        $self->{emailVector}->remove($emailEventListenerInterface);
}


# throws Exception
sub fireEmailEvent {
    my ($self) = @_;
        my $emailEvent = 'org::allbinary::logic::communication::smtp::event::EmailEvent'->new($self, $self->{userEmailEventNameData}, $self->{emailInfo}, 0);
        my $size = $self->{emailVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $emailEventListenerInterface = $self->{emailVector}->get($index);
            $emailEventListenerInterface->onEmailSendRequest($emailEvent);
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::smtp::event::EmailEvent;
use org::allbinary::logic::communication::smtp::event::UserEmailEventListenerInterface;
use org::allbinary::logic::communication::smtp::event::UserEmailEventNameData;
use org::allbinary::logic::communication::smtp::info::EmailInfo;

1;

