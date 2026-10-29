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

package org::allbinary::game::combat::damage::AnimationDamageFloaters;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::combat::damage::DamageFloaters';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{layerInterface} = undef;
    $self->{animationInterfaceArray} = undef;
    $self->{circularIndexUtil} = undef;
    $self->{dx} = undef;
    $self->{dy} = undef;
}


sub new {
    my ($class, $layerInterface, $animationInterfaceArray, $dx, $dy) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{animationInterfaceArray} = $animationInterfaceArray;
        for (my $index = scalar(@{$self->{animationInterfaceArray}}) - 1; $index >= 0; $index--) {
            $self->{animationInterfaceArray}->[$index]->setFrame($self->{animationInterfaceArray}->[$index]->getSize() - 1);
        }
        $self->{layerInterface} = $layerInterface;
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance(scalar(@{$self->{animationInterfaceArray}}));
        $self->{dx} = $dx;
        $self->{dy} = $dy;
    return $self;
}


sub add {
    my ($self, $damage) = @_;
        my $i = $self->{circularIndexUtil}->getIndex();
        $self->{animationInterfaceArray}->[$i]->setFrame(0);
        $self->{circularIndexUtil}->next();
}


sub paint {
    my ($self, $graphics) = @_;
        try {
            my $viewPosition = $self->{layerInterface}->getViewPosition();
            my $x = $viewPosition->getX();
            my $y = $viewPosition->getY();
            for (my $index = 0; $index < scalar(@{$self->{animationInterfaceArray}}); $index++) {
                my $animationInterface = $self->{animationInterfaceArray}->[$index];
                if ($animationInterface->getFrame() < $animationInterface->getAnimationSize() - 1) {
                    my $delta = $animationInterface->getFrame() * 20;
                    $animationInterface->paintXY($graphics, $x + $self->{dx}, $y - $delta + $self->{dy});
                    $animationInterface->nextFrame();
                }
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            my $canvasStrings = 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $canvasStrings->{PAINT}, $e);
        }
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::CircularIndexUtil;
use org::allbinary::view::ViewPosition;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::combat::damage::DamageFloaters;

1;

