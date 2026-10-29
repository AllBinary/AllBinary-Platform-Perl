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

package org::allbinary::animation::image::sprite::AdjustedSpriteIndexedAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::sprite::SpriteIndexedAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{dx} = undef;
    $self->{dy} = undef;
}


sub new {
    my ($class, $sprite, $image, $basicColorArray, $dx, $dy, $animationBehavior) = @_;
    my $self = $class->SUPER::new($sprite, $image, $basicColorArray, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{dx} = $dx;
        $self->{dy} = $dy;
    return $self;
}


sub paintFrame {
    my ($self, $graphics, $frame, $x, $y) = @_;
        $self->setFrame($frame);
        $self->{sprite}->setPosition($x + $self->{dx}, $y + $self->{dy});
        $self->SUPER::paint($graphics);
}


sub paintXY {
    my ($self, $g, $x, $y) = @_;
        $self->{sprite}->setPosition($x + $self->{dx}, $y + $self->{dy});
        $self->SUPER::paint($g);
}


sub paint {
    my ($self, $g) = @_;
        $self->{sprite}->setPosition($self->{dx}, $self->{dy});
        $self->SUPER::paint($g);
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorUtil;
use org::allbinary::animation::image::sprite::SpriteIndexedAnimation;

1;

