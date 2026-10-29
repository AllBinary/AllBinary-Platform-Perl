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

package org::allbinary::graphics::j2me::workarea::canvas::Grid;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{grid} = undef;
    $self->{isGridOn} = 1;
    $self->{isGridPossible} = 0;
    $self->{zoom} = 3;
    $self->{isChanged} = 1;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of Grid takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub _new1 {
    my ($class, $grid) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{grid} = $grid->{grid};
        $self->showGrid($grid->{isGridOn});
        $self->{isGridPossible} = $grid->{isGridPossible};
        $self->setZoom($grid->getZoom());
    return $self;
}


sub isGridOn {
    my ($self) = @_;
        return $self->{isGridOn};
}


sub isGridPossible {
    my ($self) = @_;
        return $self->{isGridPossible};
}


sub getGrid {
    my ($self) = @_;
        return $self->{grid};
}


sub getZoom {
    my ($self) = @_;
        return $self->{zoom};
}


sub showGrid {
    my ($self, $value) = @_;
        $self->{isGridOn} = $value;
}


sub setZoom {
    my ($self, $zoom) = @_;
        $self->{zoom} = $zoom;
        if ($self->{zoom} < 1) {
            $zoom = 1;
        }
        $self->{isChanged} = 1;
}

use org::allbinary::graphics::GPoint;

1;

