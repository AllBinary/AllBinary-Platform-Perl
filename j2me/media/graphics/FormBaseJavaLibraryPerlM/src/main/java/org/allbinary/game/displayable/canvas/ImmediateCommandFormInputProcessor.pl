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

package org::allbinary::game::displayable::canvas::ImmediateCommandFormInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::CommandFormInputProcessor';


sub _init_fields {
    my ($self) = @_;
    $self->{timeHelper} = 'org::allbinary::time::TimeDelayHelper'->new(25);
    $self->{gameCommandCanvas} = undef;
}


sub new {
    my ($class, $gameKeyEventList, $playerInputId, $gameCommandCanvas, $form) = @_;
    my $self = $class->SUPER::new($gameKeyEventList, $playerInputId, $gameCommandCanvas, $form);
    $self->_init_fields();
        # super(...) made $self above
        $self->{gameCommandCanvas} = $gameCommandCanvas;
    return $self;
}


sub onPressGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
        try {
            $self->SUPER::onPressGameKeyEvent($gameKeyEvent);
            if ($self->{timeHelper}->isTimeTNT()) {
                $self->processInputList();
                $self->{gameCommandCanvas}->{repaintBehavior}->onChangeRepaint($self->getCanvas());
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{gameInputStrings}->{ON_PRESS_GAME_KEY}, $e);
        }
}


sub onDownGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
        try {
            $self->SUPER::onDownGameKeyEvent($gameKeyEvent);
            if ($self->{timeHelper}->isTimeTNT()) {
                $self->processInputList();
                $self->{gameCommandCanvas}->{repaintBehavior}->onChangeRepaint($self->getCanvas());
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{gameInputStrings}->{ON_DOWN_GAME_KEY}, $e);
        }
}


sub onUpGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
        try {
            $self->SUPER::onUpGameKeyEvent($gameKeyEvent);
            if ($self->{timeHelper}->isTimeTNT()) {
                $self->processInputList();
                $self->{gameCommandCanvas}->{repaintBehavior}->onChangeRepaint($self->getCanvas());
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{gameInputStrings}->{ON_UP_GAME_KEY}, $e);
        }
}


sub onMotionGestureEvent {
    my ($self, $motionGestureEvent) = @_;
        try {
            $self->SUPER::onMotionGestureEvent($motionGestureEvent);
            if ($self->{timeHelper}->isTimeTNT()) {
                $self->processInputList();
                $self->{gameCommandCanvas}->{repaintBehavior}->onChangeRepaint($self->getCanvas());
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "onMotionGestureEvent", $e);
        }
}

use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::input::motion::gesture::observer::MotionGestureEvent;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::displayable::canvas::CommandFormInputProcessor;

1;

