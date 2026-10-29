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

package org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::CellPosition';


sub _init_fields {
    my ($self) = @_;
    $self->{point} = undef;
    $self->{midPoint} = undef;
}


sub new {
    my ($class, $column, $row, $columns, $rows, $width, $height) = @_;
    my $self = $class->SUPER::new($column, $row, $columns, $rows);
    $self->_init_fields();
        # super(...) made $self above
        my $x = $self->getColumn() * $width;
        my $y = $self->getRow() * $height;
        my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
        $self->{point} = $pointFactory->createXY($x, $y);
        $self->{midPoint} = $pointFactory->createXY($x + (POSIX::floor(($width) / (2 ** (1)))), $y + (POSIX::floor(($height) / (2 ** (1)))));
    return $self;
}


sub getPoint {
    my ($self) = @_;
        return $self->{point};
}


sub getMidPoint {
    my ($self) = @_;
        return $self->{midPoint};
}


sub setMidPoint {
    my ($self, $midPoint) = @_;
        $self->{midPoint} = $midPoint;
}

use org::allbinary::graphics::CellPosition;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;

1;

