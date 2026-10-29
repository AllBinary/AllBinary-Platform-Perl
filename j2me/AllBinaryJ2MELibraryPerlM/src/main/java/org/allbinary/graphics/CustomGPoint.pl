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

package org::allbinary::graphics::CustomGPoint;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::GPoint';

our $NULL_CUSTOM_POINT = 'org::allbinary::graphics::CustomGPoint'->new(0, 0, 0);

sub _init_fields {
    my ($self) = @_;
    $self->{cx} = 0;
    $self->{cy} = 0;
    $self->{cz} = 0;
}


sub getInstance {
    my ($class, $point) = @_;
        return 'org::allbinary::graphics::CustomGPoint'->new($point->getX(), $point->getY(), $point->getZ());
}


sub getInstance3 {
    my ($class, $x, $y) = @_;
        return 'org::allbinary::graphics::CustomGPoint'->new($x, $y, 3);
}


sub new {
    my ($class, $x, $y, $z) = @_;
    my $self = $class->SUPER::new($x, $y, $z);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub setX {
    my ($self, $x) = @_;
        $self->{cx} = $x;
}


sub getX {
    my ($self) = @_;
        return $self->{cx};
}


sub setY {
    my ($self, $y) = @_;
        $self->{cy} = $y;
}


sub getY {
    my ($self) = @_;
        return $self->{cy};
}


sub setZ {
    my ($self, $z) = @_;
        $self->{cz} = $z;
}


sub getZ {
    my ($self) = @_;
        return $self->{cz};
}

use org::allbinary::graphics::GPoint;

1;

