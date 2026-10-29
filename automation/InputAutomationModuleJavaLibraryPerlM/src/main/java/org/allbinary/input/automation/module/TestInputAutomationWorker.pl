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

package org::allbinary::input::automation::module::TestInputAutomationWorker;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{captureWorker} = undef;
    $self->{imageComparisonWorker} = undef;
    $self->{motionRectanglesWorker} = undef;
    $self->{changedPixelsImageComparisonResultsWorker} = undef;
    $self->{saveMotionRectanglesAsImagesWorker} = undef;
    $self->{moveMouseToFirstMotionRectanglesResultsWorker} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{captureWorker} = 'org::allbinary::input::media::image::capture::ScreenCaptureImagesWorker'->new();
        $self->{changedPixelsImageComparisonResultsWorker} = 'org::allbinary::media::image::comparison::SaveImageComparisonWorker'->new();
        $self->{saveMotionRectanglesAsImagesWorker} = 'org::allbinary::media::image::comparison::motion::SaveMotionRectanglesResultsWorker'->new();
        $self->{moveMouseToFirstMotionRectanglesResultsWorker} = 'org::allbinary::media::image::comparison::motion::TestInputForMotionRectanglesResultsWorker'->new();
        $self->{motionRectanglesWorker}->addListenerInterface($self->{saveMotionRectanglesAsImagesWorker});
        $self->{motionRectanglesWorker}->addListenerInterface($self->{moveMouseToFirstMotionRectanglesResultsWorker});
        $self->{imageComparisonWorker}->addListenerInterface($self->{changedPixelsImageComparisonResultsWorker});
        $self->{imageComparisonWorker}->addListenerInterface($self->{motionRectanglesWorker});
        $self->{captureWorker}->addListenerInterface($self->{imageComparisonWorker});
    return $self;
}

use org::allbinary::input::media::image::capture::ScreenCaptureImagesWorker;
use org::allbinary::media::image::comparison::ImageComparisonWorker;
use org::allbinary::media::image::comparison::SaveImageComparisonWorker;
use org::allbinary::media::image::comparison::motion::MotionRectanglesWorker;
use org::allbinary::media::image::comparison::motion::SaveMotionRectanglesResultsWorker;
use org::allbinary::media::image::comparison::motion::TestInputForMotionRectanglesResultsWorker;

1;

