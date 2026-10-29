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

package org::allbinary::game::configuration::feature::GraphicsFeatureFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::configuration::feature::GraphicsFeatureFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NONE} = 'org::allbinary::game::configuration::feature::GraphicsFeature'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{NULL_STRING});
    $self->{TRANSPARENT_IMAGE_CREATION} = 'org::allbinary::game::configuration::feature::GraphicsFeature'->new("Transparent Image Creation");
    $self->{IMAGE_GRAPHICS} = 'org::allbinary::game::configuration::feature::GraphicsFeature'->new("Image Graphics");
    $self->{IMAGE_ROTATION_ON_THE_FLY} = 'org::allbinary::game::configuration::feature::GraphicsFeature'->new("Image Rotated On The Fly");
    $self->{IMAGE_TO_ARRAY_GRAPHICS} = 'org::allbinary::game::configuration::feature::GraphicsFeature'->new("Image To Array Graphics");
    $self->{SPRITE_QUARTER_ROTATION_GRAPHICS} = 'org::allbinary::game::configuration::feature::GraphicsFeature'->new("Sprite Quarter Rotation Graphics");
    $self->{SPRITE_FULL_GRAPHICS} = 'org::allbinary::game::configuration::feature::GraphicsFeature'->new("Sprite Full Rotation Graphics");
    $self->{VECTOR_GRAPHICS} = 'org::allbinary::game::configuration::feature::GraphicsFeature'->new("BasicArrayList Graphics");
    $self->{VECTOR_TO_IMAGE_GRAPHICS} = 'org::allbinary::game::configuration::feature::GraphicsFeature'->new("BasicArrayList To Image Graphics");
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::feature::GraphicsFeatureFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::game::configuration::feature::GraphicsFeature;

1;

