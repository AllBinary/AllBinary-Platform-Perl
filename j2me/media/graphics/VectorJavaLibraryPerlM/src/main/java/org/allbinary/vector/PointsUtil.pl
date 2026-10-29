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

package org::allbinary::vector::PointsUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::vector::PointsUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::vector::PointsUtil::instance;
}


sub adjustXY {
    my ($self, $points, $x, $y) = @_;
        my $size = scalar(@{$points});
        my $newPoints = [map { [map { [(0) x (0)] } 1 .. (0)] } 1 .. ($size)];
        for (my $index = 0; $index < $size; $index++) {
            my $size2 = scalar(@{$points->[$index]});
            $newPoints->[$index] = [map { [(0) x (2)] } 1 .. ($size2)];
            for (my $index2 = 0; $index2 < $size2; $index2++) {
                if ($points->[$index]->[$index2]->[0] != 1000) {
                    $newPoints->[$index]->[$index2]->[0] = $points->[$index]->[$index2]->[0] + $x;
                    $newPoints->[$index]->[$index2]->[1] = $points->[$index]->[$index2]->[1] + $y;
                } else {
                    $newPoints->[$index]->[$index2]->[0] = 1000;
                    $newPoints->[$index]->[$index2]->[1] = 1000;
                }
            }
        }
        return $newPoints;
}


sub adjust {
    my ($self, $points, $both) = @_;
        return $self->adjust($points, $both, $both);
}


# Java overloaded method: Perl keeps the last definition
sub adjust {
    my ($self, $points, $x, $y) = @_;
        my $newPoints = [map { [(0) x (2)] } 1 .. (scalar(@{$points}))];
        for (my $index2 = 0; $index2 < scalar(@{$points}); $index2++) {
            if ($points->[$index2]->[0] != 1000) {
                $newPoints->[$index2]->[0] = $points->[$index2]->[0] + $x;
                $newPoints->[$index2]->[1] = $points->[$index2]->[1] + $y;
            } else {
                $newPoints->[$index2]->[0] = 1000;
                $newPoints->[$index2]->[1] = 1000;
            }
        }
        return $newPoints;
}


1;

