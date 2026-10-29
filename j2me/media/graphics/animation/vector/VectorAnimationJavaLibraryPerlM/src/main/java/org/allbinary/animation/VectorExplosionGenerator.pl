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

package org::allbinary::animation::VectorExplosionGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::animation::VectorExplosionGenerator'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{RANDOM} = 'org::allbinary::animation::VectorExplosionType'->new();
    $self->{ROTATION} = 'org::allbinary::animation::VectorExplosionType'->new();
    $self->{vectorAnimationUtil} = 'org::allbinary::animation::VectorAnimationUtil'->getInstance();
    $self->{randomRotationFactory} = 'org::allbinary::graphics::pipeline::RandomRotationFactory'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::VectorExplosionGenerator::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub createList {
    my ($self, $list, $howMuch, $type) = @_;
        my $point = undef;
        my $size = $list->size();
        my $points = [map { [(0) x (2)] } 1 .. ($size)];
        for (my $index = 0; $index < $size; $index++) {
            $point = $list->{objectArray}->[$index];
            $points->[$index]->[0] = $point->getX();
            $points->[$index]->[1] = $point->getY();
        }
        return $self->createListFromPoints($list, $points, $howMuch, $type);
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $points, $howMuch, $type) = @_;
        my $pointsBasicArrayList = $self->getInstanceStartFrame($points, $howMuch, $type, 1);
        my $tempBasicArrayList = $pointsBasicArrayList->{objectArray}->[0];
        my $newPoints = $self->{vectorAnimationUtil}->toAnimationArrayFromListOfPointListWithPointsPerFrame($pointsBasicArrayList, $tempBasicArrayList->size());
        return $newPoints;
}


# throws Exception
sub getInstanceStartFrame {
    my ($self, $points, $howMuch, $type, $startFrame) = @_;
        try {
            my $pointsBasicArrayList = 'org::allbinary::util::BasicArrayListS'->new($howMuch);
            $pointsBasicArrayList->add($self->createPointsBasicArrayList($points));
            my $frameIndex = 0;
            my $tempBasicArrayList = undef;
            my $pointBasicArrayList = undef;
            while ($frameIndex < $howMuch) {
                $tempBasicArrayList = $pointsBasicArrayList->{objectArray}->[$frameIndex];
                $pointBasicArrayList = $self->createListFromPoints($tempBasicArrayList, $points, $howMuch, $type);
                $pointsBasicArrayList->add($pointBasicArrayList);
                $frameIndex++;
            }
            if (!$startFrame) {
                $pointsBasicArrayList->removeAt(0);
            }
            return $pointsBasicArrayList;
        } catch ($e) {
            die $e;
        }
}


# throws Exception
sub createListFromPoints {
    my ($self, $tempBasicArrayList, $points, $howMuch, $type) = @_;
        my $index = 0;
        my $pointBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
        my $sectionBasicArrayList = undef;
        while ($index < scalar(@{$points})) {
            $sectionBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
            while ($points->[$index]->[0] != 1000) {
                $sectionBasicArrayList->add($tempBasicArrayList->{objectArray}->[$index]);
                $index++;
                if ($index >= scalar(@{$points})) {
                    last;
                }
            }
            $sectionBasicArrayList = 'org::allbinary::graphics::pipeline::RandomTranslation'->getInstance($sectionBasicArrayList, $howMuch);
            if ($type == $self->{ROTATION}) {
                $sectionBasicArrayList = $self->{randomRotationFactory}->getInstanceList($sectionBasicArrayList, $howMuch);
            }
            my $size = $sectionBasicArrayList->size();
            for (my $index2 = 0; $index2 < $size; $index2++) {
                $pointBasicArrayList->add($sectionBasicArrayList->{objectArray}->[$index2]);
            }
            if ($index >= scalar(@{$points})) {
                last;
            } elsif ($points->[$index]->[0] == 1000) {
                $pointBasicArrayList->add($tempBasicArrayList->{objectArray}->[$index]);
                $index++;
            }
        }
        return $pointBasicArrayList;
}


# throws Exception
sub createPointsBasicArrayList {
    my ($self, $points) = @_;
        if (scalar(@{$points}) == 0) {
            die ("Not Points Provided");
        }
        my $firstPointBasicArrayList = 'org::allbinary::util::BasicArrayListS'->new(scalar(@{$points}));
        my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
        for (my $index = 0; $index < scalar(@{$points}); $index++) {
            $firstPointBasicArrayList->add($pointFactory->createXY($points->[$index]->[0], $points->[$index]->[1]));
        }
        return $firstPointBasicArrayList;
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::pipeline::RandomRotationFactory;
use org::allbinary::graphics::pipeline::RandomTranslation;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListS;
use org::allbinary::animation::VectorExplosionType;
use org::allbinary::animation::VectorAnimationUtil;

1;

