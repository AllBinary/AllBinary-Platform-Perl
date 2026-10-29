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

package org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{emailEventHashMap} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of UserEmailEventsConfiguration takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init();
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init();
    return $self;
}


sub init {
    my ($self) = @_;
        $self->{emailEventHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        if ($org::allbinary::logic::communication::smtp::configuration::user::event::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::configuration::user::event::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{CONSTRUCTOR}, $self, " Constructor");
        }
}


sub getEventConfigurationHashMap {
    my ($self) = @_;
        return $self->{emailEventHashMap};
}


sub addUserEmailEventConfiguration {
    my ($self, $userEmailEventConfigurationInterface) = @_;
        if ($org::allbinary::logic::communication::smtp::configuration::user::event::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::configuration::user::event::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF("Adding: " . $userEmailEventConfigurationInterface->log(), $self, "addUserEmailEventConfiguration");
        }
        $self->{emailEventHashMap}->put($userEmailEventConfigurationInterface->getName(), $userEmailEventConfigurationInterface);
}


# throws Exception
sub getEventListener {
    my ($self, $abeClientInformation, $userEmailEventNameData, $userInterface) = @_;
        my $userEmailEventConfigurationInterface = $self->{emailEventHashMap}->get($userEmailEventNameData->toString());
        return 'org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventListenerFactory'->getInstance($abeClientInformation, $userEmailEventConfigurationInterface, $userInterface);
}

use java::util::HashMap;
use org::allbinary::business::user::UserInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::event::UserEmailEventListenerInterface;
use org::allbinary::logic::communication::smtp::event::UserEmailEventNameData;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationInterface;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventListenerFactory;

1;

