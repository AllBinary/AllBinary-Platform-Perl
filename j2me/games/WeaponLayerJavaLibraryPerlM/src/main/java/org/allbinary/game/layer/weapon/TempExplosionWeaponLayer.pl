# Generated Code Do Not Modify

package org::allbinary::game::layer::weapon::TempExplosionWeaponLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::weapon::SimpleWeaponLayer';


sub _init_fields {
    my ($self) = @_;
    $self->{weaponProperties} = 'org::allbinary::game::combat::weapon::WeaponProperties'->new(-1, -1, 0, 1000, ((int(0) + 32768) % 65536 - 32768));
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(0);
}


sub new {
    my ($class, $name, $movement, $animationInterface, $rectangle, $viewPosition, $timeDelay) = @_;
    my $self = $class->SUPER::new($name, $org::allbinary::game::multiplayer::layer::RemoteInfo::REMOTE_INFO, -1, $movement, $animationInterface, 'org::allbinary::game::layer::weapon::SimpleWeaponLayer'->createDestroyed(), $rectangle, $viewPosition);
    $self->_init_fields();
        # super(...) made $self above
        $self->{timeDelayHelper}->{delay} = $timeDelay;
    return $self;
}


# throws Exception
sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
        if ($self->{timeDelayHelper}->isTime('org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance()->{startTime})) {
            $self->getCollidableInferface()->collide($self, $self);
            $self->{totalDamage} = $self->getInitDamage() + 1;
        }
        $self->SUPER::processTick($allBinaryLayerManager);
}

use org::allbinary::animation::Animation;
use org::allbinary::game::combat::weapon::WeaponProperties;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::graphics::Rectangle;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::physics::movement::Movement;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::layer::weapon::SimpleWeaponLayer;

1;

