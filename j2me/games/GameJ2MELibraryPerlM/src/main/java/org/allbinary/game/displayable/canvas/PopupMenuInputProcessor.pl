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

package org::allbinary::game::displayable::canvas::PopupMenuInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::BasicMenuInputProcessor';


sub _init_fields {
    my ($self) = @_;
    $self->{rectangleCollisionUtil} = 'org::allbinary::math::RectangleCollisionUtil'->getInstance();
    $self->{CLICK_DELAY} = 120;
    $self->{clickTimeHelper} = 'org::allbinary::time::TimeDelayHelper'->new($self->{CLICK_DELAY});
    $self->{rectangle} = undef;
}


sub new {
    my ($class, $gameKeyEventList, $playerInputId, $gameCanvas, $rectangle) = @_;
    my $self = $class->SUPER::new($gameKeyEventList, $playerInputId, $gameCanvas);
    $self->_init_fields();
        # super(...) made $self above
        $self->{rectangle} = $rectangle;
    return $self;
}


sub init {
    my ($self, $rectangle) = @_;
        $self->{rectangle} = $rectangle;
}


# throws Exception
sub processInput {
    my ($self, $key) = @_;
        if ($key == $javax::microedition::lcdui::Canvas::KEY_STAR) {
            my $gameCanvas = $self->getCanvas();
            $gameCanvas->toggleMenu();
            return 1;
        }
        return 0;
}


# throws Exception
sub processInputList {
    my ($self) = @_;
        try {
            my $motionInputsIndex = $self->processMotionInputs();
            my $list = $self->getGameKeyEventList();
            my $size = $list->size();
            my $key = 0;
            my $gameKeyEvent = undef;
            for (my $index = 0; $index < $size; $index++) {
                $gameKeyEvent = $list->{objectArray}->[$index];
                if (defined($gameKeyEvent)) {
                    $key = $gameKeyEvent->getKey();
                    if ($self->processInput($key) == 1) {
                        last;
                    }
                }
            }
            $self->clear();
            if ($size > 0 || $motionInputsIndex >= 0) {
                return 1;
            } else {
                return -1;
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, 'org::allbinary::game::input::GameInputStrings'->getInstance()->{PROCESS_INPUT}, $e);
            return -1;
        }
}


# throws Exception
sub processMotionInputs {
    my ($self) = @_;
        my $lastIndex = $self->{motionGestureEventList}->size() - 1;
        if ($lastIndex >= 0) {
            my $motionGestureEvent = $self->{motionGestureEventList}->{objectArray}->[$lastIndex];
            $self->processMotionInput($motionGestureEvent);
        }
        $self->{motionGestureEventList}->clear();
        return $lastIndex;
}


# throws Exception
sub processMotionInput {
    my ($self, $motionGestureEvent) = @_;
        if (!defined($motionGestureEvent)) {
            $self->{logUtil}->putF("Exception: Bug", $self, $self->{gameInputStrings}->{PROCESS_MOTION_INPUT});
            return;
        }
        my $touchMotionGestureFactory = 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance();
        my $motionGestureInput = $motionGestureEvent->getMotionGesture();
        if ($motionGestureInput == $touchMotionGestureFactory->{RELEASED}) {
            my $point = $motionGestureEvent->getCurrentPoint();
            my $rectPoint = $self->{rectangle}->getPoint();
            if ($self->{rectangleCollisionUtil}->isInside($rectPoint->getX(), $rectPoint->getY(), $self->{rectangle}->getMaxX() + 20, $self->{rectangle}->getMaxY(), $point->getX(), $point->getY())) {
                if ($self->{clickTimeHelper}->isTimeTNT()) {
                    my $gameCanvas = $self->getCanvas();
                    $gameCanvas->toggleMenu();
                }
            }
        }
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::input::GameInputStrings;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::input::motion::gesture::MotionGestureInput;
use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
use org::allbinary::input::motion::gesture::observer::MotionGestureEvent;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::math::RectangleCollisionUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::displayable::canvas::BasicMenuInputProcessor;

1;

