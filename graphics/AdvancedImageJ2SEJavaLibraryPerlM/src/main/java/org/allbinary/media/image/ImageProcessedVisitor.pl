# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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
package org::allbinary::media::image::ImageProcessedVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::image::ImageProcessorInputCompositeInterface';



# throws IOException
sub visit {
    my ($self, $generatedBufferedImage, $nameEnding, $index) = @_;
    die "abstract method visit";
}

# use java::awt::image::BufferedImage;
# use java::io::IOException;
use org::allbinary::media::image::ImageProcessorInputCompositeInterface;

1;

