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

package org::allbinary::media::image::comparison::motion::MotionRectanglesWorker;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler','org::allbinary::media::image::comparison::ImageComparisonResultsListener';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{imageComparisonInfoVector} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{motionRectangleConstraintsInterface} = undef;
    $self->{index} = 0;
    $self->{running} = 0;
}


sub new {
    my ($class, $motionRectangleConstraintsInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{motionRectangleConstraintsInterface} = $motionRectangleConstraintsInterface;
    return $self;
}


sub onImageComparisonResultsEvent {
    my ($self, $imageComparisonResultsEvent) = @_;
        $self->{imageComparisonInfoVector}->add($imageComparisonResultsEvent);
        $self->run();
}


sub onEvent {
    my ($self, $allBinaryEventObject) = @_;
        $self->onImageComparisonResultsEvent($allBinaryEventObject);
}


sub isRunning {
    my ($self) = @_;
        return $self->{running};
}


sub setRunning {
    my ($self, $running) = @_;
        $self->{running} = $running;
}


sub run {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{RUN});
            $self->setRunning(1);
            my $timeHelper = 'org::allbinary::time::TimeDelayHelper'->new(1000);
            $timeHelper->setStartTimeTNT();
            my $imageComparisonResultsEvent = $self->{imageComparisonInfoVector}->get(0);
            my $imageComparisonInfo = $imageComparisonResultsEvent->getImageComparisonResult();
            $self->{logUtil}->putF($imageComparisonInfo->toString(), $self, $self->{commonStrings}->{RUN});
            my $allMotionRectangles = 'org::allbinary::media::image::comparison::motion::AllMotionRectangles'->new($imageComparisonInfo);
            'org::allbinary::media::image::comparison::motion::AllMotionRectanglesResultsCacheSingleton'->getInstance()->add('org::allbinary::media::image::comparison::motion::MotionRectanglesResultsFrameCacheable'->new($allMotionRectangles, $imageComparisonInfo->getFrameTwo()));
            my $consolidatedMotionRectangles = 'org::allbinary::media::image::comparison::motion::ConsolidateMotionRectangles'->new($allMotionRectangles);
            'org::allbinary::media::image::comparison::motion::ConsolidatedMotionRectanglesResultsCacheSingleton'->getInstance()->add('org::allbinary::media::image::comparison::motion::MotionRectanglesResultsFrameCacheable'->new($consolidatedMotionRectangles, $imageComparisonInfo->getFrameTwo()));
            my $constrainedMotionRectangles = 'org::allbinary::media::image::comparison::motion::ConstrainedMotionRectangles'->new($self->{motionRectangleConstraintsInterface}, $consolidatedMotionRectangles);
            $constrainedMotionRectangles->applyMotionRectangleConstraints($consolidatedMotionRectangles);
            'org::allbinary::media::image::comparison::motion::ConstrainedMotionRectanglesResultsCacheSingleton'->getInstance()->add('org::allbinary::media::image::comparison::motion::MotionRectanglesResultsFrameCacheable'->new($constrainedMotionRectangles, $imageComparisonInfo->getFrameTwo()));
            $self->fireEvent('org::allbinary::media::image::comparison::motion::MotionRectanglesResultsEvent'->new($self, $imageComparisonInfo->getFrameTwo(), $constrainedMotionRectangles));
            $self->{imageComparisonInfoVector}->remove($imageComparisonResultsEvent);
            $self->{index}++;
            $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{ELAPSED} + $timeHelper->getElapsedTNT(), $self, $self->{commonStrings}->{RUN});
            $self->setRunning(0);
            $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, $self->{commonStrings}->{RUN});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::handler::BasicEventHandler;
use org::allbinary::media::image::comparison::ImageComparisonResult;
use org::allbinary::media::image::comparison::ImageComparisonResultsEvent;
use org::allbinary::media::image::comparison::ImageComparisonResultsListener;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::media::image::comparison::motion::AllMotionRectangles;
use org::allbinary::media::image::comparison::motion::AllMotionRectanglesResultsCacheSingleton;
use org::allbinary::media::image::comparison::motion::MotionRectanglesResultsFrameCacheable;
use org::allbinary::media::image::comparison::motion::ConsolidateMotionRectangles;
use org::allbinary::media::image::comparison::motion::ConsolidatedMotionRectanglesResultsCacheSingleton;
use org::allbinary::media::image::comparison::motion::ConstrainedMotionRectangles;
use org::allbinary::media::image::comparison::motion::ConstrainedMotionRectanglesResultsCacheSingleton;
use org::allbinary::media::image::comparison::motion::MotionRectanglesResultsEvent;

1;

