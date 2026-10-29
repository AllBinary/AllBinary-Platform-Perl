# Generated Code Do Not Modify

package org::allbinary::animation::vector::ARectangleFilledAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::vector::RectangleFilledAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{x} = 0;
    $self->{y} = 0;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(0, 0, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK});
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub nextFrame {
    my ($self) = @_;
}


sub paintXY {
    my ($self, $graphics, $unusedX, $unusedY) = @_;
        $self->SUPER::paintXY($graphics, $self->{x}, $self->{y});
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::animation::vector::RectangleFilledAnimation;

1;

