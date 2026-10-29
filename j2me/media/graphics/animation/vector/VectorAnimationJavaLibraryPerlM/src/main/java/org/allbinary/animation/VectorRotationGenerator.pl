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

package org::allbinary::animation::VectorRotationGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();

our $instance = 'org::allbinary::animation::VectorRotationGenerator'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{vectorAnimationUtil} = 'org::allbinary::animation::VectorAnimationUtil'->getInstance();
    $self->{angleFactory} = 'org::allbinary::math::AngleFactory'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::VectorRotationGenerator::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $vectorRotationInfo) = @_;
        return $self->getInstanceFrames($vectorRotationInfo->getWidth(), $vectorRotationInfo->getHeight(), $vectorRotationInfo->getPoints(), $vectorRotationInfo->getTotalFrames());
}


sub getInstanceFrames {
    my ($self, $width, $height, $points, $frames) = @_;
        try {
            my $totalAngle = $self->{angleFactory}->{TOTAL_ANGLE};
            my $angleIncrement = int($totalAngle / $frames);
            my $pointsBasicArrayList = 'org::allbinary::util::BasicArrayListS'->new(int($totalAngle / $angleIncrement));
            my $pointBasicArrayList = 'org::allbinary::util::BasicArrayListS'->new(scalar(@{$points}));
            my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
            my $size = scalar(@{$points});
            for (my $index = 0; $index < $size; $index++) {
                $pointBasicArrayList->add($pointFactory->createXY($points->[$index]->[0], $points->[$index]->[1]));
            }
            my $index = 0;
            while ($index < $totalAngle) {
                $pointsBasicArrayList->add($self->getListAtAngle($width, $height, $pointBasicArrayList, $self->{angleFactory}->getAt($index)));
                $index += $angleIncrement;
            }
            my $newPoints = $self->{vectorAnimationUtil}->toAnimationArrayFromListOfPointListWithPointsPerFrame($pointsBasicArrayList, $pointBasicArrayList->size());
            return $newPoints;
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY_ARRAY_ARRAY};
        }
}


# throws Exception
sub getListAtAngle {
    my ($self, $width, $height, $pointBasicArrayList, $angle) = @_;
        my $graphicsPipe = 'org::allbinary::graphics::pipeline::BasicGraphicsPipeline'->new($pointBasicArrayList);
        $graphicsPipe->createMatrix();
        $graphicsPipe->translate(-(POSIX::floor(($width) / (2 ** (1)))), -(POSIX::floor(($height) / (2 ** (1)))));
        $graphicsPipe->rotateToAngle($angle);
        $graphicsPipe->translate((POSIX::floor(($width) / (2 ** (1)))), (POSIX::floor(($height) / (2 ** (1)))));
        return $graphicsPipe->getMatrix();
}

use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::pipeline::BasicGraphicsPipeline;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::math::Angle;
use org::allbinary::math::AngleFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListS;
use org::allbinary::vector::VectorInfo;
use org::allbinary::animation::VectorAnimationUtil;

1;

