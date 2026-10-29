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

package org::allbinary::animation::image::AdjustedRightToLeftImageAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::RightToLeftImageAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{dx} = 0;
    $self->{dy} = 0;
}


sub new {
    my ($class, $image, $dx, $dy, $animationBehavior) = @_;
    my $self = $class->SUPER::new($image, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->init($dx, $dy);
    return $self;
}


# throws Exception
sub init {
    my ($self, $dx, $dy) = @_;
        $self->{dx} = $dx;
        $self->{dy} = $dy;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->SUPER::paintXY($graphics, $x + $self->{dx}, $y + $self->{dy});
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::image::RightToLeftImageAnimation;

1;

