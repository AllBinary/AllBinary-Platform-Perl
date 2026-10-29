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

package org::allbinary::game::combat::weapon::SimpleWeaponProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{damage} = 0;
    $self->{dissipation} = 0;
    $self->{range} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub set {
    my ($self, $simpleWeaponProperties) = @_;
        $self->setDamage($simpleWeaponProperties->getDamage());
        $self->setDissipation($simpleWeaponProperties->getDissipation());
        $self->setRange($simpleWeaponProperties->getRange());
}


sub setDamage {
    my ($self, $damage) = @_;
        $self->{damage} = $damage;
}


sub getDamage {
    my ($self) = @_;
        return $self->{damage};
}


sub setDissipation {
    my ($self, $dissipation) = @_;
        $self->{dissipation} = $dissipation;
}


sub getDissipation {
    my ($self) = @_;
        return $self->{dissipation};
}


sub getRange {
    my ($self) = @_;
        return $self->{range};
}


sub setRange {
    my ($self, $range) = @_;
        $self->{range} = $range;
}


1;

