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

package org::allbinary::graphics::pipeline::RandomRotationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::pipeline::RandomRotationFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{myRandomFactory} = 'org::allbinary::game::rand::MyRandomFactory'->getInstance();
    $self->{angleFactory} = 'org::allbinary::math::AngleFactory'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::pipeline::RandomRotationFactory::instance;
}


# throws Exception
sub getInstanceList {
    my ($self, $vector, $howMuch) = @_;
        my $graphicsPipe = 'org::allbinary::graphics::pipeline::BasicGraphicsPipeline'->new($vector);
        $graphicsPipe->createMatrix();
        $graphicsPipe->rotateToAngle($self->{angleFactory}->getAt($self->getNextRandomAngle($howMuch)));
        return $graphicsPipe->getMatrix();
}


sub getNextRandomAngle {
    my ($self, $howMuch) = @_;
        return $self->{myRandomFactory}->getNextInt($howMuch * 10);
}

use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::math::AngleFactory;
use org::allbinary::util::BasicArrayList;
use org::allbinary::graphics::pipeline::BasicGraphicsPipeline;

1;

