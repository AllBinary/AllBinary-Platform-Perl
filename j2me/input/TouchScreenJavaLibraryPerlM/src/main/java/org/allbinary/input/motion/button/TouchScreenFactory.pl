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

package org::allbinary::input::motion::button::TouchScreenFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::input::motion::button::TouchScreenFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{touch} = 0;
    $self->{multiTouch} = 0;
    $self->{multiTouchDistinct} = 0;
    $self->{touchScreenType} = 'org::allbinary::input::motion::button::TouchScreenTypesFactory'->getInstance()->{NOTOUCH};
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        try {
            $self->setTouch(1);
            $self->setMultiTouch(0);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $org::allbinary::input::motion::button::TouchScreenFactory::SINGLETON, $commonStrings->{GET_INSTANCE}, $e);
        }
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::button::TouchScreenFactory::SINGLETON;
}


sub setMultiTouch {
    my ($self, $multiTouch) = @_;
        $self->{multiTouch} = $multiTouch;
}


sub isMultiTouch {
    my ($self) = @_;
        return $self->{multiTouch};
}


sub setTouch {
    my ($self, $touch) = @_;
        $self->{touch} = $touch;
}


sub isTouch {
    my ($self) = @_;
        return $self->{touch};
}


sub setMultiTouchDistinct {
    my ($self, $multiTouchDistinct) = @_;
        $self->{multiTouchDistinct} = $multiTouchDistinct;
}


sub isMultiTouchDistinct {
    my ($self) = @_;
        return $self->{multiTouchDistinct};
}


sub setTouchScreenType {
    my ($self, $touchScreenType) = @_;
        $self->{touchScreenType} = $touchScreenType;
}


sub getTouchScreenType {
    my ($self) = @_;
        return $self->{touchScreenType};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("TouchScreen: ");
        $stringBuffer->appendboolean($self->isTouch());
        $stringBuffer->append(" MultiTouch: ");
        $stringBuffer->appendboolean($self->isMultiTouch());
        $stringBuffer->append(" Distinct MultiTouch: ");
        $stringBuffer->appendboolean($self->isMultiTouchDistinct());
        $stringBuffer->append(" TouchScreenType: ");
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->getTouchScreenType()));
        return $stringBuffer->toString();
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::motion::button::TouchScreenTypesFactory;

1;

