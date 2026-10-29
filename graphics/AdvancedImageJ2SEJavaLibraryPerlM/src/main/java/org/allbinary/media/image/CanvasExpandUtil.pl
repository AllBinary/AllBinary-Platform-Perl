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

package org::allbinary::media::image::CanvasExpandUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::CanvasExpandUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::CanvasExpandUtil::instance;
}


# throws Exception
sub process {
    my ($self, $imageProcessorInput, $increaseX, $increaseY, $visitor) = @_;
        my $imageUtil = 'org::allbinary::media::image::ImageUtil'->getInstance();
        my $bufferedImageArray = $imageProcessorInput->getBufferedImageArray();
        my $subBufferedImageArray = [(undef) x (scalar(@{$bufferedImageArray}))];
        my $size = scalar(@{$bufferedImageArray});
        my $bufferedImage = undef;
        for (my $index = 0; $index < $size; $index++) {
            $bufferedImage = $bufferedImageArray->[$index];
            $subBufferedImageArray->[$index] = $imageUtil->createBufferedImage($bufferedImage, $bufferedImage->getWidth() + $increaseX, $bufferedImage->getHeight() + $increaseY, 0);
            $visitor->visit($subBufferedImageArray->[$index], $self->{stringUtil}->{EMPTY_STRING}, $index);
        }
}

# use java::awt::image::BufferedImage;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::image::ImageUtil;

1;

