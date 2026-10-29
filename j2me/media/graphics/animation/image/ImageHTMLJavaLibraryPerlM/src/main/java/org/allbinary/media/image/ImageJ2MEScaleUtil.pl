#
# AllBinary Open License Version 1
# Copyright (c) 2023 AllBinary
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

package org::allbinary::media::image::ImageJ2MEScaleUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageJ2MEScaleUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageJ2MEScaleUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub scaleArray {
    my ($self, $images, $width, $height) = @_;
        my $scaledImages = [(undef) x (scalar(@{$images}))];
        for (my $index = scalar(@{$images}); --$index >= 0; ) {
            $scaledImages->[$index] = $self->scale($images->[$index], $width, $height);
        }
        return $scaledImages;
}


# throws Exception
sub scale {
    my ($self, $image, $width, $height) = @_;
        return $image;
}

# use javax::microedition::lcdui::Image;

1;

