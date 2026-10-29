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

package org::allbinary::android::input::motion::AnalogControllerHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();


sub _init_fields {
    my ($self) = @_;
    $self->{reduceTimeFactor} = undef;
    $self->{SCALE_VALUE} = 'org::allbinary::android::input::motion::AnalogControllerConfigurationFactory'->getInstance()->{SCALE_VALUE};
    $self->{rightTimeElapsedHelper} = 'org::allbinary::time::TimeDelayHelper'->new(0);
    $self->{leftTimeElapsedHelper} = 'org::allbinary::time::TimeDelayHelper'->new(0);
    $self->{downTimeElapsedHelper} = 'org::allbinary::time::TimeDelayHelper'->new(0);
    $self->{upTimeElapsedHelper} = 'org::allbinary::time::TimeDelayHelper'->new(0);
}


sub new {
    my ($class, $reduceTimeFactor) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{reduceTimeFactor} = $reduceTimeFactor;
    return $self;
}


# throws Exception
sub right {
    my ($self, $collidableDestroyableDamageableLayer, $xAnalogValue) = @_;
        $self->{rightTimeElapsedHelper}->{delay} = (POSIX::floor((($self->{SCALE_VALUE} - $xAnalogValue)) / (2 ** ($self->{reduceTimeFactor}))));
        if ($self->{rightTimeElapsedHelper}->isTimeTNT()) {
            $collidableDestroyableDamageableLayer->right();
        }
}


# throws Exception
sub left {
    my ($self, $collidableDestroyableDamageableLayer, $xAnalogValue) = @_;
        $self->{leftTimeElapsedHelper}->{delay} = (POSIX::floor((($self->{SCALE_VALUE} + $xAnalogValue)) / (2 ** ($self->{reduceTimeFactor}))));
        if ($self->{leftTimeElapsedHelper}->isTimeTNT()) {
            $collidableDestroyableDamageableLayer->left();
        }
}


# throws Exception
sub up {
    my ($self, $collidableDestroyableDamageableLayer, $xAnalogValue) = @_;
        $self->{upTimeElapsedHelper}->{delay} = (POSIX::floor((($self->{SCALE_VALUE} - $xAnalogValue)) / (2 ** ($self->{reduceTimeFactor}))));
        if ($self->{upTimeElapsedHelper}->isTimeTNT()) {
            $collidableDestroyableDamageableLayer->up();
        }
}


# throws Exception
sub down {
    my ($self, $collidableDestroyableDamageableLayer, $xAnalogValue) = @_;
        $self->{downTimeElapsedHelper}->{delay} = (POSIX::floor((($self->{SCALE_VALUE} + $xAnalogValue)) / (2 ** ($self->{reduceTimeFactor}))));
        if ($self->{downTimeElapsedHelper}->isTimeTNT()) {
            $collidableDestroyableDamageableLayer->down();
        }
}

use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::android::input::motion::AnalogControllerConfigurationFactory;

1;

