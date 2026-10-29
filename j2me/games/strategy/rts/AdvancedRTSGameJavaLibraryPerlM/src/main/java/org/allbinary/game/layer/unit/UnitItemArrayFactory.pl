# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::unit::UnitItemArrayFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::ItemArraySingletonFactoryInterface';

our $ITEMS = 'org::allbinary::graphics::form::item::CustomItemUtil'->getInstance()->{CUSTOM_ITEM_ARRAY};

sub _init_fields {
    my ($self) = @_;
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE};
    $self->{resources} = undef;
}


sub new {
    my ($class, $resources) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{resources} = $resources;
    return $self;
}


# throws Exception
sub createFlagItem {
    my ($self, $flagResources, $layerInterfaceFactoryInterface) = @_;
        my $name = $flagResources->{NAME};
        my $index = index($name, $self->{commonSeps}->{SPACE});
        if ($index >= 0) {
            $name = substr($name, $index);
        }
        return $self->createNamedFlagItem($flagResources, $name, $layerInterfaceFactoryInterface);
}


# throws Exception
sub createNamedFlagItem {
    my ($self, $flagResources, $name, $layerInterfaceFactoryInterface) = @_;
        my $IMAGE_CACHE = 'org::allbinary::image::GameFeatureImageCacheFactory'->getInstance();
        my $image = $IMAGE_CACHE->getWithKey($flagResources->{RESOURCE_ICON});
        my $item = 'org::allbinary::game::layer::item::LayerInterfaceFactoryImageItem'->new($name, $image, $javax::microedition::lcdui::ImageItem::LAYOUT_DEFAULT, $flagResources->{NAME}, $self->{basicColor}, ['org::allbinary::game::layer::item::RTSLayerTextAnimation'->new('org::allbinary::game::layer::RTSGameStrings'->getInstance()->{DRAGGABLE}, $image)], $layerInterfaceFactoryInterface);
        return $item;
}


# throws Exception
sub getItems {
    my ($self) = @_;
        return $org::allbinary::game::layer::unit::UnitItemArrayFactory::ITEMS;
}


sub getResources {
    my ($self) = @_;
        return $self->{resources};
}


sub indexOf {
    my ($self, $basicGameResources) = @_;
        for (my $index = scalar(@{$self->{resources}}) - 1; $index >= 0; $index--) {
            if ($self->{resources}->[$index] == $basicGameResources) {
                return $index;
            }
        }
        return -1;
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::ImageItem;
use org::allbinary::game::layer::RTSGameStrings;
use org::allbinary::game::layer::item::LayerInterfaceFactoryImageItem;
use org::allbinary::game::layer::item::RTSLayerTextAnimation;
use org::allbinary::game::layer::resources::BasicGameResources;
use org::allbinary::game::layer::waypoint::FlagGameResources;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::image::GameFeatureImageCacheFactory;
use org::allbinary::string::CommonSeps;
use org::allbinary::animation::Animation;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::form::item::CustomItemUtil;
use org::allbinary::graphics::form::item::ItemArraySingletonFactoryInterface;
use org::allbinary::image::ImageCache;
use org::allbinary::layer::LayerInterfaceFactoryInterface;

1;

