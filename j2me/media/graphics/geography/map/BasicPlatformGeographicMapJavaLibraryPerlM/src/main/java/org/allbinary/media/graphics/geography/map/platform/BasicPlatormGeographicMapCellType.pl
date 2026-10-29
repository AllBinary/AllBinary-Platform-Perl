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

package org::allbinary::media::graphics::geography::map::platform::BasicPlatormGeographicMapCellType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{types} = undef;
}


sub createType {
    my ($class, $type) = @_;
        my $types = 'org::allbinary::util::BasicArrayListS'->new(1);
        $types->add('org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt($type));
        my $basicPlatormGeographicMapCellType = 'org::allbinary::media::graphics::geography::map::platform::BasicPlatormGeographicMapCellType'->new($types);
        return $basicPlatormGeographicMapCellType;
}


sub new {
    my ($class, $types) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $size = $types->size();
        my $typeArray = [(0) x ($size)];
        my $typeAsInteger = undef;
        my $type = 0;
        for (my $index = 0; $index < $size; $index++) {
            $typeAsInteger = ($types->get($index));
            $type = int($typeAsInteger);
            'org::allbinary::media::graphics::geography::map::GeographicMapCellType'->new($type, 0);
            $typeArray->[$index] = $type;
        }
        $self->{types} = $typeArray;
    return $self;
}


sub isType {
    my ($self, $type) = @_;
        return $self->hasType($type->getType());
}


sub hasType {
    my ($self, $type) = @_;
        my $size = scalar(@{$self->{types}});
        for (my $index = 0; $index < $size; $index++) {
            if ($self->{types}->[$index] == $type) {
                return 1;
            }
        }
        return 0;
}

use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListS;

1;

