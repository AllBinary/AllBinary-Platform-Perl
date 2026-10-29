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

package org::allbinary::game::health::HealthBarTwodAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::health::HealthBarAnimation';



sub new {
    my ($class, $layerInterface, $location) = @_;
    my $self = $class->SUPER::new($layerInterface, $location);
        # super(...) made $self above
    return $self;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        my $ax = $self->{allbinaryLayer}->getViewPosition()->getX();
        $self->{basicSetColorUtil}->setBasicColorP3($graphics, $self->{basicColor}, $self->{colorP});
        $graphics->fillRect($ax, $self->getY() - 1, $self->{x2}, $self->{thickness});
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::game::health::HealthBarAnimation;

1;

