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

package org::allbinary::animation::ColorLessVectorAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::VectorAnimation';



sub new {
    my ($class, $currentPoints, $animationBehavior) = @_;
    my $self = $class->SUPER::new($currentPoints, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE}, $animationBehavior);
        # super(...) made $self above
    return $self;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->paintVectors($graphics, $x, $y);
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::animation::VectorAnimation;

1;

