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

package org::allbinary::animation::VectorMirrorGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::animation::VectorMirrorGenerator'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{vectorAnimationUtil} = 'org::allbinary::animation::VectorAnimationUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::VectorMirrorGenerator::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $points, $width) = @_;
        try {
            my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
            my $pointBasicArrayList = undef;
            my $nextPoints = undef;
            my $size2 = 0;
            my $size = scalar(@{$points});
            my $pointsBasicArrayList = 'org::allbinary::util::BasicArrayListS'->new($size);
            for (my $frame = 0; $frame < $size; $frame++) {
                $nextPoints = $points->[$frame];
                $size2 = scalar(@{$nextPoints});
                $pointBasicArrayList = 'org::allbinary::util::BasicArrayListS'->new($size2);
                for (my $index = 0; $index < $size2; $index++) {
                    $pointBasicArrayList->add($pointFactory->createXY($nextPoints->[$index]->[0], $nextPoints->[$index]->[1]));
                }
                $pointsBasicArrayList->add($pointBasicArrayList);
            }
            for (my $index = 0; $index < scalar(@{$points}); $index++) {
                $pointsBasicArrayList->add($self->getInstance($pointsBasicArrayList->{objectArray}->[$index], $width));
            }
            my $newPoints = $self->{vectorAnimationUtil}->toAnimationArrayFromListOfPointList($pointsBasicArrayList);
            return $newPoints;
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY_ARRAY_ARRAY};
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $pointBasicArrayList, $width) = @_;
        my $graphicsPipe = 'org::allbinary::graphics::pipeline::BasicGraphicsPipeline'->new($pointBasicArrayList);
        $graphicsPipe->createMatrix();
        $graphicsPipe->mirror($width);
        return $graphicsPipe->getMatrix();
}

use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::pipeline::BasicGraphicsPipeline;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListS;
use org::allbinary::animation::VectorAnimationUtil;

1;

