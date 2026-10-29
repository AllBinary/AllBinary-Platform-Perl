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

package org::allbinary::game::init::BaseGameInitialization;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::init::GameInitializationInterface';

our $NULL_BASE_GAME_INITIALIZATION = 'org::allbinary::game::init::BaseGameInitialization'->new([(undef) x (0)], 0);

sub _init_fields {
    my ($self) = @_;
    $self->{resourceInitializationArray} = undef;
    $self->{portion} = undef;
    $self->{initialized} = 0;
    $self->{EARLY_RESOURCES} = 0;
    $self->{GAME_RESOURCES} = 1;
    $self->{EARLY_CHANGABLE_RESOURCES} = 2;
    $self->{GAME_CHANGABLE_RESOURCES} = 3;
    $self->{gameInitialized} = 0;
    $self->{allLoaded} = 0;
}


sub new {
    my ($class, $resourceInitializationArray, $portion) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{resourceInitializationArray} = $resourceInitializationArray;
        $self->{portion} = $portion;
    return $self;
}


# throws Exception
sub initKey {
    my ($self, $portion) = @_;
}


# throws Exception
sub initKeyMapping {
    my ($self, $abeClientInformation, $portion) = @_;
        if ('org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance()->isChangedFeature('org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->{INPUT_MAPPING})) {
            'org::allbinary::game::input::PlatformInputMappingFactory'->getInstance()->getPersistentInputMappingInstance()->init($abeClientInformation);
            'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance()->addNormalPortion(50, "Game Keys");
            'org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance()->remove('org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->{INPUT_MAPPING});
        }
}


# throws Exception
sub init {
    my ($self, $abeClientInformation, $commandListener, $level) = @_;
        my $resourceLoadingLevelFactory = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance();
        if (!$self->isInitialized() && ($level == $resourceLoadingLevelFactory->{LOAD_ALL}->getLevel() || $level == $resourceLoadingLevelFactory->{LOAD_EARLY}->getLevel())) {
            my $localPortion = 40;
            if ($level == $resourceLoadingLevelFactory->{LOAD_EARLY}->getLevel()) {
                $localPortion = 8;
            }
            $self->setInitialized(1);
            $self->initKey($self->getPortion());
            $self->initKeyMapping($abeClientInformation, $self->getPortion());
            'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance()->init();
            my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
            $progressCanvas->addNormalPortion($localPortion, "Game Key Events");
            'org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance()->init('org::allbinary::game::input::PlatformInputMappingFactory'->getInstance()->getPersistentInputMappingInstance()->getInputMapping());
            'org::allbinary::input::motion::button::CancelTouchButtonInputFactory'->getInstance();
            $progressCanvas->addNormalPortion($localPortion, "Touch Input");
            'org::allbinary::input::motion::CompleteMotionGestureInputToGameMotionGestureInput'->getInstance()->init();
            $progressCanvas->addNormalPortion($localPortion, "Motion Input");
            'org::allbinary::image::GameFeatureImageCacheFactory'->init();
            $progressCanvas->addNormalPortion($localPortion, "Image Cache");
            $self->{resourceInitializationArray}->[$self->{EARLY_RESOURCES}]->init();
        }
}


# throws Exception
sub resourceInitialization {
    my ($self, $level) = @_;
        my $resourceLoadingLevelFactory = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance();
        if ($self->resourceAnimationChange() && $level == $resourceLoadingLevelFactory->{LOAD_EARLY}->getLevel()) {
            $self->clearResources();
            $self->{resourceInitializationArray}->[$self->{EARLY_CHANGABLE_RESOURCES}]->init();
        }
        if ($self->resourceAnimationChange() && $level == $resourceLoadingLevelFactory->{LOAD_ALL}->getLevel()) {
            if ($self->{allLoaded}) {
                $self->clearResources();
            }
            if ('org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->getList()->size() == 0) {
                $self->{resourceInitializationArray}->[$self->{EARLY_CHANGABLE_RESOURCES}]->init();
            }
            $self->{resourceInitializationArray}->[$self->{GAME_CHANGABLE_RESOURCES}]->init();
            $self->{allLoaded} = 1;
        }
}


sub resourceAnimationChange {
    my ($self) = @_;
        my $changedGameFeatureListener = 'org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance();
        my $gameConfigurationCentral = 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance();
        if ($changedGameFeatureListener->isChangedGameConfiguration($gameConfigurationCentral->{SCALE})) {
            return 1;
        }
        if ('org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance()->isChangedFeature('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{STATIC})) {
            return 1;
        }
        return 0;
}


sub clearResources {
    my ($self) = @_;
        $self->{allLoaded} = 0;
        'org::allbinary::image::GameFeatureImageCacheFactory'->releaseAll();
        my $featuredAnimationInterfaceFactoryInterfaceFactory = 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance();
        $featuredAnimationInterfaceFactoryInterfaceFactory->clear();
        'org::allbinary::game::resource::FeaturedResourceRelativeRelationshipFactory'->getInstance()->clear();
}


sub setGameInitialized {
    my ($self, $gameInitialized) = @_;
        $self->{gameInitialized} = $gameInitialized;
}


sub isGameInitialized {
    my ($self) = @_;
        return $self->{gameInitialized};
}


sub getPortion {
    my ($self) = @_;
        return $self->{portion};
}


sub setInitialized {
    my ($self, $initialized) = @_;
        $self->{initialized} = $initialized;
}


sub isInitialized {
    my ($self) = @_;
        return $self->{initialized};
}

# use javax::microedition::lcdui::CommandListener;
use org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::game::configuration::GameConfigurationCentral;
use org::allbinary::game::configuration::event::ChangedGameFeatureListener;
use org::allbinary::game::configuration::feature::InputFeatureFactory;
use org::allbinary::game::configuration::feature::MainFeatureFactory;
use org::allbinary::game::input::PlatformInputMappingFactory;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::game::resource::FeaturedResourceRelativeRelationshipFactory;
use org::allbinary::game::resource::ResourceInitialization;
use org::allbinary::game::resource::ResourceLoadingLevelFactory;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::image::GameFeatureImageCacheFactory;
use org::allbinary::input::motion::CompleteMotionGestureInputToGameMotionGestureInput;
use org::allbinary::input::motion::button::BasicTouchInputFactory;
use org::allbinary::input::motion::button::CancelTouchButtonInputFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::game::init::GameInitializationInterface;

1;

