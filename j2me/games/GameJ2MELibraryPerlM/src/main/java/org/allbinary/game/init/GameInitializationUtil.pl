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

package org::allbinary::game::init::GameInitializationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::init::GameInitializationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EVENT} = 'org::allbinary::game::configuration::event::GameInitializedEvent'->new($self);
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub initDemo {
    my ($self, $abeClientInformation, $canvas, $gameInitializationInterfaceFactoryInterface) = @_;
        my $mainFeatureFactory = 'org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance();
        if ('org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance()->isChangedFeature($mainFeatureFactory->{STATIC})) {
            my $gameInitializationInterface = $gameInitializationInterfaceFactoryInterface->getInstance();
            my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
            if ($features->isFeature($mainFeatureFactory->{LOAD_ALL})) {
                $self->initGame($abeClientInformation, $canvas, $gameInitializationInterfaceFactoryInterface);
            } elsif ($features->isFeature($mainFeatureFactory->{LOAD_ONDEMAND})) {
                my $resourceLoadingLevelFactory = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance();
                $gameInitializationInterface->init($abeClientInformation, $canvas->getCustomCommandListener(), $resourceLoadingLevelFactory->{LOAD_EARLY}->getLevel());
                $self->{EVENT}->setResourceLoadingLevel($resourceLoadingLevelFactory->{LOAD_EARLY});
            } else {
                die ("No Loading Feature Available");
            }
            'org::allbinary::game::configuration::event::GameInitializedEventHandler'->getInstance()->fireEvent($self->{EVENT});
        }
}


# throws Exception
sub initGame {
    my ($self, $abeClientInformation, $canvas, $gameInitializationInterfaceFactoryInterface) = @_;
        if ('org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance()->isChangedFeature('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{STATIC})) {
            my $gameInitializationInterface = $gameInitializationInterfaceFactoryInterface->getInstance();
            my $resourceLoadingLevelFactory = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance();
            $gameInitializationInterface->init($abeClientInformation, $canvas->getCustomCommandListener(), $resourceLoadingLevelFactory->{LOAD_ALL}->getLevel());
            $self->{EVENT}->setResourceLoadingLevel($resourceLoadingLevelFactory->{LOAD_ALL});
            'org::allbinary::game::configuration::event::GameInitializedEventHandler'->getInstance()->fireEvent($self->{EVENT});
            'org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance()->remove('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{STATIC});
        }
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::init::GameInitializationUtil::instance;
}

use org::allbinary::game::configuration::event::ChangedGameFeatureListener;
use org::allbinary::game::configuration::event::GameInitializedEvent;
use org::allbinary::game::configuration::event::GameInitializedEventHandler;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::MainFeatureFactory;
use org::allbinary::game::resource::ResourceLoadingLevelFactory;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;

1;

