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

#In general allow scrolling of the menu and selection the center item
package org::allbinary::game::displayable::canvas::CommandFormInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::BasicMenuInputProcessor';


sub _init_fields {
    my ($self) = @_;
    $self->{MOTION_GESTURE_SOURCE_ID} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance()->{MOTION_GESTURE_SOURCE_ID};
    $self->{CLICK_DELAY} = 150;
    $self->{clickTimeHelper} = 'org::allbinary::time::TimeDelayHelper'->new($self->{CLICK_DELAY});
    $self->{DOUBLE_CLICK_DELAY} = 1200;
    $self->{doubleClickTimeHelper} = 'org::allbinary::time::TimeDelayHelper'->new($self->{DOUBLE_CLICK_DELAY});
    $self->{isSingleKeyProcessing} = 'org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->isSingleKeyProcessing();
    $self->{form} = undef;
    $self->{hasPressed} = 0;
    $self->{PROCESS_COMMAND} = "processCommand";
    $self->{NAME_LABEL} = " ScrollSelectionForm: ";
}


sub new {
    my ($class, $gameKeyEventList, $playerInputId, $gameCanvas, $form) = @_;
    my $self = $class->SUPER::new($gameKeyEventList, $playerInputId, $gameCanvas);
    $self->_init_fields();
        # super(...) made $self above
        $self->{form} = $form;
    return $self;
}


# throws Exception
sub processInput {
    my ($self, $key) = @_;
        if ($key == $javax::microedition::lcdui::Canvas::LEFT || $key == $javax::microedition::lcdui::Canvas::RIGHT || $key == $javax::microedition::lcdui::Canvas::UP || $key == $javax::microedition::lcdui::Canvas::DOWN) {
            'org::allbinary::media::audio::PrimaryPlayerQueueFactory'->getInstance()->add('org::allbinary::media::audio::SelectSound'->getInstance());
            $self->{form}->processInputKey($key);
            return 1;
        } elsif ($key == $javax::microedition::lcdui::Canvas::FIRE) {
            'org::allbinary::media::audio::PrimaryPlayerQueueFactory'->getInstance()->add('org::allbinary::media::audio::SelectSound'->getInstance());
            return $self->processCommand();
        }
        return 0;
}


sub processCommand {
    my ($self) = @_;
        my $commandCurrentSelectionForm = $self->{form};
        my $command = $commandCurrentSelectionForm->getSelectedCommand();
        $self->{logUtil}->putF($command->toString(), $self, $self->{PROCESS_COMMAND});
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $openGLFeatureFactory = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
        if ($org::allbinary::game::layer::SWTUtil::isSWT && $features->isFeature($openGLFeatureFactory->{OPENGL}) && $command != 'org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{EXIT_COMMAND}) {
            'org::allbinary::game::displayable::canvas::CommandRunnable'->new($self, $command)->run();
        } else {
            'org::allbinary::thread::PrimaryThreadPool'->getInstance()->runTask('org::allbinary::game::displayable::canvas::CommandRunnable'->new($self, $command));
        }
        if ($command == 'org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{QUIT_COMMAND}) {
            return -1;
        } else {
            return 1;
        }
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
                $key = $gameKeyEvent->getKey();
                if ($gameKeyEvent->getSourceId() != $self->{MOTION_GESTURE_SOURCE_ID}) {
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
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{gameInputStrings}->{PROCESS_INPUT}, $e);
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
        my $touchMotionGestureFactory = 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance();
        my $motionGestureInput = $motionGestureEvent->getMotionGesture();
        if ($motionGestureInput == $touchMotionGestureFactory->{RELEASED}) {
            my $point = $motionGestureEvent->getCurrentPoint();
            if ($self->{form}->isInForm($point)) {
                my $index = $self->{form}->getSelectedIndexForPoint($point);
                if ($index != -1) {
                    'org::allbinary::media::audio::PrimaryPlayerQueueFactory'->getInstance()->add('org::allbinary::media::audio::SelectSound'->getInstance());
                    if ($index == $self->{form}->getSelectedIndex()) {
                        if ($self->{clickTimeHelper}->isTimeTNT()) {
                            $self->processCommand();
                        }
                    } else {
                        $self->{form}->setSelectedIndex($index);
                    }
                } else {
                }
            }
            if ($self->{hasPressed}) {
                if (!$self->{doubleClickTimeHelper}->isTimeTNT()) {
                    $self->{logUtil}->putF("Double Press", $self, $self->{gameInputStrings}->{PROCESS_MOTION_INPUT});
                    $self->processCommand();
                }
                $self->{doubleClickTimeHelper}->{delay} = $self->{DOUBLE_CLICK_DELAY};
                $self->{doubleClickTimeHelper}->setStartTimeTNT();
            }
            $self->{hasPressed} = 0;
        } elsif ($motionGestureInput == $touchMotionGestureFactory->{PRESSED}) {
            $self->{doubleClickTimeHelper}->{delay} = 0;
            $self->{hasPressed} = 1;
        }
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append($self->SUPER::toString())->append($self->{NAME_LABEL})->append($self->{form}->toString())->toString();
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Command;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::InputFeatureFactory;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::game::layer::SWTUtil;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::graphics::form::CommandCurrentSelectionForm;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::input::motion::gesture::MotionGestureInput;
use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
use org::allbinary::input::motion::gesture::observer::MotionGestureEvent;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::audio::PrimaryPlayerQueueFactory;
use org::allbinary::media::audio::SelectSound;
use org::allbinary::thread::PrimaryThreadPool;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::displayable::canvas::BasicMenuInputProcessor;
use org::allbinary::game::displayable::canvas::CommandRunnable;

1;

