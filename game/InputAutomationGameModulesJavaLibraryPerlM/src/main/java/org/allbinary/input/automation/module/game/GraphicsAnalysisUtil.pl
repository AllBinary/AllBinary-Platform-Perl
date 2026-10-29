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

package org::allbinary::input::automation::module::game::GraphicsAnalysisUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $MAX = 122;


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getNominator {
    my ($class, $bufferedImage, $min_x, $max_x, $y) = @_;
        for (my $index = int($max_x); $index > int($min_x); $index -= 1) {
            my $colorInteger = ("" . ($bufferedImage->getRGB($index, int($y))));
            my $automaticCacheInterface = 'org::allbinary::graphics::color::ColorCacheFactory'->getInstance();
            my $colorCacheable = $automaticCacheInterface->get($colorInteger);
            my $color = $colorCacheable->getColor();
            if ($color->getRed() < $org::allbinary::input::automation::module::game::GraphicsAnalysisUtil::MAX && $color->getGreen() < $org::allbinary::input::automation::module::game::GraphicsAnalysisUtil::MAX && $color->getBlue() < $org::allbinary::input::automation::module::game::GraphicsAnalysisUtil::MAX) {
            } else {
                return $index - int($min_x);
            }
        }
        return 0.0;
}

# use java::awt;
# use java::awt::image::BufferedImage;
use org::allbinary::graphics::color::ColorCacheFactory;
use org::allbinary::graphics::color::ColorCacheable;
use org::allbinary::logic::util::cache::AutomaticCacheInterface;

1;

