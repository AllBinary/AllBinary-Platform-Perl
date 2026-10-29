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

package org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{geographicMapCellTypeArray} = [(undef) x (512)];
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory::instance;
}


sub get {
    my ($self, $type) = @_;
        return $self->{geographicMapCellTypeArray}->[$type];
}


sub getGeographicMapCellTypeArray {
    my ($self) = @_;
        return $self->{geographicMapCellTypeArray};
}


sub getStartType {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getEndType {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getEmptyType {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isPath {
    my ($self, $cellType) = @_;
        die ("RuntimeException");
}

use org::allbinary::logic::communication::log::LogUtil;

1;

