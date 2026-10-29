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

package org::allbinary::game::combat::weapon::WeaponProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::combat::weapon::SimpleWeaponProperties';

our $NULL_WEAPON_PROPERTIES = 'org::allbinary::game::combat::weapon::WeaponProperties'->new(0, 0, 0, 0, ((int(0) + 32768) % 65536 - 32768));
our $messageSent = 0;
our $DAMAGE = "Damage: ";
our $RANGE = "Range: ";
our $RELOAD = "Reload: ";

sub _init_fields {
    my ($self) = @_;
    $self->{reloadTime} = 0;
    $self->{targetingTime} = 0;
    $self->{speed} = $org::allbinary::logic::math::BasicDecimal::ZERO_BIGDECIMAL;
    $self->{MAX} = 10240;
    $self->{ZERO} = 0;
}


sub new {
    my ($class, $reloadTime, $targetingTime, $speed, $damage, $dissipation) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        if ($speed < $self->{MAX} && $speed != 0 && !$org::allbinary::game::combat::weapon::WeaponProperties::messageSent) {
            my $MESSAGE = "Danger Danger Danger: Speed probably to slow if using 1 degree calculations as velocity for a single axis could be below 1024: ";
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($MESSAGE)->appendlong($speed)->toString(), $self, $commonStrings->{CONSTRUCTOR});
            $org::allbinary::game::combat::weapon::WeaponProperties::messageSent = 1;
        }
        $self->setReloadTime($reloadTime);
        $self->setTargetingTime($targetingTime);
        $self->setDamage($damage);
        $self->setDissipation($dissipation);
        $self->setSpeed('org::allbinary::logic::math::BasicDecimal'->new($speed));
        if ($dissipation != $self->{ZERO}) {
            my $unscaledDamage = $self->{speed}->getUnscaled() * $damage;
            my $scaledDissipation = $dissipation * $self->{speed}->getScaledFactorValue();
            my $value = (int($unscaledDamage / $scaledDissipation));
            $self->setRange(int(($value * 9) / 10));
        }
    return $self;
}


sub setReloadTime {
    my ($self, $reloadTime) = @_;
        $self->{reloadTime} = $reloadTime;
}


sub getReloadTime {
    my ($self) = @_;
        return $self->{reloadTime};
}


sub setTargetingTime {
    my ($self, $targetingTime) = @_;
        $self->{targetingTime} = $targetingTime;
}


sub getTargetingTime {
    my ($self) = @_;
        return $self->{targetingTime};
}


sub getSpeed {
    my ($self) = @_;
        return $self->{speed};
}


sub setSpeed {
    my ($self, $speed) = @_;
        $self->{speed} = $speed;
}


sub getDamageI {
    my ($self, $range) = @_;
        return $self->getDamage() - (($self->getDissipation() * $range) / $self->{speed}->getScaled());
}


sub toStringArray {
    my ($self) = @_;
        my $index = 0;
        my $stringArray = [(undef) x (3)];
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringArray->[$index++] = $stringBuffer->append($org::allbinary::game::combat::weapon::WeaponProperties::DAMAGE)->appendint(int($self->getDamage()))->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringArray->[$index++] = $stringBuffer->append($org::allbinary::game::combat::weapon::WeaponProperties::RANGE)->appendint(int($self->getRange()))->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringArray->[$index++] = $stringBuffer->append($org::allbinary::game::combat::weapon::WeaponProperties::RELOAD)->appendlong($self->getReloadTime())->toString();
        return $stringArray;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($org::allbinary::game::combat::weapon::WeaponProperties::DAMAGE)->appendint(int($self->getDamage()));
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append($org::allbinary::game::combat::weapon::WeaponProperties::RANGE)->appendint(int($self->getRange()));
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append($org::allbinary::game::combat::weapon::WeaponProperties::RELOAD)->appendlong($self->getReloadTime());
        return $stringBuffer->toString();
}

use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::combat::weapon::SimpleWeaponProperties;

1;

