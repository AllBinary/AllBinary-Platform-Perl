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

package org::allbinary::graphics::paint::AnimationCompositePaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::InitUpdatePaintable';


sub _init_fields {
    my ($self) = @_;
    $self->{animationInterface} = undef;
}


sub new {
    my ($class, $animationInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{animationInterface} = $animationInterface;
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{animationInterface}->paintXY($graphics, 0, 0);
}


sub paintThreed {
    my ($self, $graphics) = @_;
        $self->{animationInterface}->paintThreedXYZ($graphics, 0, 0, 0);
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::graphics::paint::InitUpdatePaintable;

1;

