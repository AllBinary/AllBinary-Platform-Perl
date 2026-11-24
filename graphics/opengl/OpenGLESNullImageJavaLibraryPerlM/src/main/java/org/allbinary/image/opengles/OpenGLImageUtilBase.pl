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
use parent -norequire,'java::lang::Object';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub paint_j3 {
    my ($self, $alphaBitmap, $originalBitmap, $index) = @_;
        die ("RuntimeException");
}


sub paint_j4 {
    my ($self, $colorBitmap, $originalBitmap, $alpha, $basicColor) = @_;
        die ("RuntimeException");
}

sub paint {
    my ($invocant, @arguments) = @_;
    return $invocant->paint_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->paint_j4(@arguments) if scalar(@arguments) == 4;
    die "No method paint takes " . scalar(@arguments) . " arguments";
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

use java::lang::Object ();
# use java::io::IOException ();
# use java::io::InputStream ();
use org::allbinary::graphics::OpenGLBitmap ();
use org::allbinary::graphics::color::BasicColor ();

1;

