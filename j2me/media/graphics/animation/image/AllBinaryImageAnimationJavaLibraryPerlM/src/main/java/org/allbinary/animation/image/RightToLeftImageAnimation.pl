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

package org::allbinary::animation::image::RightToLeftImageAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::ImageSegmentAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{startWidth} = 0;
    $self->{currentWidth} = 0;
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
}


sub new {
    my ($class, $image, $animationBehavior) = @_;
    my $self = $class->SUPER::new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->setFrame($self->getSize() - 1);
    return $self;
}


sub nextFrame {
    my ($self) = @_;
        $self->SUPER::previousFrame();
        $self->update();
}


sub previousFrame {
    my ($self) = @_;
        $self->SUPER::nextFrame();
        $self->update();
}


sub setFrame {
    my ($self, $index) = @_;
        $self->SUPER::setFrame($index);
        $self->update();
}


sub update {
    my ($self) = @_;
        $self->{startWidth} = $self->getDrawWidth() * $self->getFrame() / $self->getSize();
        $self->{currentWidth} = $self->getDrawWidth() - $self->{startWidth};
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $graphics->drawRegion($self->getImage(), $self->{startWidth}, $self->getStartY(), $self->{currentWidth}, $self->getDrawHeight(), $javax::microedition::lcdui::game::Sprite::TRANS_NONE, $x + $self->{startWidth}, $y, $self->{anchor});
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::graphics::Anchor;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::animation::image::ImageSegmentAnimation;

1;

