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

#ImageCacheBaseJavaLibrary - J2ME
package org::allbinary::image::ImageFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::image::ImageFactory'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::image::ImageFactory::instance;
}


# throws Exception
sub createImageUrl {
    my ($self, $url) = @_;
        return 'javax::microedition::lcdui::Image'->createImage($url);
}


# throws Exception
sub createImage {
    my ($self, $caller, $width, $height) = @_;
        return 'javax::microedition::lcdui::Image'->createImage($width, $height);
}


# throws Exception
sub createImageFromInputStream {
    my ($self, $key, $inputStream) = @_;
        my $image = 'javax::microedition::lcdui::Image'->createImage($inputStream);
        return $image;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub createImageFromInputStream {
    my ($self, $inputStream) = @_;
        return 'javax::microedition::lcdui::Image'->createImage($inputStream);
}

# use java::io::InputStream;
# use javax::microedition::lcdui::Image;

1;

