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

package org::allbinary::logic::communication::smtp::event::handler::EmailEventHandlerUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::smtp::event::handler::EmailEventHandlerUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::smtp::event::handler::EmailEventHandlerUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getEventHandler {
    my ($self, $abeClientInformation, $userEmailEventNameData, $userVector) = @_;
        if ($org::allbinary::logic::communication::smtp::event::handler::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::event::handler::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Returning UserEmailEventHandler for ");
            $stringBuffer->appendint($userVector->size());
            $stringBuffer->append(" users.");
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "getEventHandler");
        }
        my $userEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::UserEmailEventHandler'->new();
        $userEmailEventHandler->addListener('org::allbinary::logic::communication::smtp::event::modules::log::LogUserEmailEventListenerModule'->new());
        my $size = $userVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $userInterface = $userVector->get($index);
            my $vector = 'org::allbinary::logic::communication::smtp::event::handler::EmailEventHandlerUtil'->getUserEmailEventListenerVector($abeClientInformation, $userEmailEventNameData, $userInterface);
            $userEmailEventHandler->addListener($vector);
        }
        return $userEmailEventHandler;
}


# throws Exception
sub getUserEmailEventListenerVector {
    my ($class, $abeClientInformation, $userEmailEventNameData, $userInterface) = @_;
        my $userConfigurationInterface = $userInterface->getUserConfigurationInterface();
        my $userEmailConfigurationInterface = $userConfigurationInterface->getUserEmailConfigurationInterface();
        my $userEmailEventsConfigurationInterface = $userEmailConfigurationInterface->getUserEmailEventsConfigurationInterface();
        my $userEmailEventListenerInterface = $userEmailEventsConfigurationInterface->getEventListener($abeClientInformation, $userEmailEventNameData, $userInterface);
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        $vector->add($userEmailEventListenerInterface);
        return $vector;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::UserInterface;
use org::allbinary::business::user::modules::configuration::UserConfigurationInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationInterface;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationInterface;
use org::allbinary::logic::communication::smtp::event::UserEmailEventListenerInterface;
use org::allbinary::logic::communication::smtp::event::UserEmailEventNameData;
use org::allbinary::logic::communication::smtp::event::modules::log::LogUserEmailEventListenerModule;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::communication::smtp::event::handler::UserEmailEventHandler;

1;

