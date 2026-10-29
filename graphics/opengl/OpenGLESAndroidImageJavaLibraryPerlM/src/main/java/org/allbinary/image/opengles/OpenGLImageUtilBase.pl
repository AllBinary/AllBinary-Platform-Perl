# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::image::opengles::OpenGLImageUtilBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub paint {
    my ($self, $alphaBitmap, $originalBitmap, $index) = @_;
        die ("RuntimeException");
}


# Java overloaded method: Perl keeps the last definition
sub paint {
    my ($self, $colorBitmap, $originalBitmap, $alpha, $basicColor) = @_;
        die ("RuntimeException");
}


# throws IOException
sub createImage {
    my ($self, $name) = @_;
        die ("RuntimeException");
}


# throws IOException
sub createImageFromInputStream {
    my ($self, $inputStream) = @_;
        die ("RuntimeException");
}

# use java::io::IOException;
# use java::io::InputStream;
use org::allbinary::graphics::OpenGLBitmap;
use org::allbinary::graphics::color::BasicColor;

1;

