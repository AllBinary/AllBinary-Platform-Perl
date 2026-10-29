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

package org::allbinary::game::layer::geographic::map::MiniMapLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::AllBinaryLayer','org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEventListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{allBinaryTiledLayer} = undef;
    $self->{geographicMapCellPositionFactory} = undef;
    $self->{list} = undef;
    $self->{basicColorList} = undef;
    $self->{positionList} = undef;
    $self->{animationInterface} = undef;
}


sub new {
    my ($class, $geographicMapInterface, $viewPosition) = @_;
    my $self = $class->SUPER::new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->createXY(0, $viewPosition->getY()), $geographicMapInterface->getAllBinaryTiledLayer()->getWidth(), $geographicMapInterface->getAllBinaryTiledLayer()->getHeight()), $viewPosition);
    $self->_init_fields();
        # super(...) made $self above
        $self->{allBinaryTiledLayer} = $geographicMapInterface->getAllBinaryTiledLayer();
        $self->{geographicMapCellPositionFactory} = $geographicMapInterface->getGeographicMapCellPositionFactory();
        $self->{animationInterface} = 'org::allbinary::animation::vector::CircleFilledAnimation'->new($self->{allBinaryTiledLayer}->getCellWidth(), $self->{allBinaryTiledLayer}->getCellHeight(), 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
        $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->{basicColorList} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->{positionList} = 'org::allbinary::util::BasicArrayListD'->new();
        'org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEventHandler'->getInstance()->addListener($self);
        $self->init();
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        $self->{allBinaryTiledLayer}->setPosition($self->{x}, $self->{y}, $self->{z});
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


# throws Exception
sub onRemoveGeographicMapCellPositionEvent {
    my ($self, $geographicMapCellPositionEvent) = @_;
        my $colorCompositeInterface = $geographicMapCellPositionEvent->getSource();
        my $index = $self->{list}->indexOf($colorCompositeInterface);
        if ($index >= 0) {
            $self->{list}->removeAt($index);
            $self->{basicColorList}->removeAt($index);
            $self->{positionList}->removeAt($index);
        }
}


# throws Exception
sub onGeographicMapCellPositionEvent {
    my ($self, $geographicMapCellPositionEvent) = @_;
        my $colorCompositeInterface = $geographicMapCellPositionEvent->getSource();
        my $layerIndex = -1;
        my $size = $self->{list}->size();
        my $nextColorCompositeInterface = undef;
        for (my $index = 0; $index < $size; $index++) {
            $nextColorCompositeInterface = $self->{list}->get($index);
            if ($nextColorCompositeInterface == $colorCompositeInterface) {
                $layerIndex = $index;
                last;
            }
        }
        my $geographicMapCellPosition = $self->{geographicMapCellPositionFactory}->getInstance($geographicMapCellPositionEvent->getGeographicMapCellPosition());
        my $point = $geographicMapCellPosition->getPoint();
        if ($layerIndex == -1) {
            $self->{list}->add($colorCompositeInterface);
            my $basicColor = $colorCompositeInterface->getBasicColorP();
            $self->{basicColorList}->add($basicColor);
            $self->{positionList}->add($point);
            $layerIndex = $self->{basicColorList}->size() - 1;
        } else {
            $self->{positionList}->set($layerIndex, $point);
        }
}


sub paintDots {
    my ($self, $graphics) = @_;
        my $localPositionList = $self->{positionList};
        my $localBasicColorList = $self->{basicColorList};
        my $length = $localPositionList->size();
        my $point = undef;
        my $basicColor = undef;
        for (my $index = $length; --$index >= 0; ) {
            $point = $localPositionList->get($index);
            $basicColor = $localBasicColorList->get($index);
            $graphics->setColor(int($basicColor));
            $self->{animationInterface}->setBasicColorP($basicColor);
            $self->{animationInterface}->paintXY($graphics, $point->getX() + $self->{x}, $point->getY() + $self->{y});
        }
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{allBinaryTiledLayer}->paint($graphics);
        $self->paintDots($graphics);
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::animation::vector::CircleFilledAnimation;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::color::ColorCompositeInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEvent;
use org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEventHandler;
use org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEventListenerInterface;
use org::allbinary::view::ViewPositionBase;

1;

