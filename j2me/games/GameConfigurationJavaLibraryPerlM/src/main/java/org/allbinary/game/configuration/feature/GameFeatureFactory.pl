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

package org::allbinary::game::configuration::feature::GameFeatureFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::configuration::feature::GameFeatureFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{SOUND} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Sound");
    $self->{MUSIC} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Music");
    $self->{SCREEN_SHAKE} = 'org::allbinary::game::configuration::feature::Feature'->new("Screen Shake");
    $self->{POST_IMAGE_LOADING_MODIFICATION} = 'org::allbinary::game::configuration::feature::Feature'->new("Post Image Loading Modification (Scaling, Rotation, or Other)");
    $self->{HEALTH_BARS} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Health Bars");
    $self->{DAMAGE_FLOATERS} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Damage Floaters");
    $self->{GAME_INPUT_LAYER_PROCESSOR} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Game Input Layer Processor");
    $self->{ARTIFICIAL_INTELLEGENCE_PROCESSOR} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Artificial Intelligence Layer Processor");
    $self->{COLLIDABLE_INTERFACE_LAYER_PROCESSOR} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Collidable Interface Layer Processor");
    $self->{TICKABLE_LAYER_PROCESSOR} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Tickable Layer Processor");
    $self->{CHEATING} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Cheating");
    $self->{DROPPED_ITEMS} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Drops");
    $self->{DROPPED_ITEMS_FROM_DEATH} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Drops from Dead");
    $self->{TEST_DESTROYED_LAYER_PROCESSOR} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Destroyed Layer Processor");
    $self->{COLLISIONS_WITH_SOURCE} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Allow Collisions With Source");
    $self->{COLLISIONS_FORCED_TWO_DIMENSIONAL} = 'org::allbinary::game::configuration::feature::GameFeature'->new("Collisions Forced Two Dimensional");
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::feature::GameFeatureFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}

use org::allbinary::game::configuration::feature::GameFeature;
use org::allbinary::game::configuration::feature::Feature;

1;

