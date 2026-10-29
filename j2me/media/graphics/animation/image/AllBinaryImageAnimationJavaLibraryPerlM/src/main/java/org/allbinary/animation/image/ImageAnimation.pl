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

package org::allbinary::animation::image::ImageAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{image} = undef;
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
}


sub new {
    my ($class, $image, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{image} = $image;
    return $self;
}


# throws Exception
sub getAnimationSize {
    my ($self) = @_;
        return $self->getSize();
}


sub nextFrame {
    my ($self) = @_;
}


sub previousFrame {
    my ($self) = @_;
}


sub setFrame {
    my ($self, $index) = @_;
}


sub getFrame {
    my ($self) = @_;
        return 0;
}


sub getSize {
    my ($self) = @_;
        return 1;
}


sub setSequence {
    my ($self, $sequence) = @_;
}


sub getSequence {
    my ($self) = @_;
        return 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance();
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $graphics->drawImage($self->{image}, $x, $y, $self->{anchor});
}


sub getImage {
    my ($self) = @_;
        return $self->{image};
}


# throws Exception
sub close {
    my ($self) = @_;
        'org::allbinary::DisposalUtil'->getInstance()->disposeImage($self->{image});
}


# throws Throwable
sub finalize {
    my ($self) = @_;
        'org::allbinary::DisposalUtil'->getInstance()->disposeImage($self->{image});
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::DisposalUtil;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::graphics::Anchor;
use org::allbinary::logic::math::PrimitiveIntUtil;

1;

