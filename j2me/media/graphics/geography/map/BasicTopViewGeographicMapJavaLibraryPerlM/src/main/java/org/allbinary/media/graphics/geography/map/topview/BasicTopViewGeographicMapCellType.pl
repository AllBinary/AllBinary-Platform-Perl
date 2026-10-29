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

package org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{name} = undef;
    $self->{cost} = undef;
    $self->{types} = undef;
}


sub createType {
    my ($class, $name, $type, $cost) = @_;
        my $types = 'org::allbinary::util::BasicArrayListS'->new(1);
        $types->add($type);
        return 'org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellType'->new($name, $types, $cost);
}


sub new {
    my ($class, $name, $types, $cost) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $size = $types->size();
        my $typeArray = [(0) x ($size)];
        my $typeAsInteger = undef;
        my $type = 0;
        for (my $index = 0; $index < $size; $index++) {
            $typeAsInteger = ($types->get($index));
            $type = int($typeAsInteger);
            if (!defined('org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory'->getInstance()->getGeographicMapCellTypeArray()->[$type])) {
                'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new($name, $type, $cost, 0);
            } else {
            }
            $typeArray->[$index] = $type;
        }
        $self->{name} = $name;
        $self->{cost} = $cost;
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


sub getTypes {
    my ($self) = @_;
        return $self->{types};
}


sub toString {
    my ($self) = @_;
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $size = scalar(@{$self->{types}});
        for (my $index = 0; $index < $size; $index++) {
            $stringMaker->appendint($self->{types}->[$index])->append('org::allbinary::string::CommonSeps'->getInstance()->{COMMA});
        }
        return $stringMaker->toString();
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListS;

1;

