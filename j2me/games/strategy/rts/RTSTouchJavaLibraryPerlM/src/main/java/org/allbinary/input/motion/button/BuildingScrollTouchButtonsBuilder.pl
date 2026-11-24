# 
# AllBinary Open License Version 1 
# Copyright (c) 2007 AllBinary 
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

package org::allbinary::input::motion::button::BuildingScrollTouchButtonsBuilder;
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
    _init_fields($self);
    return $self;
}


sub getList {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
            my $list = 'org::allbinary::util::BasicArrayListD'->new();
            my $touchButtonLocationHelper = 'org::allbinary::input::motion::button::TouchButtonLocationHelper'->new();
            my $commonButtons = java::lang::Object::jstatic('org::allbinary::input::motion::button::BuildingScrollTouchButtonsBuilder', 'CommonButtons')->getInstance();
            my $basicTouchButtonCellPositionFactory = 'org::allbinary::input::motion::button::BasicTouchButtonCellPositionFactory'->new();
            my $LEFT = java::lang::Object::jstatic('org::allbinary::input::motion::button::BuildingScrollTouchButtonsBuilder', 'TouchButton')->createButton(java::lang::Object::jstatic('org::allbinary::input::motion::button::BuildingScrollTouchButtonsBuilder', 'BasicTouchInputFactory')->getInstance()->{LEFT}, java::lang::Object::jstatic('org::allbinary::input::motion::button::BuildingScrollTouchButtonsBuilder', 'TouchButtonStrafeLeftResource')->getInstance(), $commonButtons->{NORMAL_BUTTON}, $basicTouchButtonCellPositionFactory->{TOP_LEFT}, $touchButtonLocationHelper->getColumnsRemainderHalf(), $touchButtonLocationHelper->getRowsRemainderHalf());
            my $RIGHT = java::lang::Object::jstatic('org::allbinary::input::motion::button::BuildingScrollTouchButtonsBuilder', 'TouchButton')->createButton(java::lang::Object::jstatic('org::allbinary::input::motion::button::BuildingScrollTouchButtonsBuilder', 'BasicTouchInputFactory')->getInstance()->{RIGHT}, java::lang::Object::jstatic('org::allbinary::input::motion::button::BuildingScrollTouchButtonsBuilder', 'TouchButtonStrafeRightResource')->getInstance(), $commonButtons->{NORMAL_BUTTON}, $basicTouchButtonCellPositionFactory->{TOP_RIGHT}, $touchButtonLocationHelper->getColumnsRemainderHalf(), $touchButtonLocationHelper->getRowsRemainderHalf());
            $list->add($LEFT);
            $list->add($RIGHT);
            return $list;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
            return 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
        }
}

use java::lang::Object ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::util::BasicArrayListUtil ();
use org::allbinary::logic::communication::log::LogUtil ();

1;

