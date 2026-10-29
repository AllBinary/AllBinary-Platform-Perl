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

package org::allbinary::media::image::comparison::motion::TestInputForMotionRectanglesResultsWorker;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::media::image::comparison::motion::MotionRectanglesResultsListener';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{index} = 0;
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
    my ($self, $motionRectanglesImageComparisonResultsEvent) = @_;
        $self->getMotionRectanglesVector()->add($motionRectanglesImageComparisonResultsEvent->getMotionRectangles());
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
            my $motionRectangles = $self->getMotionRectanglesVector()->get(0);
            my $motionRectangleVector = $motionRectangles->getVector();
            if ($motionRectangleVector->size() > 0) {
                my $rectangle = $motionRectangleVector->get(0);
                my $robotHashtable = 'org::allbinary::input::automation::robot::InputRobotFactory'->getInstance()->get();
                my $inputTypeNameArray = $robotHashtable->keySet()->toArray();
                my $size = scalar(@{$inputTypeNameArray});
                for (my $index = 0; $index < $size; $index++) {
                    my $inputTypeNameString = $inputTypeNameArray->[$index];
                    my $inputRobotInterface = $robotHashtable->get($inputTypeNameString);
                    $inputRobotInterface->mouseMoveToTarget($rectangle);
                    if ($inputRobotInterface->getName()->compareTo($org::allbinary::input::automation::robot::TempInputRobotNames::DX_NAME) == 0) {
                        $inputRobotInterface->mousePress($java::awt::event::InputEvent::BUTTON1_MASK);
                        Time::HiRes::sleep((300) / 1000);
                        $inputRobotInterface->mouseRelease($java::awt::event::InputEvent::BUTTON1_MASK);
                        $inputRobotInterface->mousePress($java::awt::event::InputEvent::BUTTON2_MASK);
                        Time::HiRes::sleep((300) / 1000);
                        $inputRobotInterface->mouseRelease($java::awt::event::InputEvent::BUTTON2_MASK);
                        $inputRobotInterface->mousePress($java::awt::event::InputEvent::BUTTON3_MASK);
                        Time::HiRes::sleep((300) / 1000);
                        $inputRobotInterface->mouseRelease($java::awt::event::InputEvent::BUTTON3_MASK);
                        $inputRobotInterface->keyPress($java::awt::event::KeyEvent::VK_1);
                        Time::HiRes::sleep((300) / 1000);
                        $inputRobotInterface->keyRelease($java::awt::event::KeyEvent::VK_1);
                        $inputRobotInterface->keyPress($java::awt::event::KeyEvent::VK_2);
                        Time::HiRes::sleep((300) / 1000);
                        $inputRobotInterface->keyRelease($java::awt::event::KeyEvent::VK_2);
                        $inputRobotInterface->keyPress($java::awt::event::KeyEvent::VK_3);
                        Time::HiRes::sleep((300) / 1000);
                        $inputRobotInterface->keyRelease($java::awt::event::KeyEvent::VK_3);
                        $inputRobotInterface->keyPress($java::awt::event::KeyEvent::VK_4);
                        Time::HiRes::sleep((300) / 1000);
                        $inputRobotInterface->keyRelease($java::awt::event::KeyEvent::VK_4);
                        $inputRobotInterface->keyPress($java::awt::event::KeyEvent::VK_F1);
                        Time::HiRes::sleep((300) / 1000);
                        $inputRobotInterface->keyRelease($java::awt::event::KeyEvent::VK_F1);
                    }
                }
            }
            $self->{index}++;
            $self->getMotionRectanglesVector()->remove($motionRectangles);
            $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{ELAPSED} + $timeHelper->getElapsedTNT(), $self, $self->{commonStrings}->{RUN});
            $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, $self->{commonStrings}->{RUN});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
        }
}

# use java::awt::Rectangle;
# use java::awt::event::InputEvent;
# use java::awt::event::KeyEvent;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::input::automation::robot::InputRobotFactory;
use org::allbinary::input::automation::robot::InputRobotInterface;
use org::allbinary::input::automation::robot::TempInputRobotNames;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::ABHashtable;
use org::allbinary::media::image::comparison::motion::MotionRectanglesResultsListener;
use java::lang::Thread;

1;

