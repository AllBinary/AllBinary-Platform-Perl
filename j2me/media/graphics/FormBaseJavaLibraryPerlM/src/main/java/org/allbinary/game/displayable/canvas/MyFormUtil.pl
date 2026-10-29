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

package org::allbinary::game::displayable::canvas::MyFormUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::displayable::canvas::MyFormUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{popupMenuRectangle} = $org::allbinary::graphics::RectangleFactory::SINGLETON;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::displayable::canvas::MyFormUtil::instance;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $isOpenGL = $features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL});
        my $TOTAL_CHAR_WIDTH = ('org::allbinary::graphics::threed::SWTJOGLProcessor'->getInstance()->isJOGL() && $isOpenGL ? 2 : 3);
        my $width = 'org::allbinary::graphics::font::MyFontProcessor'->defaultStringWidth($font, $TOTAL_CHAR_WIDTH);
        my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
        if ($displayInfo->getLastHeight() < 320) {
            $self->{popupMenuRectangle} = 'org::allbinary::graphics::Rectangle'->new($pointFactory->createXY(0, 25), $width, ($font->getHeight() * 4) + 2);
        } else {
            $self->{popupMenuRectangle} = 'org::allbinary::graphics::Rectangle'->new($pointFactory->createXY(0, $displayInfo->getLastHalfHeight() - 70), $width, ($font->getHeight() * 5));
        }
}


sub getPopupMenuRectangle {
    my ($self) = @_;
        return $self->{popupMenuRectangle};
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::RectangleFactory;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::graphics::threed::SWTJOGLProcessor;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

