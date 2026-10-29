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

package org::allbinary::game::layer::unit::UnitGameResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::resources::BasicGameResources';

our $ICON = "_icon";
our $BUILD = "_build";
our $DESTROY = "_destroy";
our $ICON_BUILD = "_icon" . $org::allbinary::game::layer::unit::UnitGameResources::BUILD;

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{RESOURCE_ICON_ANIMATION} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{RESOURCE_ICON_BUILD} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{RESOURCE_ICON} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{ICON_SIZE} = "_64_by_64.png";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws Exception
sub append {
    my ($self, $ROOT, $sizeString) = @_;
        $self->SUPER::append($ROOT, $sizeString);
        my $string = 'org::allbinary::game::layer::resources::GameGraphicsResourceUtil'->getInstance()->getName();
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->delete(0, $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->length());
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($ROOT);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($org::allbinary::game::layer::unit::UnitGameResources::DESTROY);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($string);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($sizeString);
        $self->{RESOURCE_DESTROY} = $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->toString();
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->delete(0, $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->length());
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($org::allbinary::game::layer::unit::UnitGameResources::ICON);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($ROOT);
        $self->{RESOURCE_ICON_ANIMATION} = $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->toString();
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->delete(0, $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->length());
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($ROOT);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($org::allbinary::game::layer::unit::UnitGameResources::ICON);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($string);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($self->{ICON_SIZE});
        $self->{RESOURCE_ICON} = $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->toString();
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->delete(0, $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->length());
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($ROOT);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($org::allbinary::game::layer::unit::UnitGameResources::ICON_BUILD);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($string);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($self->{ICON_SIZE});
        $self->{RESOURCE_ICON_BUILD} = $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->toString();
}


# throws Exception
sub getString {
    my ($self) = @_;
        if ('org::allbinary::AndroidUtil'->isAndroid()) {
            return 'org::allbinary::game::layer::resources::GameGraphicsResourceUtil'->getInstance()->getStringForFeature('org::allbinary::game::configuration::feature::GraphicsFeatureFactory'->getInstance()->{SPRITE_QUARTER_ROTATION_GRAPHICS});
        } else {
            return $self->SUPER::getString();
        }
}

use org::allbinary::game::layer::resources::BasicGameResources;
use org::allbinary::game::layer::resources::GameGraphicsResourceUtil;
use org::allbinary::AndroidUtil;
use org::allbinary::game::configuration::feature::GraphicsFeatureFactory;
use org::allbinary::logic::string::StringUtil;

1;

