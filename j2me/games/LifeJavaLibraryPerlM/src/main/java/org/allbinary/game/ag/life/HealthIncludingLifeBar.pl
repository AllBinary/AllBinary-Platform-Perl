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

package org::allbinary::game::ag::life::HealthIncludingLifeBar;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::Paintable','org::allbinary::game::health::HealthListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{animationInterface} = undef;
    $self->{life} = undef;
    $self->{healthInterface} = undef;
    $self->{allbinaryLayer} = undef;
}


# throws Exception
sub createHealthIncludingLifeBar {
    my ($class, $layerInterface, $life, $healthInterface, $location, $direction) = @_;
        return 'org::allbinary::game::ag::life::HealthIncludingLifeBar'->new($layerInterface, $life, $healthInterface, 'org::allbinary::game::health::HealthBarTwodAnimation'->new($layerInterface, $location), $direction);
}


sub new {
    my ($class, $layerInterface, $life, $healthInterface, $animationInterface, $direction) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{allbinaryLayer} = $layerInterface;
        $self->{animationInterface} = $animationInterface;
        $self->{life} = $life;
        $self->{healthInterface} = $healthInterface;
        $self->{healthInterface}->addListener($self);
        $self->onHealthChange();
    return $self;
}


sub onHealthChange {
    my ($self) = @_;
        $self->{animationInterface}->onHealthChange((($self->{healthInterface}->getHealth() + ($self->{healthInterface}->getMaxHealth() * $self->{life}->get())) * $self->{allbinaryLayer}->getWidth()) / ($self->{healthInterface}->getMaxHealth() + ($self->{healthInterface}->getMaxHealth() * $self->{life}->getStartLives())));
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{animationInterface}->paintXY($graphics, 0, 0);
}


sub paintThreed {
    my ($self, $graphics) = @_;
        $self->{animationInterface}->paintThreedXYZ($graphics, 0, 0, 0);
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::health::Health;
use org::allbinary::game::health::HealthBarAnimation;
use org::allbinary::game::health::HealthBarTwodAnimation;
use org::allbinary::game::health::HealthInterface;
use org::allbinary::game::health::HealthListenerInterface;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::layer::AllBinaryLayer;

1;

