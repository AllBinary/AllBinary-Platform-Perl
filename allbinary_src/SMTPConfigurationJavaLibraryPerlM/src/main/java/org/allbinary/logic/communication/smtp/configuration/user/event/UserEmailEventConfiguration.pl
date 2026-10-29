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

package org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{name} = undef;
    $self->{eventListenerClassPath} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of UserEmailEventConfiguration takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        $self->setEventListenerClassPath('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        if ($org::allbinary::logic::communication::smtp::configuration::user::event::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::configuration::user::event::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF("New", $self, " Constructor");
        }
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName($hashMap->get($org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData::NAME));
        $self->setEventListenerClassPath($hashMap->get($org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData::LISTENER_CLASSPATH));
        if ($org::allbinary::logic::communication::smtp::configuration::user::event::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::configuration::user::event::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF("Log: " . $self->log(), $self, " Constructor");
        }
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub getEventListenerClassPath {
    my ($self) = @_;
        return $self->{eventListenerClassPath};
}


sub setEventListenerClassPath {
    my ($self, $eventListenerClassPath) = @_;
        $self->{eventListenerClassPath} = $eventListenerClassPath;
}


sub log {
    my ($self) = @_;
        return "\nUser Email Event Log Info:" . "\nName: " . $self->getName() . "\nEventListenerClassPath: " . $self->getEventListenerClassPath();
}

use java::util::HashMap;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationInterface;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData;

1;

