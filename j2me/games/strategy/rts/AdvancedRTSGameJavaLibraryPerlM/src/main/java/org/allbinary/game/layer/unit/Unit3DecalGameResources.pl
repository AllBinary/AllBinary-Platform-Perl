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

package org::allbinary::game::layer::unit::Unit3DecalGameResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::resources::BasicGameResources';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT} };


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::layer::unit::Unit3DecalGameResources::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::layer::unit::Unit3DecalGameResources::instance = 'org::allbinary::game::layer::unit::Unit3DecalGameResources'->new();
        }
        return $org::allbinary::game::layer::unit::Unit3DecalGameResources::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        my $ROOT = "/unit_decal";
        my $SMALL = "_40_by_40.png";
        my $MEDIUM = $SMALL;
        my $SIZE_FOUR = $SMALL;
        my $SIZE_FIVE = $SMALL;
        my $SIZE_SIX = $SMALL;
        my $SIZE = [$SMALL, $MEDIUM, $SIZE_FOUR, $SIZE_FIVE, $SIZE_SIX];
        $self->SUPER::init($ROOT, $SIZE);
    return $self;
}


# throws Exception
sub append {
    my ($self, $ROOT, $sizeString) = @_;
        $self->SUPER::append($ROOT, $sizeString);
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

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::layer::resources::BasicGameResources ();
use org::allbinary::game::layer::resources::GameGraphicsResourceUtil ();
use org::allbinary::AndroidUtil ();
use org::allbinary::game::configuration::feature::GraphicsFeatureFactory ();
use org::allbinary::logic::NullUtil ();

1;

