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

package org::allbinary::media::image::comparison::ImageComparisonWorker;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler','org::allbinary::input::media::image::capture::CapturedImageWorkerResultsListener';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{bufferedImageVector} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{imageComparatorConstraintsInterface} = undef;
    $self->{imageComparator} = undef;
    $self->{running} = 0;
    $self->{index2} = 0;
}


sub new {
    my ($class, $imageComparatorConstraintsInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{imageComparatorConstraintsInterface} = $imageComparatorConstraintsInterface;
        $self->{imageComparator} = 'org::allbinary::media::image::comparison::ImageComparator'->new($imageComparatorConstraintsInterface);
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


sub onCaptureEvent {
    my ($self, $capturedImageWorkerResultsEvent) = @_;
        $self->{bufferedImageVector}->add($capturedImageWorkerResultsEvent);
        if ($self->{bufferedImageVector}->size() > 1) {
            $self->run();
        }
}


sub onEvent {
    my ($self, $allBinaryEventObject) = @_;
        $self->onCaptureEvent($allBinaryEventObject);
}


sub run {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{RUN});
            $self->setRunning(1);
            my $timeHelper = 'org::allbinary::time::TimeDelayHelper'->new(1000);
            $timeHelper->setStartTimeTNT();
            if ($self->{imageComparatorConstraintsInterface}->isFrameAllowed($self->{index2})) {
                my $capturedImageWorkerResultsEvent = [(undef) x (2)];
                $capturedImageWorkerResultsEvent->[0] = $self->{bufferedImageVector}->get(0);
                $capturedImageWorkerResultsEvent->[1] = $self->{bufferedImageVector}->get(1);
                if ($self->{imageComparatorConstraintsInterface}->isImageValid($capturedImageWorkerResultsEvent->[0]->getBufferedImage()) && $self->{imageComparatorConstraintsInterface}->isImageValid($capturedImageWorkerResultsEvent->[1]->getBufferedImage())) {
                    my $imageComparisonResult = $self->{imageComparator}->compare($capturedImageWorkerResultsEvent->[0]->getBufferedImage(), $capturedImageWorkerResultsEvent->[1]->getBufferedImage(), $capturedImageWorkerResultsEvent->[0]->getFrame(), $capturedImageWorkerResultsEvent->[1]->getFrame(), 0);
                    my $frame = $capturedImageWorkerResultsEvent->[1]->getFrame();
                    my $imageComparisonResultFrameCacheable = 'org::allbinary::media::image::comparison::ImageComparisonResultFrameCacheable'->new($imageComparisonResult, $frame);
                    'org::allbinary::media::image::comparison::ImageComparisonResultCacheSingleton'->getInstance()->add($imageComparisonResultFrameCacheable);
                    $self->fireEvent('org::allbinary::media::image::comparison::ImageComparisonResultsEvent'->new($self, $imageComparisonResult));
                    $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Image Comparison Result: ")->append($imageComparisonResult->toString())->append(" for frame: ")->appendlong($frame)->toString(), $self, $self->{commonStrings}->{RUN});
                } else {
                    $self->{logUtil}->putF("An Image Was Not Valid: Image Worker Event Processing terminated", $self, $self->{commonStrings}->{RUN});
                }
            }
            $self->{bufferedImageVector}->remove(0);
            $self->{index2}++;
            my $message = 'org::allbinary::logic::string::StringMaker'->new()->append("Frame: ")->appendint($self->{index2})->append('org::allbinary::string::CommonLabels'->getInstance()->{ELAPSED})->appendlong(int($timeHelper->getElapsedTNT()))->toString();
            $self->{logUtil}->putF($message, $self, $self->{commonStrings}->{RUN});
            $self->setRunning(0);
            $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, $self->{commonStrings}->{RUN});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::input::media::image::capture::CapturedImageWorkerResultsEvent;
use org::allbinary::input::media::image::capture::CapturedImageWorkerResultsListener;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::handler::BasicEventHandler;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::media::image::comparison::ImageComparator;
use org::allbinary::media::image::comparison::ImageComparisonResultFrameCacheable;
use org::allbinary::media::image::comparison::ImageComparisonResultCacheSingleton;
use org::allbinary::media::image::comparison::ImageComparisonResultsEvent;

1;

