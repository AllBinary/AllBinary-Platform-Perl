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

package org::allbinary::animation::VectorAnimationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::animation::VectorAnimationUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::VectorAnimationUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub toAnimationArrayFromListOfPointListWithPointsPerFrame {
    my ($self, $vector, $pointsPerFrame) = @_;
        my $size = $vector->size();
        my $points = [map { [map { [(0) x (2)] } 1 .. ($pointsPerFrame)] } 1 .. ($size)];
        my $nextBasicArrayList = undef;
        my $framePoints = undef;
        for (my $index = 0; $index < $size; $index++) {
            $nextBasicArrayList = $vector->{objectArray}->[$index];
            $framePoints = $self->toFrameArrayFromPointBasicArrayList($nextBasicArrayList);
            for (my $pointIndex = 0; $pointIndex < scalar(@{$framePoints}); $pointIndex++) {
                $points->[$index]->[$pointIndex]->[0] = $framePoints->[$pointIndex]->[0];
                $points->[$index]->[$pointIndex]->[1] = $framePoints->[$pointIndex]->[1];
            }
        }
        return $points;
}


sub toAnimationArrayFromListOfPointList {
    my ($self, $vector) = @_;
        my $size = $vector->size();
        my $points = [map { [map { [(0) x (0)] } 1 .. (0)] } 1 .. ($size)];
        my $nextBasicArrayList = undef;
        my $framePoints = undef;
        for (my $index = 0; $index < $size; $index++) {
            $nextBasicArrayList = $vector->{objectArray}->[$index];
            $framePoints = $self->toFrameArrayFromPointBasicArrayList($nextBasicArrayList);
            $points->[$index] = [map { [(0) x (2)] } 1 .. (scalar(@{$framePoints}))];
            for (my $pointIndex = 0; $pointIndex < scalar(@{$framePoints}); $pointIndex++) {
                $points->[$index]->[$pointIndex]->[0] = $framePoints->[$pointIndex]->[0];
                $points->[$index]->[$pointIndex]->[1] = $framePoints->[$pointIndex]->[1];
            }
        }
        return $points;
}


sub toFrameArrayFromPointBasicArrayList {
    my ($self, $list) = @_;
        my $points = [map { [(0) x (2)] } 1 .. ($list->size())];
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            my $nextPoint = $list->{objectArray}->[$index];
            $points->[$index]->[0] = $nextPoint->getX();
            $points->[$index]->[1] = $nextPoint->getY();
        }
        return $points;
}

use org::allbinary::graphics::GPoint;
use org::allbinary::util::BasicArrayList;

1;

