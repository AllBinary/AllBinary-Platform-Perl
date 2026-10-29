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
    $self->{hintAnimationInterface} = undef;
    $self->{rawRectangle} = undef;
    $self->{xBorder} = undef;
    $self->{yBorder} = undef;
    $self->{rectangleP} = $org::allbinary::graphics::RectangleFactory::SINGLETON;
    $self->{cellPositionP} = undef;
    $self->{animationX} = 0;
    $self->{animationY} = 0;
    $self->{hintAnimationY} = 0;
}


# throws Exception
sub createButton {
    my ($class, $touchButtonInput, $touchButtonResource, $rawRectangle, $cellPosition, $xBorder, $yBorder) = @_;
        return 'org::allbinary::input::motion::button::TouchButton'->new($touchButtonInput, 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->get($touchButtonResource->{RESOURCE})->getInstance(0), 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->get($touchButtonResource->{HINT})->getInstance(0), $rawRectangle, $cellPosition, $xBorder, $yBorder);
}


sub new {
    my ($class, $touchButtonInput, $animationInterface, $hintAnimationInterface, $rawRectangle, $cellPosition, $xBorder, $yBorder) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{touchButtonInput} = $touchButtonInput;
        $self->{animationInterface} = $animationInterface;
        $self->{hintAnimationInterface} = $hintAnimationInterface;
        $self->{rawRectangle} = $rawRectangle;
        $self->{cellPositionP} = $cellPosition;
        $self->{xBorder} = $xBorder;
        $self->{yBorder} = $yBorder;
        $self->updateRectangle();
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Created: ")->append($self->toString())->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
    return $self;
}


sub paintHint {
    my ($self, $graphics) = @_;
        $self->{hintAnimationInterface}->paintXY($graphics, $self->{animationX}, $self->{hintAnimationY});
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{animationInterface}->paintXY($graphics, $self->{animationX}, $self->{animationY});
}


sub updateRectangle {
    my ($self) = @_;
        try {
            my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
            my $x = $self->{rawRectangle}->getWidth() * $self->{cellPositionP}->getColumn();
            my $y = $self->{rawRectangle}->getHeight() * $self->{cellPositionP}->getRow();
            $self->{rectangleP} = 'org::allbinary::graphics::Rectangle'->new($pointFactory->createXY($x + $self->{xBorder}, $y + $self->{yBorder}), $self->{rawRectangle}->getWidth(), $self->{rawRectangle}->getHeight());
            my $point = $self->{rectangleP}->getPoint();
            $self->{animationX} = $point->getX();
            $self->{animationY} = $point->getY();
            $self->{hintAnimationY} = $self->{animationY} - 32;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "updateRectangle", $e);
        }
}


sub getCellPosition {
    my ($self) = @_;
        return $self->{cellPositionP};
}


sub getRectangle {
    my ($self) = @_;
        return $self->{rectangleP};
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
        $stringBuffer->append($stringUtil->toString($self->getRectangle()));
        $stringBuffer->append(" CellPosition: ");
        $stringBuffer->append($stringUtil->toString($self->{cellPositionP}));
        $stringBuffer->append(" xBorder: ");
        $stringBuffer->appendint($self->{xBorder});
        $stringBuffer->append(" yBorder: ");
        $stringBuffer->appendint($self->{yBorder});
        return $stringBuffer->toString();
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory;
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

