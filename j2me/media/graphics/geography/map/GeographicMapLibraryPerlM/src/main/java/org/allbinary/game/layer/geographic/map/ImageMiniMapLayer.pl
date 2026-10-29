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

package org::allbinary::game::layer::geographic::map::ImageMiniMapLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::geographic::map::MiniMapLayer';


sub _init_fields {
    my ($self) = @_;
    $self->{image} = $javax::microedition::lcdui::NullImage::NULL_IMAGE;
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
}


sub new {
    my ($class, $geographicMapInterface, $viewPosition) = @_;
    my $self = $class->SUPER::new($geographicMapInterface, $viewPosition);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        my $aWidth = $self->{allBinaryTiledLayer}->getWidth();
        my $aHeight = $self->{allBinaryTiledLayer}->getHeight();
        $self->{image} = 'org::allbinary::image::PaintableToImageUtil'->getImage($self->{allBinaryTiledLayer}, $aWidth, $aHeight);
}


sub paint {
    my ($self, $graphics) = @_;
        $graphics->drawImage($self->{image}, $self->{x}, $self->{y}, $self->{anchor});
        $self->paintDots($graphics);
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::graphics::Anchor;
use org::allbinary::image::PaintableToImageUtil;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::layer::geographic::map::MiniMapLayer;

1;

