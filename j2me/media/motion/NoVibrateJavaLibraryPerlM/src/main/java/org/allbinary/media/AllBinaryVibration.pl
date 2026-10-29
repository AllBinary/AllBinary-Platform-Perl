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

package org::allbinary::media::AllBinaryVibration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::AllBinaryVibrationME';

our $VIBRATION = $org::allbinary::media::AllBinaryNoVibration::NO_VIBRATION;


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::AllBinaryVibration::VIBRATION;
}


sub init {
    my ($class) = @_;
        if (int('org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->{VIBRATION}->getValue()) == 0) {
            $org::allbinary::media::AllBinaryVibration::VIBRATION = $org::allbinary::media::AllBinaryNoVibration::NO_VIBRATION;
        } else {
            $org::allbinary::media::AllBinaryVibration::VIBRATION = 'org::allbinary::media::AllBinaryVibration'->new();
        }
}


sub vibrate {
    my ($self, $duration, $type, $volume) = @_;
}

use org::allbinary::game::configuration::GameConfigurationCentral;
use org::allbinary::media::AllBinaryVibrationME;
use org::allbinary::media::AllBinaryNoVibration;

1;

