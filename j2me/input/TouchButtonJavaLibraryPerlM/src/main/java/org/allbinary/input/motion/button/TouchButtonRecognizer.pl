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

package org::allbinary::input::motion::button::TouchButtonRecognizer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{rectangleCollisionUtil} = 'org::allbinary::math::RectangleCollisionUtil'->getInstance();
    $self->{upGameKeyEventHandler} = 'org::allbinary::game::input::event::UpGameKeyEventHandler'->getInstance();
    $self->{downGameKeyEventHandler} = 'org::allbinary::game::input::event::DownGameKeyEventHandler'->getInstance();
    $self->{lastPressedTouchButtonInput} = 'org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance()->{NONE};
    $self->{currentlyPressedTouchButtonSingleton} = 'org::allbinary::input::motion::button::CurrentlyPressedTouchButtonSingleton'->getInstance();
    $self->{releaseHelper} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        if ('org::allbinary::input::motion::button::TouchScreenFactory'->getInstance()->isMultiTouch()) {
            $self->{releaseHelper} = 'org::allbinary::input::motion::button::MultitouchReleaseHelper'->new($self);
        } else {
            $self->{releaseHelper} = 'org::allbinary::input::motion::button::ReleaseHelper'->new($self);
        }
    return $self;
}


# throws Exception
sub processRelease {
    my ($self, $touchButtonInput, $deviceId) = @_;
        $self->{releaseHelper}->release($touchButtonInput, $deviceId);
        my $gameKeyEvent = $touchButtonInput->getGameKeyEvent();
        $self->{upGameKeyEventHandler}->fireEvent($gameKeyEvent);
        $self->{upGameKeyEventHandler}->getInstanceForDevice($deviceId)->fireEvent($gameKeyEvent);
        $self->{currentlyPressedTouchButtonSingleton}->remove($touchButtonInput);
}


# throws Exception
sub releaseTouchButtonInput {
    my ($self, $x, $y, $deviceId) = @_;
        my $touchButtonInput = $self->{lastPressedTouchButtonInput};
        if ($self->{currentlyPressedTouchButtonSingleton}->contains($touchButtonInput)) {
            $self->{lastPressedTouchButtonInput} = 'org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance()->{NONE};
            $self->processRelease($touchButtonInput, $deviceId);
            return 1;
        } else {
            my $list = 'org::allbinary::input::motion::button::TouchButtonFactory'->getInstance()->getList();
            my $rectangle = undef;
            my $point = undef;
            my $touchButton = undef;
            for (my $index = $list->size() - 1; $index >= 0; $index--) {
                $touchButton = $list->{objectArray}->[$index];
                $rectangle = $touchButton->getRectangle();
                $point = $rectangle->getPoint();
                if ($self->{rectangleCollisionUtil}->isInside($point->getX(), $point->getY(), $rectangle->getMaxX(), $rectangle->getMaxY(), $x, $y)) {
                    $touchButtonInput = $touchButton->getTouchButtonInput();
                    $self->processRelease($touchButtonInput, $deviceId);
                    return 1;
                }
            }
        }
        return 0;
}


# throws Exception
sub pressTouchButtonInput {
    my ($self, $x, $y, $deviceId) = @_;
        my $list = 'org::allbinary::input::motion::button::TouchButtonFactory'->getInstance()->getList();
        my $rectangle = undef;
        my $point = undef;
        my $touchButton = undef;
        my $touchButtonInput = undef;
        my $gameKeyEvent = undef;
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            $touchButton = $list->{objectArray}->[$index];
            $rectangle = $touchButton->getRectangle();
            $point = $rectangle->getPoint();
            if ($self->{rectangleCollisionUtil}->isInside($point->getX(), $point->getY(), $rectangle->getMaxX(), $rectangle->getMaxY(), $x, $y)) {
                $touchButtonInput = $touchButton->getTouchButtonInput();
                if (!$self->{currentlyPressedTouchButtonSingleton}->contains($touchButtonInput)) {
                    $self->{releaseHelper}->release($touchButtonInput, $deviceId);
                    $self->{lastPressedTouchButtonInput} = $touchButtonInput;
                    $self->{currentlyPressedTouchButtonSingleton}->add($touchButtonInput);
                    $gameKeyEvent = $touchButtonInput->getGameKeyEvent();
                    $self->{downGameKeyEventHandler}->fireEvent($gameKeyEvent);
                    $self->{downGameKeyEventHandler}->getInstanceForDevice($deviceId)->fireEvent($gameKeyEvent);
                }
                return 1;
            }
        }
        return 0;
}

use java::lang::Object ();
use org::allbinary::game::input::event::DownGameKeyEventHandler ();
use org::allbinary::game::input::event::GameKeyEvent ();
use org::allbinary::game::input::event::UpGameKeyEventHandler ();
use org::allbinary::graphics::GPoint ();
use org::allbinary::graphics::Rectangle ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::math::RectangleCollisionUtil ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::input::motion::button::BasicTouchInputFactory ();
use org::allbinary::input::motion::button::CurrentlyPressedTouchButtonSingleton ();
use org::allbinary::input::motion::button::TouchScreenFactory ();
use org::allbinary::input::motion::button::ReleaseHelper ();
use org::allbinary::input::motion::button::MultitouchReleaseHelper ();
use org::allbinary::input::motion::button::TouchButtonFactory ();

1;

