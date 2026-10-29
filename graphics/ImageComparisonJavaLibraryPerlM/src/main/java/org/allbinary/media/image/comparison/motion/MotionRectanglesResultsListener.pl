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

# Java interface
package org::allbinary::media::image::comparison::motion::MotionRectanglesResultsListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::BasicEventListenerInterface';



sub onMotionRectanglesImageComparisonResultsEvent {
    my ($self, $motionRectanglesImageComparisonResultsEvent) = @_;
    die "abstract method onMotionRectanglesImageComparisonResultsEvent";
}

use org::allbinary::logic::util::event::BasicEventListenerInterface;

1;

