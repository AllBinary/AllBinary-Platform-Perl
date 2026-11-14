#
# AllBinary Open License Version 1
# Copyright (c) 2026 AllBinary
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

#like microemu-playn, so the languages without overloading can be generated. J2ME uses the MIDP overloads.
package org::allbinary::MIDPUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::MIDPUtil'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::MIDPUtil::instance;
}


sub createImageWH {
    my ($self, $width, $height) = @_;
        return 'javax::microedition::lcdui::Image'->createImage($width, $height);
}


sub createImageFromByteArray {
    my ($self, $imageData, $imageOffset, $imageLength) = @_;
        return 'javax::microedition::lcdui::Image'->createImage($imageData, $imageOffset, $imageLength);
}


# throws IOException
sub createImageFromInputStream {
    my ($self, $inputStream) = @_;
        return 'javax::microedition::lcdui::Image'->createImage($inputStream);
}


# throws IOException, MediaException
sub createPlayerFromInputStream {
    my ($self, $inputStream, $type) = @_;
        return 'javax::microedition::media::Manager'->createPlayer($inputStream, $type);
}


sub appendItem {
    my ($self, $form, $item) = @_;
        return $form->append($item);
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::io::IOException ();
# use java::io::InputStream ();
use javax::microedition::lcdui::Form ();
use javax::microedition::lcdui::Image ();
use javax::microedition::lcdui::Item ();
use javax::microedition::media::Manager ();
use javax::microedition::media::MediaException ();
use javax::microedition::media::Player ();

1;

