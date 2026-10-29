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

package org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{userEmailEventsConfigurationInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of UserEmailConfiguration takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::logic::communication::smtp::configuration::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::configuration::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{CONSTRUCTOR}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        $self->setUserEmailEventsConfigurationInterface('org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfiguration'->new());
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::logic::communication::smtp::configuration::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::configuration::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{CONSTRUCTOR}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        $self->setUserEmailEventsConfigurationInterface('org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfiguration'->new($hashMap));
    return $self;
}


sub getUserEmailEventsConfigurationInterface {
    my ($self) = @_;
        return $self->{userEmailEventsConfigurationInterface};
}


sub setUserEmailEventsConfigurationInterface {
    my ($self, $userEmailEventsConfigurationInterface) = @_;
        $self->{userEmailEventsConfigurationInterface} = $userEmailEventsConfigurationInterface;
}

use java::util::HashMap;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfiguration;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationInterface;

1;

