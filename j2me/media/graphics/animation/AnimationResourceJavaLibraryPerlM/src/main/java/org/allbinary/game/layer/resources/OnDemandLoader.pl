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

package org::allbinary::game::layer::resources::OnDemandLoader;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{onDemandResourcesFactory} = undef;
    $self->{gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory} = undef;
    $self->{resourceAnimationInterfaceFactoryInterfaceFactory} = undef;
}


sub new {
    my ($class, $onDemandResourcesFactory, $gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory, $resourceAnimationInterfaceFactoryInterfaceFactory) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{onDemandResourcesFactory} = $onDemandResourcesFactory;
        $self->{gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory} = $gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory;
        $self->{resourceAnimationInterfaceFactoryInterfaceFactory} = $resourceAnimationInterfaceFactoryInterfaceFactory;
    return $self;
}


# throws Exception
sub init {
    my ($self, $imageCache, $level, $loadingString) = @_;
        my $resourceLoadingLevelFactory = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance();
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{LOAD_ALL})) {
            if ($self->{resourceAnimationInterfaceFactoryInterfaceFactory}->isInitialized()) {
                return;
            }
            $self->initAll($imageCache, $loadingString);
        } elsif ($level != $resourceLoadingLevelFactory->{LOAD_ALL}->getLevel()) {
            my $layerPlacementInterfaceBasicArrayListFactoryInterface = $self->{gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory}->getInstance($level);
            $self->initLevel($layerPlacementInterfaceBasicArrayListFactoryInterface, $imageCache, $level, $loadingString);
        }
}


# throws Exception
sub initAll {
    my ($self, $imageCache, $loadingString) = @_;
        my $index = 0;
        my $portion = 120;
        my $onDemandResources = undef;
        for (my $onDemandIndex = $self->{onDemandResourcesFactory}->size(); --$onDemandIndex >= 0; ) {
            $onDemandResources = $self->{onDemandResourcesFactory}->remove($onDemandIndex);
            if ($onDemandResources != $org::allbinary::game::layer::resources::OnDemandResources::NULL_ON_DEMAND_RESOURCES) {
                $index = $onDemandResources->initAt($imageCache, $self->{resourceAnimationInterfaceFactoryInterfaceFactory}, $portion, $loadingString, $index);
            }
        }
}


# throws Exception
sub initLevel {
    my ($self, $layerPlacementInterfaceBasicArrayListFactoryInterface, $imageCache, $level, $loadingString) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $portion = 120;
        my $index = 0;
        my $onDemandArray = $layerPlacementInterfaceBasicArrayListFactoryInterface->getOnDemandResources();
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($commonStrings->{START})->appendint(scalar(@{$onDemandArray}))->toString(), $self, "initLevel");
        my $onDemandResources = undef;
        for (my $onDemandIndex = scalar(@{$onDemandArray}); --$onDemandIndex >= 0; ) {
            $onDemandResources = $self->{onDemandResourcesFactory}->remove($onDemandArray->[$onDemandIndex]);
            if ($onDemandResources != $org::allbinary::game::layer::resources::OnDemandResources::NULL_ON_DEMAND_RESOURCES) {
                $index = $onDemandResources->initAt($imageCache, $self->{resourceAnimationInterfaceFactoryInterfaceFactory}, $portion, $loadingString, $index);
            }
        }
}

use org::allbinary::animation::resource::BaseResourceAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::MainFeatureFactory;
use org::allbinary::game::layer::GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory;
use org::allbinary::game::layer::LayerPlacementInterfaceBasicArrayListFactoryInterface;
use org::allbinary::game::resource::ResourceLoadingLevelFactory;
use org::allbinary::image::ImageCache;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::layer::resources::OnDemandResources;

1;

