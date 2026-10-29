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

#TWB - replace with file visitor version
package org::allbinary::media::image::filter::ImageFileFilter;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::filechooser::FileFilter';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub accept {
    my ($self, $f) = @_;
        if ($f->isDirectory()) {
            return 1;
        }
        my $s = $f->getName();
        my $i = rindex($s, ".");
        if ($i > 0 && $i < length($s) - 1) {
            my $ext = lc(substr($s, $i + 1));
            if (($ext eq "jpg") || ($ext eq "jpeg")) {
                return 1;
            }
        }
        return 0;
}


sub getDescription {
    my ($self) = @_;
        return "Accepts .jpg and .jpeg files";
}

use java::io::File;
# use javax::swing::filechooser::FileFilter;

1;

