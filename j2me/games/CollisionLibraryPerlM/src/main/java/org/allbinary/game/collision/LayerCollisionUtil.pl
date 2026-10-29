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

package org::allbinary::game::collision::LayerCollisionUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::collision::LayerCollisionUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{collisionProcessor} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::collision::LayerCollisionUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $gameFeatureFactory = 'org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance();
        if ('org::allbinary::graphics::opengles::OpenGLFeatureUtil'->getInstance()->isAnyThreed() && !$features->isFeature($gameFeatureFactory->{COLLISIONS_FORCED_TWO_DIMENSIONAL})) {
            $self->{collisionProcessor} = 'org::allbinary::game::collision::CollisionThreedProcessor'->new();
        } else {
            $self->{collisionProcessor} = 'org::allbinary::game::collision::Collision2DProcessor'->new();
        }
    return $self;
}


sub isCollision {
    my ($self, $myLayer, $myLayer2) = @_;
        return $self->{collisionProcessor}->isCollision($myLayer, $myLayer2);
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::graphics::opengles::OpenGLFeatureUtil;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::game::collision::Collision2DProcessor;
use org::allbinary::game::collision::CollisionThreedProcessor;

1;

