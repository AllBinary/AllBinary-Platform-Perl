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

package org::allbinary::logic::communication::smtp::event::handler::factory::UserEmailEventHandlerSingletons;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::smtp::event::handler::factory::UserEmailEventHandlerSingletons'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{userEmailEventHandlerHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::smtp::event::handler::factory::UserEmailEventHandlerSingletons::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::logic::communication::smtp::event::handler::factory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::event::handler::factory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $abeClientInformation, $userEmailEventNameData, $userInterface) = @_;
        if ($org::allbinary::logic::communication::smtp::event::handler::factory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::event::handler::factory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{GET_INSTANCE});
        }
        my $userEmailEventHandler = $self->{userEmailEventHandlerHashMap}->get($userEmailEventNameData);
        if (!defined($userEmailEventHandler)) {
            if ($org::allbinary::logic::communication::smtp::event::handler::factory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::event::handler::factory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
                $self->{logUtil}->putF("Creating New Named UserEmailEventHandler", $self, $self->{commonStrings}->{GET_INSTANCE});
            }
            my $newUserEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::UserEmailEventHandler'->new();
            my $vector = 'org::allbinary::logic::communication::smtp::event::handler::EmailEventHandlerUtil'->getUserEmailEventListenerVector($abeClientInformation, $userEmailEventNameData, $userInterface);
            $newUserEmailEventHandler->addListener($vector);
            $newUserEmailEventHandler->addListener('org::allbinary::logic::communication::smtp::event::modules::log::LogUserEmailEventListenerModule'->new());
            $self->{userEmailEventHandlerHashMap}->put($userEmailEventNameData, $newUserEmailEventHandler);
            return $newUserEmailEventHandler;
        } else {
            if ($org::allbinary::logic::communication::smtp::event::handler::factory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::event::handler::factory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
                $self->{logUtil}->putF("Returning existing UserEmailEventHandler", $self, $self->{commonStrings}->{GET_INSTANCE});
            }
            return $userEmailEventHandler;
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::UserInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::event::UserEmailEventNameData;
use org::allbinary::logic::communication::smtp::event::handler::EmailEventHandlerUtil;
use org::allbinary::logic::communication::smtp::event::handler::UserEmailEventHandler;
use org::allbinary::logic::communication::smtp::event::modules::log::LogUserEmailEventListenerModule;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonStrings;

1;

