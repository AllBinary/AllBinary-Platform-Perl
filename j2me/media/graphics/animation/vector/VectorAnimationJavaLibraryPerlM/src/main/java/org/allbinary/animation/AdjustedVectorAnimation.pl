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

package org::allbinary::animation::AdjustedVectorAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::VectorAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{dx} = undef;
    $self->{dy} = undef;
}


sub new {
    my ($class, $currentPoints, $basicColor, $dx, $dy, $animationBehavior) = @_;
    my $self = $class->SUPER::new($currentPoints, $basicColor, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{dx} = $dx;
        $self->{dy} = $dy;
    return $self;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->SUPER::paintXY($graphics, $x + $self->{dx}, $y + $self->{dy});
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::animation::VectorAnimation;

1;

