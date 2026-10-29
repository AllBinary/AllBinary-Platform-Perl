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

package org::allbinary::game::graphics::hud::HudGraphicsPosition;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_HUD_GRAPHICS_POSITION = 'org::allbinary::game::graphics::hud::HudGraphicsPosition'->new('org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}, 9);

sub _init_fields {
    my ($self) = @_;
    $self->{anchor} = 0;
    $self->{point} = 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO};
}


sub new {
    my ($class, $point, $anchor) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setAnchor($anchor);
        $self->setPoint($point);
    return $self;
}


sub getAnchor {
    my ($self) = @_;
        return $self->{anchor};
}


sub setAnchor {
    my ($self, $anchor) = @_;
        $self->{anchor} = $anchor;
}


sub getPoint {
    my ($self) = @_;
        return $self->{point};
}


sub setPoint {
    my ($self, $point) = @_;
        $self->{point} = $point;
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;

1;

