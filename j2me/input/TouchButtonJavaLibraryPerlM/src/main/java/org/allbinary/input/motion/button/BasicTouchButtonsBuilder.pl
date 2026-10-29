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

package org::allbinary::input::motion::button::BasicTouchButtonsBuilder;
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
            my $commonButtons = 'org::allbinary::input::motion::button::CommonButtons'->getInstance();
            my $touchButtonLocationHelper = 'org::allbinary::input::motion::button::TouchButtonLocationHelper'->new();
            my $basicTouchButtonCellPositionFactory = 'org::allbinary::input::motion::button::BasicTouchButtonCellPositionFactory'->new();
            my $UP = 'org::allbinary::input::motion::button::TouchButton'->createButton('org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance()->{UP}, 'org::allbinary::input::motion::button::TouchButtonUpResource'->getInstance(), $commonButtons->{NORMAL_BUTTON}, $basicTouchButtonCellPositionFactory->{SECOND_FROM_BOTTOM_LEFT}, $touchButtonLocationHelper->getColumnsRemainderHalf(), $touchButtonLocationHelper->getRowsRemainderHalf());
            my $DOWN = 'org::allbinary::input::motion::button::TouchButton'->createButton('org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance()->{DOWN}, 'org::allbinary::input::motion::button::TouchButtonDownResource'->getInstance(), $commonButtons->{NORMAL_BUTTON}, $basicTouchButtonCellPositionFactory->{BOTTOM_LEFT}, $touchButtonLocationHelper->getColumnsRemainderHalf(), $touchButtonLocationHelper->getRowsRemainderHalf());
            my $LEFT = 'org::allbinary::input::motion::button::TouchButton'->createButton('org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance()->{SPECIAL_BUTTON_FOUR}, 'org::allbinary::input::motion::button::TouchButtonTurnLeftResource'->getInstance(), $commonButtons->{NORMAL_BUTTON}, $basicTouchButtonCellPositionFactory->{BOTTOM_SECOND_FROM_RIGHT}, $touchButtonLocationHelper->getColumnsRemainderHalf(), $touchButtonLocationHelper->getRowsRemainderHalf());
            my $RIGHT = 'org::allbinary::input::motion::button::TouchButton'->createButton('org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance()->{SPECIAL_BUTTON_THREE}, 'org::allbinary::input::motion::button::TouchButtonTurnRightResource'->getInstance(), $commonButtons->{NORMAL_BUTTON}, $basicTouchButtonCellPositionFactory->{BOTTOM_RIGHT}, $touchButtonLocationHelper->getColumnsRemainderHalf(), $touchButtonLocationHelper->getRowsRemainderHalf());
            $list->add($UP);
            $list->add($LEFT);
            $list->add($RIGHT);
            $list->add($DOWN);
            return $list;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{GET_LIST}, $e);
            return 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::input::motion::button::BaseTouchInput;
use org::allbinary::input::motion::button::CommonButtons;
use org::allbinary::input::motion::button::TouchButtonLocationHelper;
use org::allbinary::input::motion::button::BasicTouchButtonCellPositionFactory;
use org::allbinary::input::motion::button::TouchButton;
use org::allbinary::input::motion::button::BasicTouchInputFactory;
use org::allbinary::input::motion::button::TouchButtonUpResource;
use org::allbinary::input::motion::button::TouchButtonDownResource;
use org::allbinary::input::motion::button::TouchButtonTurnLeftResource;
use org::allbinary::input::motion::button::TouchButtonTurnRightResource;

1;

