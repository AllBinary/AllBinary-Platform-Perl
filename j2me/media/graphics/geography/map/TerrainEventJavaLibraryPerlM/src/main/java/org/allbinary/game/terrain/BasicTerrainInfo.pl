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

package org::allbinary::game::terrain::BasicTerrainInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_BASIC_TERRAIN_INFO = 'org::allbinary::game::terrain::BasicTerrainInfo'->new('org::allbinary::math::AngleFactory'->getInstance()->{NOT_ANGLE});

sub _init_fields {
    my ($self) = @_;
    $self->{angle} = undef;
}


sub new {
    my ($class, $angle) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{angle} = $angle;
    return $self;
}


sub getAngle {
    my ($self) = @_;
        return $self->{angle};
}


sub setAngle {
    my ($self, $angle) = @_;
        $self->{angle} = $angle;
}

use org::allbinary::math::Angle;
use org::allbinary::math::AngleFactory;

1;

