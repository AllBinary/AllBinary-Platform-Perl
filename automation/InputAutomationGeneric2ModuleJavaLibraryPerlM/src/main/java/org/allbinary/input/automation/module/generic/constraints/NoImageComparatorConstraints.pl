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

package org::allbinary::input::automation::module::generic::constraints::NoImageComparatorConstraints;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::ImageComparatorConstraints';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(1);
        # super(...) made $self above
        $self->setMaxNonMatchingPixelDeltas(2147483647);
    return $self;
}


sub isColorAllowed {
    my ($self, $frame, $point, $color) = @_;
        return 1;
}


sub isImageValid {
    my ($self, $bufferedImage) = @_;
        return 1;
}

# use java::awt;
# use java::awt::image::BufferedImage;
use org::allbinary::graphics::GPoint;
use org::allbinary::input::automation::module::ImageComparatorConstraints;

1;

