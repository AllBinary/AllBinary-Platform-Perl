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

package org::allbinary::input::motion::button::TouchButton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::Paintable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{touchButtonInput} = undef;
    $self->{animationInterface} = undef;
    $self->{rawRectangle} = undef;
    $self->{xBorder} = undef;
    $self->{yBorder} = undef;
    $self->{rectangle} = $org::allbinary::graphics::RectangleFactory::SINGLETON;
    $self->{cellPosition} = undef;
    $self->{animationX} = 0;
    $self->{animationY} = 0;
}


sub new {
    my ($class, $touchButtonInput, $animationInterface, $rawRectangle, $cellPosition, $xBorder, $yBorder) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{touchButtonInput} = $touchButtonInput;
        $self->{animationInterface} = $animationInterface;
        $self->{rawRectangle} = $rawRectangle;
        $self->{cellPosition} = $cellPosition;
        $self->{xBorder} = $xBorder;
        $self->{yBorder} = $yBorder;
        $self->updateRectangle();
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Created: ")->append($self->toString())->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{animationInterface}->paintXY($graphics, $self->{animationX}, $self->{animationY});
}


sub updateRectangle {
    my ($self) = @_;
        try {
            my $x = $self->{rawRectangle}->getWidth() * $self->{cellPosition}->getColumn();
            my $y = $self->{rawRectangle}->getHeight() * $self->{cellPosition}->getRow();
            my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
            $self->{rectangle} = 'org::allbinary::graphics::Rectangle'->new($pointFactory->createXY($x + $self->{xBorder}, $y + $self->{yBorder}), $self->{rawRectangle}->getWidth(), $self->{rawRectangle}->getHeight());
            my $point = $self->{rectangle}->getPoint();
            $self->{animationX} = $point->getX();
            $self->{animationY} = $point->getY();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "updateRectangle", $e);
        }
}


sub getCellPositionP {
    my ($self) = @_;
        return $self->{cellPosition};
}


sub getRectangleP {
    my ($self) = @_;
        return $self->{rectangle};
}


sub getTouchButtonInput {
    my ($self) = @_;
        return $self->{touchButtonInput};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $stringBuffer->append("TouchButton: ");
        $stringBuffer->append($stringUtil->toString($self->{rectangle}));
        $stringBuffer->append(" CellPosition: ");
        $stringBuffer->append($stringUtil->toString($self->{cellPosition}));
        $stringBuffer->append(" xBorder: ");
        $stringBuffer->appendint($self->{xBorder});
        $stringBuffer->append(" yBorder: ");
        $stringBuffer->appendint($self->{yBorder});
        return $stringBuffer->toString();
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationInterface;
use org::allbinary::graphics::CellPosition;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::RectangleFactory;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;

1;

