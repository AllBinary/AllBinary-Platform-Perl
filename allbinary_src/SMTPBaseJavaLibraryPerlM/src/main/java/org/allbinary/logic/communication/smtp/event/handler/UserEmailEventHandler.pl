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
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{emailVector} = undef unless exists $self->{emailVector};
    $self->{emailInfo} = undef unless exists $self->{emailInfo};
    $self->{userEmailEventNameData} = undef unless exists $self->{userEmailEventNameData};
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
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


sub addListener_j1_1 {
    my ($self, $vector) = @_;
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $userEmailEventListenerInterface = $vector->get($index);
            $self->addListener($userEmailEventListenerInterface);
        }
}


sub addListener_j1_2 {
    my ($self, $emailEventListenerInterface) = @_;
        $self->{emailVector}->add($emailEventListenerInterface);
}

sub addListener {
    my ($invocant, @arguments) = @_;
    return $invocant->addListener_j1(@arguments) if scalar(@arguments) == 1;
    die "No method addListener takes " . scalar(@arguments) . " arguments";
}

sub addListener_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->addListener_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->addListener_j1_2(@arguments);
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

use java::lang::Object ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::logic::StdUtil ();
use org::allbinary::logic::communication::smtp::event::EmailEvent ();
use org::allbinary::logic::communication::smtp::event::UserEmailEventListenerInterface ();
use org::allbinary::logic::communication::smtp::event::UserEmailEventNameData ();
use org::allbinary::logic::communication::smtp::info::EmailInfo ();

1;

