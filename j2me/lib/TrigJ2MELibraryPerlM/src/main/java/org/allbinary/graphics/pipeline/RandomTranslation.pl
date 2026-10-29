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

package org::allbinary::graphics::pipeline::RandomTranslation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($class, $vector, $howMuch) = @_;
        my $myRandomFactory = 'org::allbinary::game::rand::MyRandomFactory'->getInstance();
        my $x = -$myRandomFactory->getNextInt($howMuch);
        my $y = $myRandomFactory->getNextInt($howMuch);
        my $graphicsPipe = 'org::allbinary::graphics::pipeline::BasicGraphicsPipeline'->new($vector);
        $graphicsPipe->createMatrix();
        $graphicsPipe->translate($x, $y);
        return $graphicsPipe->getMatrix();
}

use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::util::BasicArrayList;
use org::allbinary::graphics::pipeline::BasicGraphicsPipeline;

1;

