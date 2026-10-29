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

package org::allbinary::bounds::LayerBounds;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::bounds::event::BoundsChangeEventListener';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{rectangle} = undef;
}


sub new {
    my ($class, $rectangle) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{rectangle} = $rectangle;
    return $self;
}


sub getRectangleP {
    my ($self) = @_;
        return $self->{rectangle};
}


sub visit {
    my ($self, $boundsVisitorInterface) = @_;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onBoundsChangeEvent {
    my ($self, $boundsChangeEvent) = @_;
        $self->{rectangle} = $boundsChangeEvent->getRectangle();
}

use org::allbinary::bounds::event::BoundsChangeEvent;
use org::allbinary::bounds::event::BoundsChangeEventListener;
use org::allbinary::graphics::Rectangle;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;

1;

