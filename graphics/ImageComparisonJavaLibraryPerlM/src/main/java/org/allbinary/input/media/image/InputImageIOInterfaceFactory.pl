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

package org::allbinary::input::media::image::InputImageIOInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($class, $imageType) = @_;
        if ($imageType == $org::allbinary::input::media::image::InputImageType::CAPTURE) {
            return 'org::allbinary::input::media::image::capture::CapturedImageInputOutput'->new();
        } elsif ($imageType == $org::allbinary::input::media::image::InputImageType::COMPARISON) {
            return 'org::allbinary::media::image::comparison::ComparisonImageInputOutput'->new();
        } elsif ($imageType == $org::allbinary::input::media::image::InputImageType::MOTION) {
            return 'org::allbinary::media::image::comparison::motion::MotionRectanglesImageInputOutput'->new();
        } else {
            die ("No ImageIOInterface for: " . $imageType->toString());
        }
}

use org::allbinary::input::media::image::capture::CapturedImageInputOutput;
use org::allbinary::media::image::comparison::ComparisonImageInputOutput;
use org::allbinary::media::image::comparison::motion::MotionRectanglesImageInputOutput;
use org::allbinary::media::image::io::ImageIOInterface;
use org::allbinary::input::media::image::InputImageType;

1;

