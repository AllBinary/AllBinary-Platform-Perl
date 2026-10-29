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

package org::allbinary::game::displayable::canvas::BufferedGameCanvasPaintHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::ProcessPaintable';

our $MAX_IMAGES = 4;

sub _init_fields {
    my ($self) = @_;
    $self->{gameCanvas} = $javax::microedition::lcdui::NullCanvas::NULL_CANVAS;
    $self->{offScreenImage} = [(undef) x ($org::allbinary::game::displayable::canvas::BufferedGameCanvasPaintHelper::MAX_IMAGES)];
    $self->{previousImage} = $javax::microedition::lcdui::NullImage::NULL_IMAGE;
    $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance($org::allbinary::game::displayable::canvas::BufferedGameCanvasPaintHelper::MAX_IMAGES);
    $self->{drawCircularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstanceAt($org::allbinary::game::displayable::canvas::BufferedGameCanvasPaintHelper::MAX_IMAGES - 1, $org::allbinary::game::displayable::canvas::BufferedGameCanvasPaintHelper::MAX_IMAGES);
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
}


sub new {
    my ($class, $gameCanvas) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        die ("No Longer Used");
    return $self;
}


sub process {
    my ($self) = @_;
        my $myCanvas = ($self->{gameCanvas});
        $myCanvas->draw($self->{offScreenImage}->[$self->{circularIndexUtil}->getIndex()]->getGraphics());
        $self->{circularIndexUtil}->next();
        $self->{drawCircularIndexUtil}->next();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{previousImage} = $self->{offScreenImage}->[$self->{drawCircularIndexUtil}->getIndex()];
        $graphics->drawImage($self->{previousImage}, 0, 0, $self->{anchor});
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullCanvas;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::graphics::paint::ProcessPaintable;
use org::allbinary::util::CircularIndexUtil;

1;

