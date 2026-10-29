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

package org::allbinary::graphics::pipeline::GraphicsPipeline;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();
use parent -norequire,'org::allbinary::graphics::pipeline::BasicGraphicsPipeline';



sub new {
    my ($class, $points) = @_;
    my $self = $class->SUPER::new($points);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub rotateTheta {
    my ($self, $aTheta) = @_;
        my $newVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $self->{pointBasicArrayList}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $secondPoint = $self->{pointBasicArrayList}->get($index);
            my $secondX = ($secondPoint->getX() * cos($aTheta)) - ($secondPoint->getY() * sin($aTheta));
            my $secondY = ($secondPoint->getX() * sin($aTheta)) + ($secondPoint->getY() * cos($aTheta));
            my $point = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY((int($secondX)), (int($secondY)));
            $newVector->add($point);
        }
        $self->{pointBasicArrayList} = $newVector;
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::graphics::pipeline::BasicGraphicsPipeline;

1;

