# Generated Code Do Not Modify

package org::allbinary::animation::FillAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{pixelBuffer} = undef;
    $self->{width} = undef;
    $self->{height} = undef;
}


sub new {
    my ($class, $pixelBuffer, $width, $height, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{width} = 100;
        $self->{height} = 100;
        $self->{pixelBuffer} = $pixelBuffer;
    return $self;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        my $changed = 0;
        if (!defined($self->getBasicColorP()) || int($self->getBasicColorP()) != int($basicColor)) {
            $changed = 1;
        }
        $self->SUPER::setBasicColorP($basicColor);
        if ($changed) {
            $self->updateModifiers();
        }
}


sub changeBasicColor {
    my ($self, $basicColor) = @_;
        my $changed = 0;
        if (!defined($self->getChangeBasicColor()) || int($self->getChangeBasicColor()) != int($basicColor)) {
            $changed = 1;
        }
        $self->SUPER::changeBasicColor($basicColor);
        if ($changed) {
            $self->updateModifiers();
        }
}


sub setAlpha {
    my ($self, $alpha) = @_;
        my $changed = 0;
        if ($self->{alphaP} != $alpha) {
            $changed = 1;
        }
        $self->SUPER::setAlpha($alpha);
        if ($changed) {
            $self->updateModifiers();
        }
}


sub setScale {
    my ($self, $scaleX, $scaleY) = @_;
}


sub setMaxScale {
    my ($self, $maxScaleX, $maxScaleY) = @_;
}


sub updateModifiers {
    my ($self) = @_;
}


sub paint {
    my ($self, $g) = @_;
        $g->drawRGB($self->{pixelBuffer}, 0, $self->{width}, 0, 0, $self->{width}, $self->{height}, 1);
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::animation::IndexedAnimation;

1;

