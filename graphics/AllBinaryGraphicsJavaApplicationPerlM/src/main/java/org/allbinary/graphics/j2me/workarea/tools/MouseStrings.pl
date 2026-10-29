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

package org::allbinary::graphics::j2me::workarea::tools::MouseStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::j2me::workarea::tools::MouseStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{MOUSE_PRESSED} = "mousePressed";
    $self->{MOUSE_RELEASED} = "mouseReleased";
    $self->{MOUSE_CLICKED} = "mouseClicked";
    $self->{MOUSE_DRAGGED} = "mouseDragged";
    $self->{MOUSE_MOVED} = "mouseMoved";
    $self->{MOUSE_PRESSED_LABEL} = "MousePressed" . 'org::allbinary::string::CommonSeps'->getInstance()->{COLON_SEP};
    $self->{MOUSE_RELEASED_LABEL} = "MouseReleased" . 'org::allbinary::string::CommonSeps'->getInstance()->{COLON_SEP};
    $self->{MOUSE_CLICKED_LABEL} = "MouseClicked" . 'org::allbinary::string::CommonSeps'->getInstance()->{COLON_SEP};
    $self->{MOUSE_DRAGGED_LABEL} = "MouseDragged" . 'org::allbinary::string::CommonSeps'->getInstance()->{COLON_SEP};
    $self->{MOUSE_MOVED_LABEL} = "MouseMoved" . 'org::allbinary::string::CommonSeps'->getInstance()->{COLON_SEP};
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::j2me::workarea::tools::MouseStrings::instance;
}

use org::allbinary::string::CommonSeps;

1;

