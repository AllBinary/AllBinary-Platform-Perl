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

package org::allbinary::game::health::HealthBarThreedAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::health::HealthBarAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{rectangle} = undef;
    $self->{basicColorFactory} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
    $self->{object3dProcessor} = 'org::allbinary::graphics::threed::min3d::renderer::Object3dProcessorUtil'->getInstance()->getInstanceObject3dProcessor();
}


sub new {
    my ($class, $layerInterface, $location) = @_;
    my $self = $class->SUPER::new($layerInterface, $location);
    $self->_init_fields();
        # super(...) made $self above
        $self->{basicColor} = $self->{basicColorFactory}->{GREEN};
        $self->{colorP} = int($self->{basicColor});
        $self->{rectangle} = 'min3d::objectPrimitives::Rectangle'->new(0, 0, 1, 1, $self->{basicColor});
        $self->{rectangle}->setDoubleSidedEnabled(1);
        $self->{rectangle}->setNormalsEnabled(0);
        $self->{rectangle}->setTexturesEnabled(0);
    return $self;
}


sub updateColor {
    my ($self) = @_;
        my $colorBufferList = $self->{rectangle}->getVertices()->getColor4BufferList();
        my $size = $colorBufferList->size();
        for (my $index = $size; --$index >= 0; ) {
            $colorBufferList->set($index, $self->{basicColor});
        }
}


sub updateSize {
    my ($self) = @_;
        my $number3dBufferList = $self->{rectangle}->getVertices()->getPointsOnFacesNumber3dBufferList();
        my $width = $self->{x2};
        my $height = $self->{thickness} * 2;
        my $segsH = 1;
        my $segsW = 1;
        my $row = 0;
        my $col = 0;
        my $w = int($width / $segsW);
        my $h = int($height / $segsH);
        my $width5 = $width / 2;
        my $height5 = $height / 2;
        my $index = 0;
        for ($row = 0; $row <= $segsH; $row++) {
            for ($col = 0; $col <= $segsW; $col++) {
                $number3dBufferList->set($index++, $col * $w - $width5, $row * $h - $height5, 0);
            }
        }
}


sub onHealthChange {
    my ($self, $newX2) = @_;
        $self->SUPER::onHealthChange($newX2);
        $self->updateColor();
        $self->updateSize();
}


sub paintThreedXYZ {
    my ($self, $graphics, $x, $y, $z) = @_;
        my $openGLESGraphics = $graphics;
        my $gl = $openGLESGraphics->getGl10();
        my $viewPosition = $self->{allbinaryLayer}->getViewPosition();
        my $positionNumber3d = $self->{rectangle}->getPosition();
        $positionNumber3d->{x} = -($viewPosition->getX());
        $positionNumber3d->{z} = -($viewPosition->getY());
        $positionNumber3d->{y} = $viewPosition->getZ() + $self->{allbinaryLayer}->getHeight();
        $self->{object3dProcessor}->drawObject($gl, $self->{rectangle});
}

# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Graphics;
use min3d::core::ColorBufferList;
use min3d::core::Number3dBufferList;
use min3d::objectPrimitives::Rectangle;
use min3d::vos::Number3d;
use org::allbinary::device::OpenGLESGraphics;
use org::allbinary::graphics::threed::min3d::renderer::Object3dProcessor;
use org::allbinary::graphics::threed::min3d::renderer::Object3dProcessorUtil;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::health::HealthBarAnimation;

1;

