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

package org::allbinary::input::motion::button::BasicNeededTouchButtonsBuilder;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::motion::button::BaseTouchInput';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getList {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
            my $list = 'org::allbinary::util::BasicArrayListD'->new();
            my $touchButtonLocationHelper = 'org::allbinary::input::motion::button::TouchButtonLocationHelper'->new();
            my $basicTouchButtonCellPositionFactory = 'org::allbinary::input::motion::button::BasicTouchButtonCellPositionFactory'->new();
            my $commonButtons = 'org::allbinary::input::motion::button::CommonButtons'->getInstance();
            my $animationInterface = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
            my $UP = 'org::allbinary::input::motion::button::TouchButton'->new('org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance()->{UP}, $animationInterface, $animationInterface, $commonButtons->{NORMAL_BUTTON}, $basicTouchButtonCellPositionFactory->{SECOND_FROM_BOTTOM_LEFT}, $touchButtonLocationHelper->getColumnsRemainderHalf(), $touchButtonLocationHelper->getRowsRemainderHalf());
            my $DOWN = 'org::allbinary::input::motion::button::TouchButton'->new('org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance()->{DOWN}, $animationInterface, $animationInterface, $commonButtons->{NORMAL_BUTTON}, $basicTouchButtonCellPositionFactory->{BOTTOM_LEFT}, $touchButtonLocationHelper->getColumnsRemainderHalf(), $touchButtonLocationHelper->getRowsRemainderHalf());
            my $LEFT = 'org::allbinary::input::motion::button::TouchButton'->new('org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance()->{LEFT}, $animationInterface, $animationInterface, $commonButtons->{NORMAL_BUTTON}, $basicTouchButtonCellPositionFactory->{BOTTOM_SECOND_FROM_RIGHT}, $touchButtonLocationHelper->getColumnsRemainderHalf(), $touchButtonLocationHelper->getRowsRemainderHalf());
            my $RIGHT = 'org::allbinary::input::motion::button::TouchButton'->new('org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance()->{RIGHT}, $animationInterface, $animationInterface, $commonButtons->{NORMAL_BUTTON}, $basicTouchButtonCellPositionFactory->{BOTTOM_RIGHT}, $touchButtonLocationHelper->getColumnsRemainderHalf(), $touchButtonLocationHelper->getRowsRemainderHalf());
            $list->add($UP);
            $list->add($DOWN);
            $list->add($LEFT);
            $list->add($RIGHT);
            return $list;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{GET_LIST}, $e);
            return 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
        }
}

use org::allbinary::animation::Animation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::input::motion::button::BaseTouchInput;
use org::allbinary::input::motion::button::TouchButtonLocationHelper;
use org::allbinary::input::motion::button::BasicTouchButtonCellPositionFactory;
use org::allbinary::input::motion::button::CommonButtons;
use org::allbinary::input::motion::button::TouchButton;
use org::allbinary::input::motion::button::BasicTouchInputFactory;

1;

