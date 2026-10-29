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

package org::allbinary::graphics::Line;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{p1} = undef;
    $self->{p2} = undef;
    $self->{deltaX} = 0.0;
    $self->{deltaY} = 0.0;
}


sub new {
    my ($class, $p1, $p2) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{p1} = 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO};
        $self->{p2} = $self->{p1};
        $self->setP1($p1);
        $self->setP2($p2);
    return $self;
}


sub getGradient {
    my ($self) = @_;
        return $self->getDeltaY() / $self->getDeltaX();
}


sub update {
    my ($self) = @_;
        $self->{deltaX} = $self->getP1()->getX() - $self->getP2()->getX();
        $self->{deltaY} = $self->getP1()->getY() - $self->getP2()->getY();
}


sub getDeltaX {
    my ($self) = @_;
        return $self->{deltaX};
}


sub getDeltaY {
    my ($self) = @_;
        return $self->{deltaY};
}


sub getP1 {
    my ($self) = @_;
        return $self->{p1};
}


sub getP2 {
    my ($self) = @_;
        return $self->{p2};
}


sub setP1 {
    my ($self, $p1) = @_;
        $self->{p1} = $p1;
        $self->update();
}


sub setP2 {
    my ($self, $p2) = @_;
        $self->{p2} = $p2;
        $self->update();
}

use org::allbinary::graphics::PointFactory;

1;

