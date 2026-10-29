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

package org::allbinary::game::part::CountedLayerInterfaceFactoryPart;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::game::part::PartInterface','org::allbinary::graphics::font::UpdateMyFontInterface';

our $NULL_COUNTED_LAYER_INTERFACE_FACTORY = 'org::allbinary::game::part::CountedLayerInterfaceFactoryPart'->new(0, $org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory::NULL_COUNTED_PICKUP_LAYER_FACTORY);

sub _init_fields {
    my ($self) = @_;
    $self->{updateMyFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{myFontProcessor} = $self->{updateMyFontProcessor};
    $self->{animationInterface} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
    $self->{total} = 0;
    $self->{totalString} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_CHAR_ARRAY};
    $self->{xOffset} = 0;
    $self->{countedPickedUpLayerInterfaceFactory} = $org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory::NULL_COUNTED_PICKUP_LAYER_FACTORY;
    $self->{primitiveLongUtil} = undef;
}


sub new {
    my ($class, $total, $countedPickedUpLayerInterfaceFactory) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{primitiveLongUtil} = 'org::allbinary::logic::math::PrimitiveLongUtil'->createPowerOfTen(1000);
        $self->init($total, $countedPickedUpLayerInterfaceFactory);
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->setXOffset($font->charsWidth($self->{totalString}, 0, $self->{primitiveLongUtil}->getCurrentTotalDigits()) + (POSIX::floor(($font->getSize()) / (2 ** (1)))));
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub init {
    my ($self, $total, $countedPickedUpLayerInterfaceFactory) = @_;
        $self->setCountedPickedUpLayerInterfaceFactory($countedPickedUpLayerInterfaceFactory);
        $self->{total} = $total;
}


# throws Exception
sub getInstance {
    my ($self, $hashtable, $x, $y, $z) = @_;
        if ($self->{total} > 0) {
            $self->setTotal($self->{total} - 1);
            return $self->getCountedPickedUpLayerInterfaceFactory()->getNextInstance($hashtable, $x, $y, $z);
        } else {
            die ("No more left. Could use a listener to automatically remove");
        }
}


sub getTotal {
    my ($self) = @_;
        return $self->{total};
}


sub setTotal {
    my ($self, $total) = @_;
        $self->{total} = $total;
        $self->{totalString} = $self->{primitiveLongUtil}->getCharArray($total);
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
}


sub paintThreed {
    my ($self, $graphics) = @_;
}


sub getAnimationInterface {
    my ($self) = @_;
        return $self->{animationInterface};
}


sub setAnimationInterface {
    my ($self, $animationInterface) = @_;
        $self->{animationInterface} = $animationInterface;
}


sub getXOffset {
    my ($self) = @_;
        return $self->{xOffset};
}


sub setXOffset {
    my ($self, $totalStringWidth) = @_;
        $self->{xOffset} = $totalStringWidth;
}


sub getTotalString {
    my ($self) = @_;
        return $self->{totalString};
}


sub getCountedPickedUpLayerInterfaceFactory {
    my ($self) = @_;
        return $self->{countedPickedUpLayerInterfaceFactory};
}


sub setCountedPickedUpLayerInterfaceFactory {
    my ($self, $countedPickedUpLayerInterfaceFactory) = @_;
        $self->{countedPickedUpLayerInterfaceFactory} = $countedPickedUpLayerInterfaceFactory;
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::math::PrimitiveLongUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::part::PartInterface;

1;

