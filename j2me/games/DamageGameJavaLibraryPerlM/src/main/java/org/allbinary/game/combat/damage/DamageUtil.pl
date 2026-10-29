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

package org::allbinary::game::combat::damage::DamageUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::combat::damage::DamageUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{COLLIDE} = "collide";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::combat::damage::DamageUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub process {
    my ($self, $damageableInterface, $damageableInterface2) = @_;
        $damageableInterface->damage($damageableInterface2->getDamage(0), 0);
}


# throws Exception
sub debugDamage {
    my ($self, $collidableInterfaceCompositeInterface1, $collidableInterfaceCompositeInterface) = @_;
        my $collidableDestroyableDamageableLayer = $collidableInterfaceCompositeInterface;
        my $damage = $collidableDestroyableDamageableLayer->getDamage(0);
        if ($damage > 20000) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Collision ");
            $stringBuffer->append($collidableInterfaceCompositeInterface1->toString());
            $stringBuffer->append(" with: ");
            $stringBuffer->append($collidableInterfaceCompositeInterface->toString());
            $stringBuffer->append(" damage: ");
            $stringBuffer->appendint($damage);
            $self->{logUtil}->putF($stringBuffer->toString(), $collidableInterfaceCompositeInterface1, $self->{COLLIDE});
        }
}

use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;

1;

