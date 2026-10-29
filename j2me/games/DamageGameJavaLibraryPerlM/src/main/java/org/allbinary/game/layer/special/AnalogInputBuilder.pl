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

package org::allbinary::game::layer::special::AnalogInputBuilder;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::special::AnalogInputBuilder'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::special::AnalogInputBuilder::instance;
}


sub disable {
    my ($self, $inputProcessorArray, $collidableDestroyableDamageableLayer) = @_;
        $inputProcessorArray->[$javax::microedition::lcdui::Canvas::UP] = 'org::allbinary::game::layer::special::SpecialUpGameInputProcessor'->new($collidableDestroyableDamageableLayer);
        $inputProcessorArray->[$javax::microedition::lcdui::Canvas::DOWN] = 'org::allbinary::game::layer::special::SpecialDownGameInputProcessor'->new($collidableDestroyableDamageableLayer);
        $inputProcessorArray->[$javax::microedition::lcdui::Canvas::RIGHT] = 'org::allbinary::game::layer::special::SpecialRightGameInputProcessor'->new($collidableDestroyableDamageableLayer);
        $inputProcessorArray->[$javax::microedition::lcdui::Canvas::LEFT] = 'org::allbinary::game::layer::special::SpecialLeftGameInputProcessor'->new($collidableDestroyableDamageableLayer);
        $inputProcessorArray->[$javax::microedition::lcdui::Canvas::KEY_NUM0] = 'org::allbinary::game::layer::special::Special1GameInputProcessor'->new($collidableDestroyableDamageableLayer);
        $inputProcessorArray->[$javax::microedition::lcdui::Canvas::KEY_NUM5] = 'org::allbinary::game::layer::special::Special3GameInputProcessor'->new($collidableDestroyableDamageableLayer);
}


sub enable {
    my ($self, $inputProcessorArray, $collidableDestroyableDamageableLayer) = @_;
        $inputProcessorArray->[$javax::microedition::lcdui::Canvas::UP] = 'org::allbinary::game::layer::special::SpecialAnalogUpGameInputProcessor'->new($collidableDestroyableDamageableLayer);
        $inputProcessorArray->[$javax::microedition::lcdui::Canvas::DOWN] = 'org::allbinary::game::layer::special::SpecialAnalogDownGameInputProcessor'->new($collidableDestroyableDamageableLayer);
        $inputProcessorArray->[$javax::microedition::lcdui::Canvas::RIGHT] = 'org::allbinary::game::layer::special::SpecialAnalogRightGameInputProcessor'->new($collidableDestroyableDamageableLayer);
        $inputProcessorArray->[$javax::microedition::lcdui::Canvas::LEFT] = 'org::allbinary::game::layer::special::SpecialAnalogLeftGameInputProcessor'->new($collidableDestroyableDamageableLayer);
        $inputProcessorArray->[$javax::microedition::lcdui::Canvas::KEY_NUM0] = 'org::allbinary::game::layer::special::SpecialAnalogLeftTriggerGameInputProcessor'->new($collidableDestroyableDamageableLayer);
        $inputProcessorArray->[$javax::microedition::lcdui::Canvas::KEY_NUM5] = 'org::allbinary::game::layer::special::SpecialAnalogRightTriggerGameInputProcessor'->new($collidableDestroyableDamageableLayer);
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::input::GameInputProcessor;
use org::allbinary::game::layer::special::SpecialUpGameInputProcessor;
use org::allbinary::game::layer::special::SpecialDownGameInputProcessor;
use org::allbinary::game::layer::special::SpecialRightGameInputProcessor;
use org::allbinary::game::layer::special::SpecialLeftGameInputProcessor;
use org::allbinary::game::layer::special::Special1GameInputProcessor;
use org::allbinary::game::layer::special::Special3GameInputProcessor;
use org::allbinary::game::layer::special::SpecialAnalogUpGameInputProcessor;
use org::allbinary::game::layer::special::SpecialAnalogDownGameInputProcessor;
use org::allbinary::game::layer::special::SpecialAnalogRightGameInputProcessor;
use org::allbinary::game::layer::special::SpecialAnalogLeftGameInputProcessor;
use org::allbinary::game::layer::special::SpecialAnalogLeftTriggerGameInputProcessor;
use org::allbinary::game::layer::special::SpecialAnalogRightTriggerGameInputProcessor;

1;

