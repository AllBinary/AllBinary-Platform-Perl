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

package org::allbinary::graphics::ScreenListenerHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::ScreenListenerHandler'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{screenListenerInterface} = 'org::allbinary::graphics::ScreenEmptyListener'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::ScreenListenerHandler::instance;
}


sub setListener {
    my ($self, $screenListenerInterface) = @_;
        $self->{screenListenerInterface} = $screenListenerInterface;
}


sub fireWithState {
    my ($self, $isFullScreen) = @_;
        $self->{screenListenerInterface}->onFullScreen($isFullScreen);
}


sub fire {
    my ($self) = @_;
        $self->{screenListenerInterface}->onFullScreenDisplay();
}

use org::allbinary::graphics::ScreenEmptyListener;

1;

