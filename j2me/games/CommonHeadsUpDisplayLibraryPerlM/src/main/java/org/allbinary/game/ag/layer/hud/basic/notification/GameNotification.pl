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

package org::allbinary::game::ag::layer::hud::basic::notification::GameNotification;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_GAME_NOTIFICATION_EVENT = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 0, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});

sub _init_fields {
    my ($self) = @_;
    $self->{stringList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{timeList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{colorList} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub add {
    my ($self, $string, $seconds, $basicColor) = @_;
        if (!$self->{stringList}->contains($string)) {
            $self->{stringList}->add($string);
            $self->{timeList}->add($seconds);
            $self->{colorList}->add($basicColor);
        }
}


sub clear {
    my ($self) = @_;
        $self->{stringList}->clear();
        $self->{timeList}->clear();
        $self->{colorList}->clear();
}


sub getSize {
    my ($self) = @_;
        return $self->{stringList}->size();
}

use org::allbinary::game::layer::hud::event::GameNotificationEvent;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

