# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::layer::LinePathRelativeAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::LinePathAnimation';

our $instanceC = 'org::allbinary::game::layer::LinePathRelativeAnimation'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::LinePathRelativeAnimation::instanceC;
}


sub paint {
    my ($self, $graphics, $point, $nextPoint, $tiledLayer) = @_;
        $graphics->drawLine($nextPoint->getX() - $tiledLayer->getXP(), $nextPoint->getY() - $tiledLayer->getYP(), $point->getX() - $tiledLayer->getXP(), $point->getY() - $tiledLayer->getYP());
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::GPoint;
use org::allbinary::layer::Layer;
use org::allbinary::game::layer::LinePathAnimation;

1;

