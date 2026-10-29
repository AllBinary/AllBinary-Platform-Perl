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

package org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEventUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{geographicMapCellPositionEvent} = undef;
    $self->{geographicMapCellPositionEventHandler} = 'org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEventHandler'->getInstance();
}


sub new {
    my ($class, $anyType) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{geographicMapCellPositionEvent} = 'org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEvent'->new($anyType, 'org::allbinary::graphics::CellPositionFactory'->getInstance()->{NONE});
    return $self;
}


# throws Exception
sub update {
    my ($self, $geographicMapCellPositionTracking) = @_;
        $self->{geographicMapCellPositionEvent}->setGeographicMapCellPosition($geographicMapCellPositionTracking->getCurrentGeographicMapCellPosition());
        $self->{geographicMapCellPositionEventHandler}->fireEvent($self->{geographicMapCellPositionEvent});
}


# throws Exception
sub remove {
    my ($self, $geographicMapCellPositionTracking) = @_;
        $self->{geographicMapCellPositionEvent}->setGeographicMapCellPosition($geographicMapCellPositionTracking->getCurrentGeographicMapCellPosition());
        $self->{geographicMapCellPositionEventHandler}->fireRemoveEvent($self->{geographicMapCellPositionEvent});
}

use org::allbinary::graphics::CellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionTracking;
use org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEventHandler;
use org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEvent;

1;

