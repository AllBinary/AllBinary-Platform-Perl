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

package org::allbinary::game::health::Health;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::health::HealthInterface';

our $NULL_HEALTH = 'org::allbinary::game::health::Health'->new(0);
our $NAME = "Health Resource";
our $HEALTH_LABEL = "Health: ";
our $MAX_HEALTH_LABEL = " Max: ";

sub _init_fields {
    my ($self) = @_;
    $self->{health} = 0;
    $self->{maxHealth} = 0;
    $self->{healthListenerInterface} = $org::allbinary::game::health::NullHealthListener::NULL_HEALTH_LISTENER;
}


sub new {
    my ($class, $maxHealth) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setMaxHealth($maxHealth);
        $self->setHealth($maxHealth);
    return $self;
}


sub heal {
    my ($self, $ahealth) = @_;
        my $newHealth = $self->getHealth() + $ahealth;
        if ($newHealth > $self->getMaxHealth()) {
            $self->setHealth($self->getMaxHealth());
        } else {
            $self->setHealth($newHealth);
        }
}


sub healMax {
    my ($self) = @_;
        $self->setHealth($self->getMaxHealth());
}


sub isDamaged {
    my ($self) = @_;
        if ($self->getHealth() != $self->getMaxHealth()) {
            return 1;
        } else {
            return 0;
        }
}


sub damage {
    my ($self, $ahealth) = @_;
        if ($ahealth < 0) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("******* Trying to heal when damaging. Damage: ");
            $stringBuffer->appendint($ahealth);
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
            $stringBuffer->append($self->toString());
            'org::allbinary::logic::communication::log::ForcedLogUtil'->log($stringBuffer->toString(), $self);
            return;
        }
        my $health = $self->getHealth() - $ahealth;
        $self->setHealth($health);
}


sub isAlive {
    my ($self) = @_;
        if ($self->getHealth() <= 0) {
            return 0;
        } else {
            return 1;
        }
}


sub getMaxHealth {
    my ($self) = @_;
        return $self->{maxHealth};
}


sub setMaxHealth {
    my ($self, $maxHealth) = @_;
        $self->{maxHealth} = $maxHealth;
}


sub setHealth {
    my ($self, $health) = @_;
        if ($health > $self->getMaxHealth()) {
            $self->{health} = $self->getMaxHealth();
        } elsif ($health < 0) {
            $self->{health} = 0;
        } else {
            $self->{health} = $health;
        }
        if (defined($self->{healthListenerInterface})) {
            $self->{healthListenerInterface}->onHealthChange();
        }
}


sub getHealth {
    my ($self) = @_;
        return $self->{health};
}


sub addListener {
    my ($self, $healthGraphic) = @_;
        $self->{healthListenerInterface} = $healthGraphic;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($org::allbinary::game::health::Health::HEALTH_LABEL);
        $stringBuffer->appendint($self->{health});
        $stringBuffer->append($org::allbinary::game::health::Health::MAX_HEALTH_LABEL);
        $stringBuffer->appendint($self->{maxHealth});
        return $stringBuffer->toString();
}

use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::game::health::HealthInterface;
use org::allbinary::game::health::NullHealthListener;

1;

