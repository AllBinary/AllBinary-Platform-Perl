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

package org::allbinary::input::automation::module::generic::constraints::NoMotionRectangleConstraints;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::MotionRectangleConstraints';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        $self->setMinDimension('org::allbinary::input::automation::module::generic::constraints::Dimension'->new(0, 0));
        $self->setMinArea(0);
        $self->setMaxDimension('org::allbinary::input::automation::module::generic::constraints::Dimension'->new(2147483647, 2147483647));
        $self->setMaxMotionRectangles(2147483647);
    return $self;
}


sub isValid {
    my ($self, $frame, $bufferedImage, $rectangle) = @_;
        return 1;
}

# use java::awt;
# use java::awt::image::BufferedImage;
use org::allbinary::input::automation::module::MotionRectangleConstraints;
use org::allbinary::input::automation::module::generic::constraints::Dimension;

1;

