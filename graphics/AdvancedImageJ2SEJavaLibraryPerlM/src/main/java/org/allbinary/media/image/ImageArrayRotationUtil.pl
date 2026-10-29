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

package org::allbinary::media::image::ImageArrayRotationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageArrayRotationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{TOTAL_ANGLE} = "totalAngle: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageArrayRotationUtil::instance;
}


# throws IOException
sub process {
    my ($self, $imageProcessorInput, $input, $visitor) = @_;
        my $totalAngle = undef;
        if ($input eq $self->{commonStrings}->{UP}) {
            $totalAngle = ("" . (-90));
        } elsif ($input eq $self->{commonStrings}->{DOWN}) {
            $totalAngle = ("" . (90));
        } else {
            $totalAngle = ("" . ($input));
        }
        my $generatedBufferedImage = undef;
        my $bufferedImageArray = $imageProcessorInput->getBufferedImageArray();
        for (my $index = 0; $index < scalar(@{$bufferedImageArray}); $index++) {
            $self->{logUtil}->putF($self->{TOTAL_ANGLE} . $totalAngle, $self, $self->{commonStrings}->{RUN});
            $generatedBufferedImage = 'org::allbinary::media::image::ImageJ2SERotationUtil'->getInstance()->getRotatedImage($bufferedImageArray->[$index], int($totalAngle));
            $visitor->visit($generatedBufferedImage, $input, $index);
        }
}

# use java::awt::image::BufferedImage;
# use java::io::IOException;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::image::ImageJ2SERotationUtil;

1;

