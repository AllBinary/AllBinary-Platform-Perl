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

package org::allbinary::animation::image::sprite::SpriteIndexedAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation','org::allbinary::graphics::color::ColorCompositeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{sprite} = undef;
    $self->{image} = undef;
    $self->{basicColorArray} = undef;
}


sub new {
    my ($class, $sprite, $image, $basicColorArray, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{sprite} = $sprite;
        $self->{image} = $image;
        $self->{basicColorArray} = $basicColorArray;
        if (scalar(@{$self->{basicColorArray}}) != 0 && $self->getSize() != scalar(@{$self->{basicColorArray}})) {
            die ('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{TOTAL_LABEL})->appendint($self->getSize())->append("!=")->appendint(scalar(@{$self->{basicColorArray}}))->toString());
        }
    return $self;
}


# throws Exception
sub getAnimationSize {
    my ($self) = @_;
        return $self->getSize();
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        for (my $index = 0; $index < scalar(@{$self->{basicColorArray}}); $index++) {
            if ($basicColor == $self->{basicColorArray}->[$index]) {
                $self->setFrame($index);
                last;
            }
        }
}


sub getBasicColorP {
    my ($self) = @_;
        if (scalar(@{$self->{basicColorArray}}) < $self->getFrame()) {
            return $self->{basicColorArray}->[$self->getFrame()];
        } else {
            return 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE};
        }
}


sub paintFrame {
    my ($self, $graphics, $frame, $x, $y) = @_;
        $self->setFrame($frame);
        $self->{sprite}->setPosition($x, $y);
        $self->{sprite}->paint($graphics);
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{sprite}->setPosition($x, $y);
        $self->{sprite}->paint($graphics);
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{sprite}->paint($graphics);
}


sub nextFrame {
    my ($self) = @_;
        $self->{sprite}->nextFrame();
}


sub previousFrame {
    my ($self) = @_;
        $self->{sprite}->prevFrame();
}


sub getSize {
    my ($self) = @_;
        return $self->{sprite}->getRawFrameCount();
}


sub setFrame {
    my ($self, $frame) = @_;
        $self->{sprite}->setFrame($frame);
}


sub getFrame {
    my ($self) = @_;
        return $self->{sprite}->getFrame();
}


sub isLastFrame {
    my ($self) = @_;
        if ($self->{sprite}->getFrame() == $self->getSize() - 1) {
            return 1;
        } else {
            return 0;
        }
}


sub getLastFrame {
    my ($self) = @_;
        return $self->getSize();
}


sub setSequence {
    my ($self, $sequence) = @_;
}


sub getSequence {
    my ($self) = @_;
        return 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance();
}


# throws Exception
sub close {
    my ($self) = @_;
}


# throws Throwable
sub finalize {
    my ($self) = @_;
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::color::ColorCompositeInterface;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;

1;

