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

package org::allbinary::animation::image::sprite::AllBinaryAdjustedSpriteRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::sprite::AllBinarySpriteRotationAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{dx} = undef;
    $self->{dy} = undef;
}


sub new {
    my ($class, $sprite, $image, $dx, $dy, $animationBehavior) = @_;
    my $self = $class->SUPER::new($sprite, $image, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{dx} = $dx;
        $self->{dy} = $dy;
    return $self;
}


sub paintXY {
    my ($self, $g, $x, $y) = @_;
        $self->{sprite}->setPosition($x + $self->{dx}, $y + $self->{dy});
        $self->paint($g);
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::image::sprite::AllBinarySpriteRotationAnimation;

1;

