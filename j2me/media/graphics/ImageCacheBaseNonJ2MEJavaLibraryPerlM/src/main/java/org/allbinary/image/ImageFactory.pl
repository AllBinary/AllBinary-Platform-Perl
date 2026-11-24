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

#ImageCacheBaseAndroidJavaLibrary
package org::allbinary::image::ImageFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::image::ImageFactory'->new() };

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
        return 'javax::microedition::lcdui::Image'->createImageWH($width, $height);
}


# throws Exception
sub createImageFromInputStream_j2 {
    my ($self, $key, $inputStream) = @_;
        my $image = 'javax::microedition::lcdui::Image'->createImageFromInputStream($inputStream);
        return $image;
}


# throws Exception
sub createImageFromInputStream_j1 {
    my ($self, $inputStream) = @_;
        return 'javax::microedition::lcdui::Image'->createImageFromInputStream($inputStream);
}

sub createImageFromInputStream {
    my ($invocant, @arguments) = @_;
    return $invocant->createImageFromInputStream_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->createImageFromInputStream_j1(@arguments) if scalar(@arguments) == 1;
    die "No method createImageFromInputStream takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::io::InputStream ();
use javax::microedition::lcdui::Image ();

1;

