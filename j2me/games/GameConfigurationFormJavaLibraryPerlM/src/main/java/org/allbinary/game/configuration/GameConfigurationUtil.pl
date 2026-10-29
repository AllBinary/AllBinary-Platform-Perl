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

package org::allbinary::game::configuration::GameConfigurationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use Scalar::Util ();

our $instance = 'org::allbinary::game::configuration::GameConfigurationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{GAUGE_UPDATE} = "Gauge Update: ";
    $self->{FROM} = " from: ";
    $self->{TO} = " to: ";
    $self->{COMPETITION_VALUE} = 1;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::GameConfigurationUtil::instance;
}


# throws Exception
sub change {
    my ($self, $gameOptionsForm, $gauge) = @_;
        $self->update($gauge);
        my $gameConfigurationSingleton = 'org::allbinary::game::configuration::GameConfigurationSingleton'->getInstance();
        my $gameConfiguration = $gameConfigurationSingleton->getInstanceByName($gauge->getLabel());
        $self->updateChallange($gameOptionsForm, $gameConfiguration);
}


# throws Exception
sub update {
    my ($self, $gauge) = @_;
        my $gameConfigurationSingleton = 'org::allbinary::game::configuration::GameConfigurationSingleton'->getInstance();
        my $gameConfiguration = $gameConfigurationSingleton->getInstanceByName($gauge->getLabel());
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        my $value = $smallIntegerSingletonFactory->getAt($gauge->getValue() + int($gameConfiguration->getMinValue()));
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{GAUGE_UPDATE});
        $stringBuffer->append($gameConfiguration->getName());
        $stringBuffer->append($self->{FROM});
        $stringBuffer->appendint(int(int($gameConfiguration->getValue())));
        $stringBuffer->append($self->{TO});
        $stringBuffer->appendint(int(int($value)));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{UPDATE});
        $gameConfiguration->setValue($value);
}


# throws Exception
sub setDefault {
    my ($self, $gauge) = @_;
        my $gameConfigurationSingleton = 'org::allbinary::game::configuration::GameConfigurationSingleton'->getInstance();
        my $gameConfiguration = $gameConfigurationSingleton->getInstanceByName($gauge->getLabel());
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Gauge Default: ");
        $stringBuffer->append($gameConfiguration->getName());
        $stringBuffer->append($self->{TO});
        $stringBuffer->appendint(int(int($gameConfiguration->getDefaultValue())));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "setDefault");
        $gauge->setValue(int($gameConfiguration->getDefaultValue()) - int($gameConfiguration->getMinValue()));
        $gameConfiguration->setValue($gameConfiguration->getDefaultValue());
}


# throws Exception
sub updateChallange {
    my ($self, $gameOptionsForm, $gameConfiguration) = @_;
        my $gameConfigurationSingleton = 'org::allbinary::game::configuration::GameConfigurationSingleton'->getInstance();
        my $gameConfigurationCentral = 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance();
        if ($gameConfiguration == $gameConfigurationCentral->{CHALLENGE_LEVEL}) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "updateChallange");
            $gameConfigurationCentral->{COLLIDE_DAMAGE}->setValue($gameConfiguration->getValue());
            $gameConfigurationCentral->{ATTACK_CHALLENGE_LEVEL}->setValue($gameConfiguration->getValue());
            $gameConfigurationCentral->{DURABILITY_CHALLENGE_LEVEL}->setValue($gameConfiguration->getValue());
            $gameConfigurationCentral->{SPEED_CHALLENGE_LEVEL}->setValue($gameConfiguration->getValue());
            my $size = $gameOptionsForm->size();
            for (my $index = 0; $index < $size; $index++) {
                my $item = $gameOptionsForm->get($index);
                if ((Scalar::Util::blessed($item) && $item->isa('org::allbinary::game::configuration::GameConfigurationGauge'))) {
                    my $gauge = $item;
                    my $name = $item->getLabel();
                    my $nextGameConfiguration = $gameConfigurationSingleton->getInstanceByName($name);
                    if ($nextGameConfiguration == $gameConfigurationCentral->{COLLIDE_DAMAGE}) {
                        $gauge->setValue(int($gameConfigurationCentral->{COLLIDE_DAMAGE}->getValue()) - int($gameConfiguration->getMinValue()));
                    } elsif ($nextGameConfiguration == $gameConfigurationCentral->{DURABILITY_CHALLENGE_LEVEL}) {
                        $gauge->setValue(int($gameConfigurationCentral->{DURABILITY_CHALLENGE_LEVEL}->getValue()) - int($gameConfiguration->getMinValue()));
                    } elsif ($nextGameConfiguration == $gameConfigurationCentral->{ATTACK_CHALLENGE_LEVEL}) {
                        $gauge->setValue(int($gameConfigurationCentral->{ATTACK_CHALLENGE_LEVEL}->getValue()) - int($gameConfiguration->getMinValue()));
                    } elsif ($nextGameConfiguration == $gameConfigurationCentral->{SPEED_CHALLENGE_LEVEL}) {
                        $gauge->setValue(int($gameConfigurationCentral->{SPEED_CHALLENGE_LEVEL}->getValue()) - int($gameConfiguration->getMinValue()));
                    }
                }
            }
        }
}


sub updateCompetitionValue {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "updateCompetitionValue");
        my $gameConfigurationCentral = 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance();
        $self->{COMPETITION_VALUE} = int($gameConfigurationCentral->{COLLIDE_DAMAGE}->getValue()) + int($gameConfigurationCentral->{ATTACK_CHALLENGE_LEVEL}->getValue()) + int($gameConfigurationCentral->{DURABILITY_CHALLENGE_LEVEL}->getValue()) + int($gameConfigurationCentral->{SPEED_CHALLENGE_LEVEL}->getValue());
        $self->{COMPETITION_VALUE} = (POSIX::floor(($self->{COMPETITION_VALUE}) / (2 ** (2))));
}


sub getCompetitionValue {
    my ($self) = @_;
        return $self->{COMPETITION_VALUE};
}

# use javax::microedition::lcdui::Item;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::configuration::GameConfigurationSingleton;
use org::allbinary::game::configuration::GameConfigurationCentral;

1;

