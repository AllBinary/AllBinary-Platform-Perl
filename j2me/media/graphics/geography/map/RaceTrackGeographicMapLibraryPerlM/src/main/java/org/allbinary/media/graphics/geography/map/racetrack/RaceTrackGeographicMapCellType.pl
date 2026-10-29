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

package org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::GeographicMapCellType';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{travelCost} = undef;
}


sub new {
    my ($class, $name, $type, $travelCost, $reset) = @_;
    my $self = $class->SUPER::new($type, $reset);
    $self->_init_fields();
        # super(...) made $self above
        $self->{name} = $name;
        $self->{travelCost} = $travelCost;
    return $self;
}


sub getTravelCost {
    my ($self) = @_;
        return $self->{travelCost};
}

use org::allbinary::string::CommonStrings;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;

1;

