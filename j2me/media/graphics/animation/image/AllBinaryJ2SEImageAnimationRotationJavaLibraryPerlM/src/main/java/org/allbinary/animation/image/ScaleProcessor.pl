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

package org::allbinary::animation::image::ScaleProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::ScaleBaseProcessor';

our $instanceC = 'org::allbinary::animation::image::ScaleProcessor'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{imageScaleUtil} = 'org::allbinary::media::image::ImageScaleUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::image::ScaleProcessor::instanceC;
}


sub update {
    my ($self, $originalImage, $originalImageArray, $ximageToShowArray, $unused, $scaleX, $scaleY, $maxScaleX, $maxScaleY) = @_;
        try {
            $self->{imageScaleUtil}->scale2($originalImage, $originalImageArray, $ximageToShowArray, $unused, $scaleX, $scaleY, $maxScaleX, $maxScaleY);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{UPDATE}, $e);
        }
}

# use javax::microedition::lcdui::Image;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::image::ImageScaleUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::animation::image::ScaleBaseProcessor;

1;

