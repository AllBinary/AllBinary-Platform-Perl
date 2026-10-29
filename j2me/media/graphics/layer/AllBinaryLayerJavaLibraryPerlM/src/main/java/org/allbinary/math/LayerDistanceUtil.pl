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

package org::allbinary::math::LayerDistanceUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::math::LayerDistanceUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{mathUtil} = 'org::allbinary::logic::math::MathUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::math::LayerDistanceUtil::instance;
}


sub getDistance {
    my ($self, $layerInterface, $layerInterface2) = @_;
        my $dx = ($layerInterface->getXP() + $layerInterface->getHalfWidth()) - ($layerInterface2->getXP() + $layerInterface2->getHalfWidth());
        my $dy = ($layerInterface->getYP() + $layerInterface->getHalfHeight()) - ($layerInterface2->getYP() + $layerInterface2->getHalfHeight());
        return int($self->{mathUtil}->sqrt(($dx * $dx) + ($dy * $dy)));
}


sub getDistance3D {
    my ($self, $layerInterface, $layerInterface2) = @_;
        my $dx = ($layerInterface->getXP() + $layerInterface->getHalfWidth()) - ($layerInterface2->getXP() + $layerInterface2->getHalfWidth());
        my $dy = ($layerInterface->getYP() + $layerInterface->getHalfHeight()) - ($layerInterface2->getYP() + $layerInterface2->getHalfHeight());
        my $dz = ($layerInterface->getZP() + $layerInterface->getHalfDepth()) - ($layerInterface2->getZP() + $layerInterface2->getHalfDepth());
        return int($self->{mathUtil}->sqrt(($dx * $dx) + ($dy * $dy) + ($dz * $dz)));
}


sub getDistanceAt {
    my ($self, $layerInterface, $point) = @_;
        my $dx = $layerInterface->getXP() - $point->getX();
        my $dy = $layerInterface->getYP() - $point->getY();
        return int($self->{mathUtil}->sqrt(($dx * $dx) + ($dy * $dy)));
}

use org::allbinary::graphics::GPoint;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::math::MathUtil;

1;

