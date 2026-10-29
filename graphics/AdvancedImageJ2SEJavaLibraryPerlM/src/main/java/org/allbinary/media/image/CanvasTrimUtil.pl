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

package org::allbinary::media::image::CanvasTrimUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::CanvasTrimUtil'->new();

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
        return $org::allbinary::media::image::CanvasTrimUtil::instance;
}


# throws IOException
sub process {
    my ($self, $imageProcessorInput, $cutCanvasFromLeftReduction, $cutCanvasFromTopReduction, $cutCanvasFromRightReduction, $cutCanvasFromBottomReduction, $visitor) = @_;
        my $bufferedImageArray = $imageProcessorInput->getBufferedImageArray();
        my $subBufferedImageArray = [(undef) x (scalar(@{$bufferedImageArray}))];
        my $size = scalar(@{$bufferedImageArray});
        my $bufferedImage = undef;
        for (my $index = 0; $index < $size; $index++) {
            $bufferedImage = $bufferedImageArray->[$index];
            $subBufferedImageArray->[$index] = $bufferedImage->getSubimage($cutCanvasFromLeftReduction, $cutCanvasFromTopReduction, $bufferedImage->getWidth() - $cutCanvasFromLeftReduction - $cutCanvasFromRightReduction, $bufferedImage->getHeight() - $cutCanvasFromTopReduction - $cutCanvasFromBottomReduction);
            $visitor->visit($subBufferedImageArray->[$index], $self->{stringUtil}->{EMPTY_STRING}, $index);
        }
}

# use java::awt::image::BufferedImage;
# use java::io::IOException;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;

1;

