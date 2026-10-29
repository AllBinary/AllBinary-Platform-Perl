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

package org::allbinary::input::media::image::capture::ScreenCaptureImagesWorker;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler','org::allbinary::input::media::image::capture::CaptureWorkerInterface';

our $index;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{running} = 0;
    $self->{screenScavangerRobot} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{screenScavangerRobot} = 'org::allbinary::input::media::image::capture::ScreenScavangerRobot'->new();
        $org::allbinary::input::media::image::capture::ScreenCaptureImagesWorker::index = 'org::allbinary::input::media::image::capture::ProcessingFrameIndexFactory'->next();
    return $self;
}


sub isRunning {
    my ($self) = @_;
        return $self->{running};
}


sub setRunning {
    my ($self, $running) = @_;
        $self->{running} = $running;
}


# throws Exception
sub setThread {
    my ($self, $thread) = @_;
}


sub run {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{RUN});
            $self->setRunning(1);
            my $timeHelper = 'org::allbinary::time::TimeDelayHelper'->new(1000);
            while ($self->isRunning()) {
                $timeHelper->setStartTimeTNT();
                my $bufferedImage = $self->{screenScavangerRobot}->getScreenAsBufferedImages()->[0];
                my $frame = $index;
                $org::allbinary::input::media::image::capture::ScreenCaptureImagesWorker::index++;
                'org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton'->getInstance()->add('org::allbinary::media::image::cache::BufferedImageFrameCacheable'->new($bufferedImage, $frame));
                my $capturedImageEvent = 'org::allbinary::input::media::image::capture::CapturedImageWorkerResultsEvent'->new($self, $frame, $bufferedImage);
                $self->fireEvent($capturedImageEvent);
                $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{ELAPSED} + $timeHelper->getElapsedTNT(), $self, $self->{commonStrings}->{RUN});
                $self->setRunning(0);
            }
            $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, $self->{commonStrings}->{RUN});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
        }
}

# use java::awt::image::BufferedImage;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::util::event::handler::BasicEventHandler;
use org::allbinary::media::image::cache::BufferedImageFrameCacheable;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::input::media::image::capture::CaptureWorkerInterface;
use org::allbinary::input::media::image::capture::ScreenScavangerRobot;
use org::allbinary::input::media::image::capture::ProcessingFrameIndexFactory;
use org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton;
use org::allbinary::input::media::image::capture::CapturedImageWorkerResultsEvent;

1;

