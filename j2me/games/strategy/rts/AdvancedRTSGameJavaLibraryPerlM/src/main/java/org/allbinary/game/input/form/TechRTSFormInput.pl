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

package org::allbinary::game::input::form::TechRTSFormInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::form::RTSFormInput';


sub _init_fields {
    my ($self) = @_;
    $self->{EVENT} = 'org::allbinary::logic::util::event::AllBinaryEventObject'->new($self);
    $self->{noMoneyGameNotificationEvent} = undef;
}


sub new {
    my ($class, $groupInterface) = @_;
    my $self = $class->SUPER::new($groupInterface);
    $self->_init_fields();
        # super(...) made $self above
        my $basicColorFactory = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
        $self->{noMoneyGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{NO_MONEY}, 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(2), $basicColorFactory->{WHITE}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->SUPER::setAllBinaryGameLayerManager($allBinaryGameLayerManager);
        my $geographicMapCompositeInterface = $allBinaryGameLayerManager;
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        $self->{noMoneyGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
}


# throws Exception
sub processGameSpecific {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $itemIndex) = @_;
        $self->SUPER::process($layerManager);
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $technologyRTSInterfaceImageItem = $item;
        my $rtsInterface = $technologyRTSInterfaceImageItem->getRtsInterface();
        $self->{logUtil}->putF($stringMaker->append("isUpgradeable: ")->appendboolean($rtsInterface->isUpgradeable())->toString(), $self, $commonStrings->{PROCESS});
        if ($rtsInterface->isUpgradeable()) {
            my $cost = $rtsInterface->getUpgradeCost();
            my $capital = $rtsPlayerLayerInterface->getCapital();
            $stringMaker->delete(0, $stringMaker->length());
            $self->{logUtil}->putF($stringMaker->appendint($cost)->append("<=")->appendint(int($capital->getTotalMoney()))->toString(), $self, $commonStrings->{PROCESS});
            if ($cost <= $capital->getTotalMoney()) {
                $rtsPlayerLayerInterface->add('org::allbinary::media::audio::BuildingSound'->getInstance());
                $capital->removeMoney($cost);
                $rtsInterface->upgrade();
                $technologyRTSInterfaceImageItem->update();
                'org::allbinary::game::rts::technology::event::TechEventHandler'->getInstance()->fireEvent($self->{EVENT});
            } else {
                $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
                if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                    'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{noMoneyGameNotificationEvent});
                }
            }
        }
}

use org::allbinary::game::layer::RTSGameStrings;
use org::allbinary::game::layer::RTSInterface;
use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::game::layer::TechnologyRTSInterfaceImageItem;
use org::allbinary::game::layer::capital::Capital;
use org::allbinary::game::rts::technology::event::TechEventHandler;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::media::audio::BuildingSound;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::game::identification::Group;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::hud::event::GameNotificationEvent;
use org::allbinary::game::layer::hud::event::GameNotificationEventHandler;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::audio::ErrorSound;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::game::input::form::RTSFormInput;

1;

