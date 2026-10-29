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

package org::allbinary::game::combat::damage::PtsDamageFloaters;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::combat::damage::DamageFloaters';

our $basicColorArrayIndexer = 'org::allbinary::graphics::color::BasicColorArrayIndexer'->new(['org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{YELLOW}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLUE}]);

sub _init_fields {
    my ($self) = @_;
    $self->{basicSetColorUtil} = 'org::allbinary::graphics::color::BasicColorSetUtil'->getInstance();
    $self->{layerInterface} = undef;
    $self->{lastDamage} = [(0) x (5)];
    $self->{lastDamageString} = [map { [("\0") x (0)] } 1 .. (5)];
    $self->{lastDamageStringSizeArray} = [(0) x (5)];
    $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance(5);
    $self->{primitiveLongUtil} = undef;
    $self->{myRandomFactory} = 'org::allbinary::game::rand::MyRandomFactory'->getInstance();
}


sub new {
    my ($class, $layerInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{primitiveLongUtil} = 'org::allbinary::logic::math::PrimitiveLongUtil'->createPowerOfTen(100000);
        $self->{layerInterface} = $layerInterface;
        my $CHAR_ARRAY = 'org::allbinary::logic::java::character::CharArrayFactory'->getInstance()->getZeroCharArray();
        for (my $index = scalar(@{$self->{lastDamageString}}) - 1; $index >= 0; $index--) {
            $self->{lastDamageString}->[$index] = $CHAR_ARRAY;
        }
    return $self;
}


sub add {
    my ($self, $damage) = @_;
        my $index = $self->{circularIndexUtil}->getIndex();
        $self->{lastDamage}->[$index] = $damage;
        $self->{lastDamageString}->[$index] = $self->{primitiveLongUtil}->getCharArray($self->{lastDamage}->[$index]);
        $self->{lastDamageStringSizeArray}->[$index] = $self->{primitiveLongUtil}->getCurrentTotalDigits();
        $self->{circularIndexUtil}->next();
}


sub paint {
    my ($self, $graphics) = @_;
        my $viewPosition = $self->{layerInterface}->getViewPosition();
        my $x = $viewPosition->getX();
        my $y = $viewPosition->getY();
        for (my $index = scalar(@{$self->{lastDamage}}) - 1; $index >= 0; $index--) {
            if ($self->{lastDamage}->[$index] != 0) {
                my $delta = 10 * ($index + 2);
                $self->{basicSetColorUtil}->setBasicColorP($graphics, $org::allbinary::game::combat::damage::PtsDamageFloaters::basicColorArrayIndexer->get());
                $graphics->drawChars($self->{lastDamageString}->[$index], 0, $self->{lastDamageStringSizeArray}->[$index], $x - $self->{myRandomFactory}->getNextInt($delta), $y - $delta, 0);
                $org::allbinary::game::combat::damage::PtsDamageFloaters::basicColorArrayIndexer->next();
            }
            $self->{lastDamage}->[$index] = 0;
        }
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorArrayIndexer;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::color::BasicColorSetUtil;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::java::character::CharArrayFactory;
use org::allbinary::logic::math::PrimitiveLongUtil;
use org::allbinary::util::CircularIndexUtil;
use org::allbinary::view::ViewPosition;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::combat::damage::DamageFloaters;

1;

