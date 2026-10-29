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

package org::allbinary::media::DisplaysUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::DisplaysUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::DisplaysUtil::instance;
}


sub getPrimaryScreenSize {
    my ($self) = @_;
        my $dimension = 'java::awt::Toolkit'->getDefaultToolkit()->getScreenSize();
        return 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}, $dimension->{width}, $dimension->{height});
}


sub getScreenSizesAsRectangleArray {
    my ($self) = @_;
        my $graphicsEnvironment = 'java::awt::GraphicsEnvironment'->getLocalGraphicsEnvironment();
        my $graphicsDeviceArray = $graphicsEnvironment->getScreenDevices();
        my $graphicsDevice = undef;
        my $displayMode = undef;
        my $rectangle = undef;
        my $size = scalar(@{$graphicsDeviceArray});
        my $rectangleArray = [(undef) x ($size)];
        for (my $index = 0; $index < $size; $index++) {
            $graphicsDevice = $graphicsDeviceArray->[$index];
            $displayMode = $graphicsDevice->getDisplayMode();
            $rectangle = 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}, $displayMode->getWidth(), $displayMode->getHeight());
            $rectangleArray->[$index] = $rectangle;
        }
        return $rectangleArray;
}

# use java::awt::Dimension;
# use java::awt::DisplayMode;
# use java::awt::GraphicsDevice;
# use java::awt::GraphicsEnvironment;
# use java::awt::Toolkit;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;

1;

