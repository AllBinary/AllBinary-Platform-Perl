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

package org::allbinary::input::automation::module::AbstractInputAutomationWorker;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::thread::RunnableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{index} = 0;
    $self->{running} = 0;
    $self->{inputAutomationActionInterface} = undef;
    $self->{captureWorkerInterface} = undef;
    $self->{imageComparisonWorker} = undef;
    $self->{motionRectanglesWorker} = undef;
    $self->{captureThread} = undef;
}


sub new {
    my ($class, $inputAutomationActionInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub setThread {
    my ($self, $thread) = @_;
}


sub isRunning {
    my ($self) = @_;
        return $self->{running};
}


sub setRunning {
    my ($self, $running) = @_;
        $self->{running} = $running;
}


sub isAnyDataWorkerRunning {
    my ($self) = @_;
        if (defined($self->{captureThread}) && ($self->{captureThread}->isAlive() || $self->getCaptureWorker()->isRunning() || $self->getMotionRectanglesWorker()->isRunning() || $self->getImageComparisonWorker()->isRunning())) {
            return 1;
        }
        return 0;
}


# throws Exception
sub startDataWorkers {
    my ($self) = @_;
        if (!$self->isAnyDataWorkerRunning()) {
            $self->{captureThread} = 'java::lang::Thread'->new($self->getCaptureWorker());
            $self->{logUtil}->putF("Starting CaptureWorkers - Need more images - Thread State: " . $self->{captureThread}->getState()->toString(), $self, "startCaptureWorkers");
            $self->{captureThread}->start();
        }
}


# throws Exception
sub waitForDataWorkers {
    my ($self) = @_;
        while ($self->isAnyDataWorkerRunning()) {
            $self->{logUtil}->putF("Waiting", $self, $self->{commonStrings}->{RUN});
            Time::HiRes::sleep((250) / 1000);
        }
}


# throws Exception
sub stopDataWorkers {
    my ($self) = @_;
        $self->getCaptureWorker()->setRunning(0);
}


# throws Exception
sub process {
    my ($self) = @_;
        die ("RuntimeException");
}


sub run {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{RUN});
            $self->setRunning(1);
            my $timeHelper = 'org::allbinary::time::TimeDelayHelper'->new(1000);
            while ($self->isRunning()) {
                $timeHelper->setStartTimeTNT();
                $self->process();
                $self->{index}++;
                $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{ELAPSED} + $timeHelper->getElapsedTNT() . " Index: " . $self->{index}, $self, $self->{commonStrings}->{RUN});
            }
            $self->stopDataWorkers();
            $self->waitForDataWorkers();
            $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, $self->{commonStrings}->{RUN});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
        }
}


sub getInputAutomationActionInterface {
    my ($self) = @_;
        return $self->{inputAutomationActionInterface};
}


sub setInputAutomationActionInterface {
    my ($self, $inputAutomationActionInterface) = @_;
        $self->{inputAutomationActionInterface} = $inputAutomationActionInterface;
}


sub getCaptureWorker {
    my ($self) = @_;
        return $self->{captureWorkerInterface};
}


sub setCaptureWorker {
    my ($self, $captureWorkerInterface) = @_;
        $self->{captureWorkerInterface} = $captureWorkerInterface;
}


sub getImageComparisonWorker {
    my ($self) = @_;
        return $self->{imageComparisonWorker};
}


sub setImageComparisonWorker {
    my ($self, $imageComparisonWorker) = @_;
        $self->{imageComparisonWorker} = $imageComparisonWorker;
}


sub getMotionRectanglesWorker {
    my ($self) = @_;
        return $self->{motionRectanglesWorker};
}


sub setMotionRectanglesWorker {
    my ($self, $motionRectanglesWorker) = @_;
        $self->{motionRectanglesWorker} = $motionRectanglesWorker;
}

use org::allbinary::input::media::image::capture::CaptureWorkerInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::image::comparison::ImageComparisonWorker;
use org::allbinary::media::image::comparison::motion::MotionRectanglesWorker;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::RunnableInterface;
use org::allbinary::time::TimeDelayHelper;
use java::lang::Thread;

1;

