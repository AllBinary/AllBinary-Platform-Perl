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

package org::allbinary::graphics::pipeline::BasicGraphicsPipeline;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();


sub _init_fields {
    my ($self) = @_;
    $self->{pointBasicArrayList} = undef;
    $self->{noDecimalTrigTable} = 'org::allbinary::math::NoDecimalTrigTable'->getInstance();
}


sub new {
    my ($class, $points) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{pointBasicArrayList} = $points;
    return $self;
}


sub setInitMatrix {
    my ($self, $points) = @_;
        $self->{pointBasicArrayList} = $points;
}


sub createMatrix {
    my ($self) = @_;
}


# throws Exception
sub translate {
    my ($self, $x, $y) = @_;
        my $newBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $self->{pointBasicArrayList}->size();
        my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
        my $secondPoint = undef;
        for (my $index = 0; $index < $size; $index++) {
            $secondPoint = $self->{pointBasicArrayList}->{objectArray}->[$index];
            if ($secondPoint->getX() != 1000) {
                $newBasicArrayList->add($pointFactory->createXY($secondPoint->getX() + $x, $secondPoint->getY() + $y));
            } else {
                $newBasicArrayList->add($secondPoint);
            }
        }
        $self->{pointBasicArrayList} = $newBasicArrayList;
}


# throws Exception
sub rotateToAngle {
    my ($self, $angle) = @_;
        $self->rotate(int($angle->getValue()));
}


# throws Exception
sub rotate {
    my ($self, $angle) = @_;
        my $newBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
        my $secondPoint = undef;
        my $y = 0;
        my $secondX = 0;
        my $secondY = 0;
        my $point = undef;
        my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
        my $size = $self->{pointBasicArrayList}->size();
        my $sin = 0;
        my $cos = 0;
        for (my $index = 0; $index < $size; $index++) {
            $secondPoint = $self->{pointBasicArrayList}->{objectArray}->[$index];
            if ($secondPoint->getX() != 1000) {
                $sin = $self->{noDecimalTrigTable}->sin($angle);
                $cos = $self->{noDecimalTrigTable}->cos($angle);
                $y = $secondPoint->getY() * $sin;
                $secondX = ($secondPoint->getX() * $cos) - $y;
                $secondY = ($secondPoint->getX() * $sin) + ($secondPoint->getY() * $cos);
                $point = $pointFactory->createXY(int($secondX / 10000), int($secondY / 10000));
                $newBasicArrayList->add($point);
            } else {
                $newBasicArrayList->add($secondPoint);
            }
        }
        $self->{pointBasicArrayList} = $newBasicArrayList;
}


# throws Exception
sub mirror {
    my ($self, $width) = @_;
        my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
        my $halfWidth = (POSIX::floor(($width) / (2 ** (1))));
        my $newBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
        my $secondPoint = undef;
        my $newX = 0;
        my $point = undef;
        my $size = $self->{pointBasicArrayList}->size();
        for (my $index = 0; $index < $size; $index++) {
            $secondPoint = $self->{pointBasicArrayList}->{objectArray}->[$index];
            if ($secondPoint->getX() != 1000) {
                $newX = 0;
                if ($secondPoint->getX() > $halfWidth) {
                    $newX = $halfWidth - ($secondPoint->getX() - $halfWidth);
                } else {
                    $newX = $halfWidth + ($halfWidth - $secondPoint->getX());
                }
                $point = $pointFactory->createXY($newX, $secondPoint->getY());
                $newBasicArrayList->add($point);
            } else {
                $newBasicArrayList->add($secondPoint);
            }
        }
        $self->{pointBasicArrayList} = $newBasicArrayList;
}


sub getMatrix {
    my ($self) = @_;
        return $self->{pointBasicArrayList};
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::math::Angle;
use org::allbinary::math::NoDecimalTrigTable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

