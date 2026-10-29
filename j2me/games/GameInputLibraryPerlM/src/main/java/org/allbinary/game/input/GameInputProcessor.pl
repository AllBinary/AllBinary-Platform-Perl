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

package org::allbinary::game::input::GameInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::GameInputProcessor'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::GameInputProcessor::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub processEvent {
    my ($self, $allbinaryLayerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub processReleasedEvent {
    my ($self, $allbinaryLayerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub processAnalog {
    my ($self, $allbinaryLayerManager, $gameKeyEvent, $analogValue) = @_;
}


# throws Exception
sub process {
    my ($self, $allbinaryLayerManager, $keyAsInteger) = @_;
}


# throws Exception
sub processReleased {
    my ($self, $allbinaryLayerManager, $keyAsInteger) = @_;
}

use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::layer::AllBinaryLayerManager;

1;

