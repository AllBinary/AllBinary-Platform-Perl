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

package org::allbinary::game::displayable::canvas::BasicPopupMenuPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::paint::Paintable','org::allbinary::graphics::font::UpdateMyFontInterface';

our $NAME = "MENU";

sub _init_fields {
    my ($self) = @_;
    $self->{basicSetColorUtil} = 'org::allbinary::graphics::color::BasicColorSetUtil'->getInstance();
    $self->{drawStringUtil} = 'org::allbinary::graphics::draw::DrawVerticalStringUtil'->getInstance();
    $self->{label} = undef;
    $self->{foregroundBasicColor} = undef;
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{rectangle} = undef;
    $self->{BORDER} = 0;
    $self->{heightOffset} = 0;
    $self->{offset} = 0;
    $self->{animationInterface} = undef;
}


sub new {
    my ($class, $rectangle, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{foregroundBasicColor} = $foregroundBasicColor;
        $self->{label} = $org::allbinary::game::displayable::canvas::BasicPopupMenuPaintable::NAME;
        $self->{rectangle} = $rectangle;
        if ('org::allbinary::J2MEUtil'->isJ2ME() || 'org::allbinary::J2MEUtil'->isHTML()) {
            $self->{animationInterface} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
        } else {
            $self->{animationInterface} = 'org::allbinary::animation::vector::RectangleFilledAnimation'->new($self->{rectangle}->getWidth(), $self->{rectangle}->getHeight(), 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{TRANSPARENT_GREY});
        }
        $self->init($rectangle);
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $isOpenGL = $features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL});
        $self->{drawStringUtil}->updateMeasurement($graphics, $self->{label});
        my $BORDER = 0;
        if ('org::allbinary::J2MEUtil'->isHTML() || $isOpenGL) {
            $BORDER = 'org::allbinary::graphics::font::MyFontProcessor'->defaultCharWidth($font) / 2;
        } elsif ('org::allbinary::AndroidUtil'->isAndroid() || 'org::allbinary::J2MEUtil'->isJ2SE() || $org::allbinary::game::layer::SWTUtil::isSWT) {
            $BORDER = 'org::allbinary::graphics::font::MyFontProcessor'->defaultCharWidth($font);
        } else {
            $BORDER = 'org::allbinary::graphics::font::MyFontProcessor'->defaultCharWidth($font) * 2;
        }
        $self->{BORDER} = $BORDER;
        $self->{heightOffset} = $self->{rectangle}->getHeight() - ($font->getHeight() * $org::allbinary::game::displayable::canvas::BasicPopupMenuPaintable::NAME->length());
        if ('org::allbinary::graphics::opengles::OpenGLFeatureUtil'->getInstance()->isAnyThreed()) {
            $self->{heightOffset} -= $font->getHeight() + 2;
            if ('org::allbinary::AndroidUtil'->isAndroid()) {
                $self->{heightOffset} = $font->getHeight();
            } else {
                $self->{heightOffset} -= $font->getHeight() + 2;
            }
        }
        $self->{offset} = (POSIX::floor(($self->{heightOffset}) / (2 ** (1)))) + (('org::allbinary::graphics::threed::SWTJOGLProcessor'->getInstance()->isJOGL() ? 4 : 0));
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


# throws Exception
sub init {
    my ($self, $rectangle) = @_;
        $self->{rectangle} = $rectangle;
        my $width = $self->{rectangle}->getWidth();
        my $height = $self->{rectangle}->getHeight();
        if ('org::allbinary::J2MEUtil'->isJ2ME() || 'org::allbinary::J2MEUtil'->isHTML()) {
        } else {
            my $rectangleFilledAnimation = $self->{animationInterface};
            $rectangleFilledAnimation->setWidth($width);
            $rectangleFilledAnimation->setHeight($height);
        }
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $point = $self->{rectangle}->getPoint();
        my $x = $point->getX();
        my $y = $point->getY();
        my $width = $self->{rectangle}->getWidth();
        my $height = $self->{rectangle}->getHeight();
        $self->{animationInterface}->paintXY($graphics, $x, $y);
        $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->{foregroundBasicColor});
        $self->{drawStringUtil}->paintVerticle($graphics, $self->{label}, $x + $self->{BORDER}, $y + $self->{offset}, 0);
        $graphics->drawRect($x, $y, $width, $height);
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::AndroidUtil;
use org::allbinary::J2MEUtil;
use org::allbinary::animation::Animation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::animation::vector::RectangleFilledAnimation;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::layer::SWTUtil;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::color::BasicColorSetUtil;
use org::allbinary::graphics::draw::DrawVerticalStringUtil;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::graphics::opengles::OpenGLFeatureUtil;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::graphics::threed::SWTJOGLProcessor;

1;

