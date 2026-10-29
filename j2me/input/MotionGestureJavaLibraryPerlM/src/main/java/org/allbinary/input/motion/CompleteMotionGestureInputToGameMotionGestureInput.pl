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

package org::allbinary::input::motion::CompleteMotionGestureInputToGameMotionGestureInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::input::motion::CompleteMotionGestureInputToGameMotionGestureInput'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::CompleteMotionGestureInputToGameMotionGestureInput::instance;
}


sub init {
    my ($self) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        try {
            'org::allbinary::logic::communication::log::PreLogUtil'->put("Compound Motion Gestures", $self, $commonStrings->{INIT});
            my $motionGestureConfiguration = 'org::allbinary::input::motion::gesture::configuration::MotionGestureConfigurationFactory'->getInstance();
            my $touchMotionGestureFactory = 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance();
            my $list = 'org::allbinary::util::BasicArrayListD'->new();
            $list->add($touchMotionGestureFactory->{DIAGONAL_DOWN_LEFT});
            $motionGestureConfiguration->addMotionGestureAction($list, 'org::allbinary::input::motion::touch::action::DiagonalDownLeftTouchInputToGameKeyEventAction'->getInstance());
            $list = 'org::allbinary::util::BasicArrayListD'->new();
            $list->add($touchMotionGestureFactory->{DIAGONAL_DOWN_RIGHT});
            $motionGestureConfiguration->addMotionGestureAction($list, 'org::allbinary::input::motion::touch::action::DiagonalDownRightTouchInputToGameKeyEventAction'->getInstance());
            $list = 'org::allbinary::util::BasicArrayListD'->new();
            $list->add($touchMotionGestureFactory->{DIAGONAL_UP_LEFT});
            $motionGestureConfiguration->addMotionGestureAction($list, 'org::allbinary::input::motion::touch::action::DiagonalUpLeftTouchInputToGameKeyEventAction'->getInstance());
            $list = 'org::allbinary::util::BasicArrayListD'->new();
            $list->add($touchMotionGestureFactory->{DIAGONAL_UP_RIGHT});
            $motionGestureConfiguration->addMotionGestureAction($list, 'org::allbinary::input::motion::touch::action::DiagonalUpRightTouchInputToGameKeyEventAction'->getInstance());
            $list = 'org::allbinary::util::BasicArrayListD'->new();
            $list->add($touchMotionGestureFactory->{LEFT});
            $motionGestureConfiguration->addMotionGestureAction($list, 'org::allbinary::input::motion::touch::action::LeftTouchInputToGameKeyEventAction'->getInstance());
            $list = 'org::allbinary::util::BasicArrayListD'->new();
            $list->add($touchMotionGestureFactory->{RIGHT});
            $motionGestureConfiguration->addMotionGestureAction($list, 'org::allbinary::input::motion::touch::action::RightTouchInputToGameKeyEventAction'->getInstance());
            $list = 'org::allbinary::util::BasicArrayListD'->new();
            $list->add($touchMotionGestureFactory->{DOWN});
            $motionGestureConfiguration->addMotionGestureAction($list, 'org::allbinary::input::motion::touch::action::DownTouchInputToGameKeyEventAction'->getInstance());
            $list = 'org::allbinary::util::BasicArrayListD'->new();
            $list->add($touchMotionGestureFactory->{UP});
            $motionGestureConfiguration->addMotionGestureAction($list, 'org::allbinary::input::motion::touch::action::UpTouchInputToGameKeyEventAction'->getInstance());
            $list = 'org::allbinary::util::BasicArrayListD'->new();
            $list->add($touchMotionGestureFactory->{RELEASED});
            $motionGestureConfiguration->addMotionGestureAction($list, 'org::allbinary::input::motion::touch::action::ReleaseTouchInputToGameKeyEventAction'->getInstance());
        } catch ($e) {
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{INIT}, $e);
        }
}

use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
use org::allbinary::input::motion::gesture::configuration::MotionGestureConfiguration;
use org::allbinary::input::motion::gesture::configuration::MotionGestureConfigurationFactory;
use org::allbinary::input::motion::touch::action::DiagonalDownLeftTouchInputToGameKeyEventAction;
use org::allbinary::input::motion::touch::action::DiagonalDownRightTouchInputToGameKeyEventAction;
use org::allbinary::input::motion::touch::action::DiagonalUpLeftTouchInputToGameKeyEventAction;
use org::allbinary::input::motion::touch::action::DiagonalUpRightTouchInputToGameKeyEventAction;
use org::allbinary::input::motion::touch::action::DownTouchInputToGameKeyEventAction;
use org::allbinary::input::motion::touch::action::LeftTouchInputToGameKeyEventAction;
use org::allbinary::input::motion::touch::action::ReleaseTouchInputToGameKeyEventAction;
use org::allbinary::input::motion::touch::action::RightTouchInputToGameKeyEventAction;
use org::allbinary::input::motion::touch::action::UpTouchInputToGameKeyEventAction;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

