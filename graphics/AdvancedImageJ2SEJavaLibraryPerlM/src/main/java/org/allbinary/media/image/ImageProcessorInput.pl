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

package org::allbinary::media::image::ImageProcessorInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{bufferedImageArray} = undef;
    $self->{files} = undef;
}


sub new {
    my ($class, $files, $bufferedImageArray) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        # super(...) made $self above
        $self->{bufferedImageArray} = $bufferedImageArray;
        $self->{files} = $files;
    return $self;
}


sub getBufferedImageArray {
    my ($self) = @_;
        return $self->{bufferedImageArray};
}


sub getFiles {
    my ($self) = @_;
        return $self->{files};
}

# use java::awt::image::BufferedImage;
use java::io::File;

1;

