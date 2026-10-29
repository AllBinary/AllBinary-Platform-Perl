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

package org::allbinary::animation::Animation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterface','org::allbinary::image::opengles::OpenGLSurfaceChangedInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{basicSetColorUtil} = 'org::allbinary::graphics::color::BasicColorSetUtil'->getInstance();
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE};
    $self->{colorP} = 0;
    $self->{changeBasicColorP} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{NULL_COLOR};
    $self->{changeColorP} = 0;
    $self->{alphaP} = 0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub setAlpha {
    my ($self, $alpha) = @_;
        $self->{alphaP} = $alpha;
}


# throws Exception
sub nextFrame {
    my ($self) = @_;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{basicSetColorUtil}->setBasicColorP3($graphics, $self->getBasicColorP(), $self->getColor());
}


sub paintThreedXYZ {
    my ($self, $graphics, $x, $y, $z) = @_;
}


sub isThreed {
    my ($self) = @_;
        return 0;
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->{basicColor};
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{basicColor} = $basicColor;
        $self->{colorP} = int($self->{basicColor});
}


sub setBackgroundBasicColorP {
    my ($self, $basicColor) = @_;
}


sub getChangeBasicColor {
    my ($self) = @_;
        return $self->{changeBasicColorP};
}


sub changeBasicColor {
    my ($self, $basicColor) = @_;
        $self->{changeBasicColorP} = $basicColor;
        $self->{changeColorP} = int($self->{changeBasicColorP});
}


sub getChangeColor {
    my ($self) = @_;
        return $self->{changeColorP};
}


sub getColor {
    my ($self) = @_;
        return $self->{colorP};
}


sub setScale {
    my ($self, $scaleX, $scaleY) = @_;
}


sub setMaxScale {
    my ($self, $maxScaleX, $maxScaleY) = @_;
}


# throws Exception
sub set {
    my ($self, $gl) = @_;
}


sub setDx {
    my ($self, $dx) = @_;
}


sub getDx {
    my ($self) = @_;
        return 0;
}


sub setDy {
    my ($self, $dy) = @_;
}


sub getDy {
    my ($self) = @_;
        return 0;
}

# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::color::BasicColorSetUtil;
use org::allbinary::image::opengles::OpenGLSurfaceChangedInterface;
use org::allbinary::animation::AnimationInterface;

1;

