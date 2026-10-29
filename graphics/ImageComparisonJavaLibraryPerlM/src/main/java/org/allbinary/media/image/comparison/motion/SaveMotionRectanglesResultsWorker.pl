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

package org::allbinary::media::image::comparison::motion::SaveMotionRectanglesResultsWorker;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::image::comparison::motion::MotionRectanglesResultsListener';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{running} = 0;
    $self->{motionRectanglesVector} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{motionRectanglesVector} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub getMotionRectanglesVector {
    my ($self) = @_;
        return $self->{motionRectanglesVector};
}


sub onMotionRectanglesImageComparisonResultsEvent {
    my ($self, $motionRectanglesResultsEvent) = @_;
        $self->getMotionRectanglesVector()->add($motionRectanglesResultsEvent);
        $self->run();
}


sub onEvent {
    my ($self, $allBinaryEventObject) = @_;
        $self->onMotionRectanglesImageComparisonResultsEvent($allBinaryEventObject);
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
            my $motionRectanglesResultsEvent = $self->getMotionRectanglesVector()->get(0);
            my $motionRectangles = $motionRectanglesResultsEvent->getMotionRectangles();
            'org::allbinary::media::image::comparison::motion::MotionRectanglesImageInputOutput'->new()->save($motionRectangles, $motionRectanglesResultsEvent->getFrame());
            $self->getMotionRectanglesVector()->remove($motionRectangles);
            $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{ELAPSED} + $timeHelper->getElapsedTNT(), $self, $self->{commonStrings}->{RUN});
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
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::media::image::comparison::motion::MotionRectanglesResultsListener;
use org::allbinary::media::image::comparison::motion::MotionRectanglesImageInputOutput;

1;

