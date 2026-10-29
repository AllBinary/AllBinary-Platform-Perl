# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::animation::text::AdjustCustomTextAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::text::CustomTextAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{dx} = undef;
    $self->{dy} = undef;
}


sub new {
    my ($class, $text, $fontSize, $dx, $dy, $animationBehavior) = @_;
    my $self = $class->SUPER::new($text, $fontSize, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{dx} = $dx;
        $self->{dy} = $dy;
    return $self;
}


sub getDx {
    my ($self) = @_;
        return $self->{dx};
}


sub setDx {
    my ($self, $dx) = @_;
        $self->{dx} = $dx;
}


sub getDy {
    my ($self) = @_;
        return $self->{dy};
}


sub setDy {
    my ($self, $dy) = @_;
        $self->{dy} = $dy;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->SUPER::paintXY($graphics, $x + $self->{dx}, $y + $self->{dy});
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::text::CustomTextAnimation;

1;

