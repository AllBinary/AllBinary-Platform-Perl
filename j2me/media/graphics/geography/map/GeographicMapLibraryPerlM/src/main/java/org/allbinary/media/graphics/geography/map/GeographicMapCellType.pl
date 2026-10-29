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

package org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_GEOGRAPHIC_MAP_CELL_TYPE_ARRAY = [(undef) x (0)];
our $NULL_GEOGRAPHIC_MAP_CELL_TYPE = 'org::allbinary::media::graphics::geography::map::GeographicMapCellType'->new((-2147483648), 0);

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{type} = undef;
}


sub new {
    my ($class, $type, $reset) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{type} = $type;
        if ($type != (-2147483648)) {
            my $geographicMapCellTypeFactory = 'org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory'->getInstance();
            my $geographicMapCellTypeArray = $geographicMapCellTypeFactory->getGeographicMapCellTypeArray();
            if (!defined($geographicMapCellTypeArray->[$type]) || $reset == 1) {
                $geographicMapCellTypeArray->[$type] = $self;
            } else {
                if ($reset != -1) {
                    die ("RuntimeException");
                }
            }
        }
    return $self;
}


sub getType {
    my ($self) = @_;
        return $self->{type};
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt($self->{type})->toString();
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;

1;

