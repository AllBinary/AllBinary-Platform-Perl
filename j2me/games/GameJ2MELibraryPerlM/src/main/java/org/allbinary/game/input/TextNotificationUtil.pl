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

package org::allbinary::game::input::TextNotificationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::TextNotificationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{TWO} = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(2);
    $self->{FALSE} = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE};
    $self->{gameNotificationEventHandler} = 'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::TextNotificationUtil::instance;
}


# throws Exception
sub fireError {
    my ($self, $message) = @_;
        'org::allbinary::media::audio::PrimaryPlayerQueueFactory'->getInstance()->add('org::allbinary::media::audio::ErrorSound'->getInstance());
        $self->fire($message);
}


# throws Exception
sub fireNew {
    my ($self, $message) = @_;
        'org::allbinary::media::audio::PrimaryPlayerQueueFactory'->getInstance()->add('org::allbinary::media::audio::SelectSound'->getInstance());
        $self->fire($message);
}


# throws Exception
sub fireSuccess {
    my ($self, $message) = @_;
        'org::allbinary::media::audio::PrimaryPlayerQueueFactory'->getInstance()->add('org::allbinary::media::audio::SelectSound'->getInstance());
        $self->fire($message);
}


# throws Exception
sub fire {
    my ($self, $message) = @_;
        my $gameNotificationEvent = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, $message, $self->{TWO}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED}, $self->{FALSE});
        $self->{gameNotificationEventHandler}->fireEvent($gameNotificationEvent);
}

use org::allbinary::game::layer::hud::event::GameNotificationEvent;
use org::allbinary::game::layer::hud::event::GameNotificationEventHandler;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::audio::ErrorSound;
use org::allbinary::media::audio::PrimaryPlayerQueueFactory;
use org::allbinary::media::audio::SelectSound;

1;

