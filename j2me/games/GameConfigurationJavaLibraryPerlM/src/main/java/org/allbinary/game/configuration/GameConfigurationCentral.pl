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

package org::allbinary::game::configuration::GameConfigurationCentral;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{SCALE} = undef;
    $self->{ORIENTATION} = undef;
    $self->{SENSOR_UPDATE_RATE} = undef;
    $self->{VIBRATION} = undef;
    $self->{CHALLENGE_LEVEL} = undef;
    $self->{COLLIDE_DAMAGE} = undef;
    $self->{DURABILITY_CHALLENGE_LEVEL} = undef;
    $self->{SPEED_CHALLENGE_LEVEL} = undef;
    $self->{ATTACK_CHALLENGE_LEVEL} = undef;
    $self->{CONTROL_LEVEL} = undef;
    $self->{PLAYER_INPUT_WAIT} = undef;
    $self->{SPEED} = undef;
    $self->{SOUND_VOLUME} = undef;
    $self->{MAX_GAME_OBJECTS} = undef;
    $self->{MAX_LAYERS} = undef;
    $self->{gameControlFidelity} = 36;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::configuration::GameConfigurationCentral::SINGLETON == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::configuration::GameConfigurationCentral::SINGLETON = 'org::allbinary::game::configuration::GameConfigurationCentral'->new();
        }
        return $org::allbinary::game::configuration::GameConfigurationCentral::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        $self->{SCALE} = 'org::allbinary::game::configuration::GameConfiguration'->new("Scale", $smallIntegerSingletonFactory->getAt(2), $smallIntegerSingletonFactory->getAt(2), $smallIntegerSingletonFactory->getAt(3));
        $self->{ORIENTATION} = 'org::allbinary::game::configuration::GameConfiguration'->new("Orientation", $smallIntegerSingletonFactory->getAt(0), $smallIntegerSingletonFactory->getAt(0), $smallIntegerSingletonFactory->getAt(8));
        $self->{SENSOR_UPDATE_RATE} = 'org::allbinary::game::configuration::GameConfiguration'->new("Sensor Update Rate", $smallIntegerSingletonFactory->getAt(0), $smallIntegerSingletonFactory->getAt(0), $smallIntegerSingletonFactory->getAt(3));
        $self->{VIBRATION} = 'org::allbinary::game::configuration::GameConfiguration'->new("Vibration", $smallIntegerSingletonFactory->getAt(0), $smallIntegerSingletonFactory->getAt(0), $smallIntegerSingletonFactory->getAt(3));
        $self->{CHALLENGE_LEVEL} = 'org::allbinary::game::configuration::GameConfiguration'->new("Global Challenge Level", $smallIntegerSingletonFactory->getAt(3), $smallIntegerSingletonFactory->getAt(1), $smallIntegerSingletonFactory->getAt(10));
        $self->{COLLIDE_DAMAGE} = 'org::allbinary::game::configuration::GameConfiguration'->new("Collide Damage Challenge Level", $smallIntegerSingletonFactory->getAt(3), $smallIntegerSingletonFactory->getAt(1), $smallIntegerSingletonFactory->getAt(10));
        $self->{DURABILITY_CHALLENGE_LEVEL} = 'org::allbinary::game::configuration::GameConfiguration'->new("Enemy Durability Challenge Level", $smallIntegerSingletonFactory->getAt(3), $smallIntegerSingletonFactory->getAt(1), $smallIntegerSingletonFactory->getAt(10));
        $self->{SPEED_CHALLENGE_LEVEL} = 'org::allbinary::game::configuration::GameConfiguration'->new("Enemy Speed Challenge Level", $smallIntegerSingletonFactory->getAt(3), $smallIntegerSingletonFactory->getAt(1), $smallIntegerSingletonFactory->getAt(10));
        $self->{ATTACK_CHALLENGE_LEVEL} = 'org::allbinary::game::configuration::GameConfiguration'->new("Enemy Attack Challenge Level", $smallIntegerSingletonFactory->getAt(3), $smallIntegerSingletonFactory->getAt(1), $smallIntegerSingletonFactory->getAt(10));
        $self->{CONTROL_LEVEL} = 'org::allbinary::game::configuration::GameConfiguration'->new("Control Fidelity", $smallIntegerSingletonFactory->getAt(5), $smallIntegerSingletonFactory->getAt(1), $smallIntegerSingletonFactory->getAt(10));
        $self->{PLAYER_INPUT_WAIT} = 'org::allbinary::game::configuration::GameConfiguration'->new("Input Wait", $smallIntegerSingletonFactory->getAt(5), $smallIntegerSingletonFactory->getAt(1), $smallIntegerSingletonFactory->getAt(10));
        $self->{SPEED} = 'org::allbinary::game::configuration::GameConfiguration'->new("Game Speed (Device Specific)", $smallIntegerSingletonFactory->getAt(5), $smallIntegerSingletonFactory->getAt(1), $smallIntegerSingletonFactory->getAt(10));
        $self->{SOUND_VOLUME} = 'org::allbinary::game::configuration::GameConfiguration'->new("Sound Volume", $smallIntegerSingletonFactory->getAt(6), $smallIntegerSingletonFactory->getAt(0), $smallIntegerSingletonFactory->getAt(10));
        $self->{MAX_GAME_OBJECTS} = 'org::allbinary::game::configuration::GameConfiguration'->new("Max Game Objects", $smallIntegerSingletonFactory->getAt(20), $smallIntegerSingletonFactory->getAt(1), $smallIntegerSingletonFactory->getAt(50));
        $self->{MAX_LAYERS} = 'org::allbinary::game::configuration::GameConfiguration'->new("Max Layers", $smallIntegerSingletonFactory->getAt(20), $smallIntegerSingletonFactory->getAt(1), $smallIntegerSingletonFactory->getAt(50));
    return $self;
}


sub load {
    my ($self, $abeClientInformation) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        try {
            my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
            my $keyValuePersistance = 'org::allbinary::game::configuration::persistance::GameConfigurationPersistanceSingleton'->getInstance();
            $keyValuePersistance->clear();
            $keyValuePersistance->loadAll($abeClientInformation);
            my $list = $keyValuePersistance->getIds();
            if ($list->size() > 0) {
                my $hashtable = $keyValuePersistance->get(0);
                my $anyType = $self->{SCALE}->getName();
                my $value = $hashtable->get($anyType);
                $self->{SCALE}->setValue($smallIntegerSingletonFactory->getAt(int(("" . ($value)))));
            } else {
                $self->{logUtil}->putF("No Game Configuration To Load", $self, $commonStrings->{LOAD});
            }
        } catch ($e) {
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{LOAD}, $e);
        }
}


sub setGameControlFidelity {
    my ($self, $gameControlFidelity) = @_;
        $self->{gameControlFidelity} = $gameControlFidelity;
}


sub getGameControlFidelity {
    my ($self) = @_;
        return $self->{gameControlFidelity};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $commonStrings = 'org::allbinary::string::CommonSeps'->getInstance();
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{SCALE}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{SCALE}->getValue())));
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{ORIENTATION}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{ORIENTATION}->getValue())));
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{SENSOR_UPDATE_RATE}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{SENSOR_UPDATE_RATE}->getValue())));
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{VIBRATION}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{VIBRATION}->getValue())));
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{CHALLENGE_LEVEL}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{CHALLENGE_LEVEL}->getValue())));
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{COLLIDE_DAMAGE}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{COLLIDE_DAMAGE}->getValue())));
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{DURABILITY_CHALLENGE_LEVEL}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{DURABILITY_CHALLENGE_LEVEL}->getValue())));
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{SPEED_CHALLENGE_LEVEL}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{SPEED_CHALLENGE_LEVEL}->getValue())));
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{ATTACK_CHALLENGE_LEVEL}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{ATTACK_CHALLENGE_LEVEL}->getValue())));
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{CONTROL_LEVEL}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{CONTROL_LEVEL}->getValue())));
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{SPEED}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{SPEED}->getValue())));
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{MAX_GAME_OBJECTS}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{MAX_GAME_OBJECTS}->getValue())));
        $stringBuffer->append($commonStrings->{COMMA_SEP});
        $stringBuffer->append($self->{MAX_LAYERS}->getName());
        $stringBuffer->append($commonStrings->{EQUALS});
        $stringBuffer->appendint(int(int($self->{MAX_LAYERS}->getValue())));
        return $stringBuffer->toString();
}

use org::allbinary::game::configuration::persistance::GameConfigurationPersistanceSingleton;
use org::allbinary::game::configuration::persistance::KeyValuePersistance;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::configuration::GameConfiguration;

1;

