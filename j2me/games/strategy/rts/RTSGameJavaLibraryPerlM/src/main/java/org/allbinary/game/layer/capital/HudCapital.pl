# 
# AllBinary Open License Version 1 
# Copyright (c) 2002 AllBinary 
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

package org::allbinary::game::layer::capital::HudCapital;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::capital::Capital';


sub _init_fields {
    my ($self) = @_;
    $self->{capitalGraphic} = undef;
}


sub new {
    my ($class, $moneyGraphic) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{capitalGraphic} = $moneyGraphic;
    return $self;
}


sub removeMoney {
    my ($self, $points) = @_;
        $self->SUPER::removeMoney($points);
        $self->{capitalGraphic}->reduce($points);
}


sub getTotalMoney {
    my ($self) = @_;
        return $self->{capitalGraphic}->get();
}


sub addMoney {
    my ($self, $points) = @_;
        $self->SUPER::addMoney($points);
        $self->{capitalGraphic}->add($points);
}

use org::allbinary::game::ag::layer::hud::basic::NumberStringHud;
use org::allbinary::game::layer::capital::Capital;

1;

