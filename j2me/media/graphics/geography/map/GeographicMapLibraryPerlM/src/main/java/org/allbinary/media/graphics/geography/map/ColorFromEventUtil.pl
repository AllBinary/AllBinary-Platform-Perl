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

package org::allbinary::media::graphics::geography::map::ColorFromEventUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::graphics::geography::map::ColorFromEventUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{YELLOW} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{YELLOW};
    $self->{COLOR_INT} = int($self->{YELLOW});
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::ColorFromEventUtil::instance;
}


sub getForegroundColor {
    my ($self, $gameCanvasInterface) = @_;
        my $color = $self->{YELLOW};
        my $geographicMapCompositeInterface = $gameCanvasInterface->getLayerManager();
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        if (defined($geographicMapInterface)) {
            my $foregroundBasicColor = $geographicMapInterface->getForegroundBasicColor();
            $color = $foregroundBasicColor;
        }
        return $color;
}

use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;

1;

