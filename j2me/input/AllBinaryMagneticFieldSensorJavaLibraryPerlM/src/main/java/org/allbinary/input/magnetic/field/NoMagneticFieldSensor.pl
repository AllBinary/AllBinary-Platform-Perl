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

package org::allbinary::input::magnetic::field::NoMagneticFieldSensor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::magnetic::field::AllBinaryMagneticFieldSensor','org::allbinary::input::AllBinarySensorListener';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws Exception
sub getOrientation {
    my ($self) = @_;
        return $org::allbinary::logic::math::Orientation::NONE;
}


sub onSensorChange {
    my ($self) = @_;
}

use org::allbinary::input::AllBinarySensorListener;
use org::allbinary::logic::math::Orientation;
use org::allbinary::input::magnetic::field::AllBinaryMagneticFieldSensor;

1;

