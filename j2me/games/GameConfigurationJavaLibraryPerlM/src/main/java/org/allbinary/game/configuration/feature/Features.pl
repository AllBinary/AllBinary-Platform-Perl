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

package org::allbinary::game::configuration::feature::Features;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{list} = undef;
    $self->{defaultList} = undef;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::configuration::feature::Features::SINGLETON == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::configuration::feature::Features::SINGLETON = 'org::allbinary::game::configuration::feature::Features'->new();
        }
        return $org::allbinary::game::configuration::feature::Features::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->{defaultList} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->init();
    return $self;
}


# throws Exception
sub addDefault {
    my ($self, $gameFeature) = @_;
        $self->add($gameFeature);
        if (!$self->{defaultList}->contains($gameFeature)) {
            $self->{defaultList}->add($gameFeature);
        }
}


# throws Exception
sub add {
    my ($self, $gameFeature) = @_;
        if (!$self->{list}->contains($gameFeature)) {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->append($gameFeature->toString())->toString(), $self, $self->{commonStrings}->{ADD});
            $self->{list}->add($gameFeature);
            'org::allbinary::game::configuration::event::GameFeatureEventHandler'->getInstance()->fireEvent('org::allbinary::game::configuration::event::GameFeatureEvent'->new($gameFeature, $gameFeature->toString()));
        }
}


# throws Exception
sub removeDefault {
    my ($self, $gameFeature) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->append($gameFeature->toString())->toString(), $self, "removeDefault");
        $self->remove($gameFeature);
        $self->{defaultList}->remove($gameFeature);
}


# throws Exception
sub remove {
    my ($self, $gameFeature) = @_;
        if ($self->{list}->contains($gameFeature)) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{REMOVE});
            $self->{list}->remove($gameFeature);
            'org::allbinary::game::configuration::event::GameFeatureEventHandler'->getInstance()->fireEvent('org::allbinary::game::configuration::event::GameFeatureEvent'->new($gameFeature, $gameFeature->toString()));
        }
}


sub init {
    my ($self) = @_;
        try {
            my $gameFeatureFactory = 'org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance();
            my $inputFeatureFactory = 'org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance();
            my $sensorFeatureFactory = 'org::allbinary::game::configuration::feature::SensorFeatureFactory'->getInstance();
            my $touchFeatureFactory = 'org::allbinary::game::configuration::feature::TouchFeatureFactory'->getInstance();
            $self->addDefault($gameFeatureFactory->{ARTIFICIAL_INTELLEGENCE_PROCESSOR});
            $self->addDefault($gameFeatureFactory->{COLLIDABLE_INTERFACE_LAYER_PROCESSOR});
            $self->addDefault($gameFeatureFactory->{GAME_INPUT_LAYER_PROCESSOR});
            $self->addDefault($gameFeatureFactory->{TICKABLE_LAYER_PROCESSOR});
            $self->addDefault($inputFeatureFactory->{MULTI_KEY_PRESS});
            $self->addDefault($inputFeatureFactory->{REMOVE_DUPLICATE_KEY_PRESSES});
            $self->addDefault($gameFeatureFactory->{SCREEN_SHAKE});
            $self->addDefault($gameFeatureFactory->{POST_IMAGE_LOADING_MODIFICATION});
            my $operatingSystemInterface = 'org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
            if ($operatingSystemInterface->isOverScan()) {
                $self->addDefault($sensorFeatureFactory->{NO_ORIENTATION});
                $self->addDefault($touchFeatureFactory->{HIDE_SCREEN_BUTTONS});
            } else {
                $self->addDefault($sensorFeatureFactory->{ORIENTATION_SENSORS});
                $self->addDefault($touchFeatureFactory->{AUTO_HIDE_SHOW_SCREEN_BUTTONS});
            }
            $self->addDefault($touchFeatureFactory->{TOUCH_ENABLED});
            $self->addDefault('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{FULL_SCREEN});
            $self->addDefault('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{LOAD_ONDEMAND});
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $e);
        }
}


sub isDefault {
    my ($self, $gameFeature) = @_;
        return $self->{defaultList}->contains($gameFeature);
}


sub isFeature {
    my ($self, $gameFeature) = @_;
        return $self->{list}->contains($gameFeature);
}


# throws Exception
sub toggle {
    my ($self, $gameFeature) = @_;
        if ($self->isFeature($gameFeature)) {
            $self->remove($gameFeature);
        } else {
            $self->add($gameFeature);
        }
}

use org::allbinary::game::configuration::event::GameFeatureEvent;
use org::allbinary::game::configuration::event::GameFeatureEventHandler;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::logic::system::os::OperatingSystemFactory;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::game::configuration::feature::InputFeatureFactory;
use org::allbinary::game::configuration::feature::SensorFeatureFactory;
use org::allbinary::game::configuration::feature::TouchFeatureFactory;
use org::allbinary::game::configuration::feature::MainFeatureFactory;

1;

