# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::TiledLayerUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::TiledLayerUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::TiledLayerUtil::instance;
}


sub keepOnBorderdMapX {
    my ($self, $terrainTiledLayer, $x, $width, $mapBorderBufferWidth) = @_;
        my $newX = $x;
        my $maxRight = $terrainTiledLayer->getWidth() - $width - $mapBorderBufferWidth;
        if ($x + $width > $maxRight) {
            $newX = $maxRight;
        }
        if ($x < $mapBorderBufferWidth) {
            $newX = $mapBorderBufferWidth;
        }
        return $newX;
}


sub keepOnBorderdMapY {
    my ($self, $terrainTiledLayer, $y, $height, $mapBorderBufferHeight) = @_;
        my $newY = $y;
        my $maxBottom = $terrainTiledLayer->getHeight() - $height - $mapBorderBufferHeight;
        if ($y + $height > $maxBottom) {
            $newY = $maxBottom;
        }
        if ($y < $mapBorderBufferHeight) {
            $newY = $mapBorderBufferHeight;
        }
        return $newY;
}


sub keepOnMapX {
    my ($self, $terrainTiledLayer, $x, $width) = @_;
        my $newX = $x;
        my $maxRight = $terrainTiledLayer->getWidth() - $width;
        if ($x >= $maxRight) {
            $newX = $maxRight;
        }
        if ($x < 0) {
            $newX = 0;
        }
        return $newX;
}


sub keepOnMapY {
    my ($self, $terrainTiledLayer, $y, $height) = @_;
        my $newY = $y;
        my $maxBottom = $terrainTiledLayer->getHeight() - $height;
        if ($y >= $maxBottom) {
            $newY = $maxBottom;
        }
        if ($y < 0) {
            $newY = 0;
        }
        return $newY;
}


1;

