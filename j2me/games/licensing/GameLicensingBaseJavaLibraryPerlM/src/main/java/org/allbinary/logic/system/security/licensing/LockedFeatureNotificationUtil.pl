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

package org::allbinary::logic::system::security::licensing::LockedFeatureNotificationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::security::licensing::LockedFeatureNotificationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{gameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::logic::system::security::licensing::LicenseStrings'->getInstance()->{LOCKED}, 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(3), 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::licensing::LockedFeatureNotificationUtil::instance;
}


# throws Exception
sub fire {
    my ($self) = @_;
        'org::allbinary::media::audio::PrimaryPlayerQueueFactory'->getInstance()->add('org::allbinary::media::audio::ErrorSound'->getInstance());
        'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{gameNotificationEvent});
}


# throws Exception
sub fireWithColor {
    my ($self, $basicColor) = @_;
        'org::allbinary::media::audio::PrimaryPlayerQueueFactory'->getInstance()->add('org::allbinary::media::audio::ErrorSound'->getInstance());
        $self->{gameNotificationEvent}->setBasicColorP($basicColor);
        'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{gameNotificationEvent});
}

use org::allbinary::game::layer::hud::event::GameNotificationEvent;
use org::allbinary::game::layer::hud::event::GameNotificationEventHandler;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::audio::ErrorSound;
use org::allbinary::media::audio::PrimaryPlayerQueueFactory;
use org::allbinary::logic::system::security::licensing::LicenseStrings;

1;

