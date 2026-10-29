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

package org::allbinary::game::health::HealthBarAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::animation::Animation';


sub _init_fields {
    my ($self) = @_;
    $self->{basicColorFactory} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
    $self->{x2} = 0;
    $self->{thickness} = 0;
    $self->{location} = undef;
    $self->{allbinaryLayer} = undef;
}


sub new {
    my ($class, $layerInterface, $location) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{allbinaryLayer} = $layerInterface;
        $self->{location} = $location;
        my $basicHudFactory = 'org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance();
        if ($self->{location} != $basicHudFactory->{TOPLEFT} && $self->{location} != $basicHudFactory->{BOTTOMLEFT}) {
            die ("Location Not Valid");
        }
        if ($layerInterface->getWidth() > 40) {
            $self->{thickness} = 3;
        } elsif ($layerInterface->getWidth() > 20) {
            $self->{thickness} = 2;
        } else {
            $self->{thickness} = 1;
        }
    return $self;
}


sub onHealthChange {
    my ($self, $newX2) = @_;
        $self->{x2} = $newX2;
        my $quarter = (POSIX::floor(($self->{allbinaryLayer}->getWidth()) / (2 ** (2))));
        if ($self->{x2} > $quarter * 3) {
            $self->{basicColor} = $self->{basicColorFactory}->{GREEN};
            $self->{colorP} = int($self->{basicColor});
        } elsif ($self->{x2} > $quarter * 2) {
            $self->{basicColor} = $self->{basicColorFactory}->{YELLOW};
            $self->{colorP} = int($self->{basicColor});
        } elsif ($self->{x2} > $quarter) {
            $self->{basicColor} = $self->{basicColorFactory}->{ORANGE};
            $self->{colorP} = int($self->{basicColor});
        } else {
            $self->{basicColor} = $self->{basicColorFactory}->{RED};
            $self->{colorP} = int($self->{basicColor});
        }
}


sub getY {
    my ($self) = @_;
        my $basicHudFactory = 'org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance();
        if ($self->{location} == $basicHudFactory->{TOPLEFT}) {
            return $self->{allbinaryLayer}->getViewPosition()->getY() - 4;
        } elsif ($self->{location} == $basicHudFactory->{BOTTOMLEFT}) {
            return $self->{allbinaryLayer}->getViewPosition()->getY2() + 4;
        }
        return -1;
}

use org::allbinary::animation::Animation;
use org::allbinary::game::graphics::hud::BasicHudFactory;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::layer::AllBinaryLayer;

1;

