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

package org::allbinary::animation::image::LeftToRightImageAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::ImageSegmentAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{currentWidth} = undef;
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
}


sub new {
    my ($class, $image, $sequenceArray, $animationBehavior) = @_;
    my $self = $class->SUPER::new($image, $sequenceArray, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{currentWidth} = 0;
        if ($self->getSequence()->[0] == -1) {
            $self->setFrame($self->getSize() - 1);
        }
    return $self;
}


sub nextFrame {
    my ($self) = @_;
        if ($self->getSequence()->[0] == -1) {
            $self->SUPER::previousFrame();
        } else {
            $self->SUPER::nextFrame();
        }
        $self->update();
}


sub previousFrame {
    my ($self) = @_;
        if ($self->getSequence()->[0] == -1) {
            $self->SUPER::nextFrame();
        } else {
            $self->SUPER::previousFrame();
        }
        $self->update();
}


sub setFrame {
    my ($self, $index) = @_;
        $self->SUPER::setFrame($index);
        $self->update();
}


sub update {
    my ($self) = @_;
        $self->{currentWidth} = $self->getDrawWidth() * $self->getFrame() / $self->getSize();
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $graphics->drawRegion($self->getImage(), $self->getStartX(), $self->getStartY(), $self->{currentWidth}, $self->getDrawHeight(), $javax::microedition::lcdui::game::Sprite::TRANS_NONE, $x, $y, $self->{anchor});
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::graphics::Anchor;
use org::allbinary::animation::image::ImageSegmentAnimation;

1;

