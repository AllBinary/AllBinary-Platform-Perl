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

package org::allbinary::layer::Layer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $ID = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0);

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{x} = 0;
    $self->{y} = 0;
    $self->{z} = 3;
    $self->{width} = 0;
    $self->{height} = 0;
    $self->{visible} = 1;
}


sub new {
    my ($class, $width, $height) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setLayerWidth($width);
        $self->setLayerHeight($height);
    return $self;
}


sub setPosition {
    my ($self, $x, $y, $z) = @_;
        $self->{x} = $x;
        $self->{y} = $y;
        $self->{z} = $z;
}


sub moveDXY {
    my ($self, $dx, $dy) = @_;
        $self->{x} += $dx;
        $self->{y} += $dy;
}


sub moveDXYZ {
    my ($self, $dx, $dy, $dz) = @_;
        $self->{x} += $dx;
        $self->{y} += $dy;
        $self->{z} += $dz;
}


sub getXP {
    my ($self) = @_;
        return $self->{x};
}


sub getYP {
    my ($self) = @_;
        return $self->{y};
}


sub getZP {
    my ($self) = @_;
        return $self->{z};
}


sub getWidth {
    my ($self) = @_;
        return $self->{width};
}


sub getHeight {
    my ($self) = @_;
        return $self->{height};
}


sub getDepth {
    my ($self) = @_;
        return 0;
}


sub setVisible {
    my ($self, $visible) = @_;
        $self->{visible} = $visible;
}


sub isVisible {
    my ($self) = @_;
        return $self->{visible};
}


sub paint {
    my ($self, $graphics) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $canvasStrings = 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance();
        $self->{logUtil}->putF($commonStrings->{NOT_IMPLEMENTED}, $self, $canvasStrings->{PAINT});
}


sub setLayerWidth {
    my ($self, $width) = @_;
        if ($width < 0) {
            die ("IllegalArgumentException");
        }
        $self->{width} = $width;
}


sub setLayerHeight {
    my ($self, $height) = @_;
        if ($height < 0) {
            die ("IllegalArgumentException");
        }
        $self->{height} = $height;
}


sub toStringAppend {
    my ($self, $stringBuffer) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;

1;

