# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::layer::SpriteFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::SpriteFactoryInterface';

our $instance = 'org::allbinary::game::layer::SpriteFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::SpriteFactory::instance;
}


sub createSprite {
    my ($self, $image, $frameWidth, $frameHeight) = @_;
        return 'javax::microedition::lcdui::game::Sprite'->new($image, $frameWidth, $frameHeight);
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::layer::SpriteFactoryInterface;

1;

