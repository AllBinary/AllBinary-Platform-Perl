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

package org::allbinary::input::media::image::capture::CapturedImageWorkerResultsEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{frame} = undef;
    $self->{bufferedImage} = undef;
}


sub new {
    my ($class, $anyType, $frame, $bufferedImage) = @_;
    my $self = $class->SUPER::new($anyType);
    $self->_init_fields();
        # super(...) made $self above
        $self->{frame} = $frame;
        $self->setBufferedImage($bufferedImage);
    return $self;
}


sub getBufferedImage {
    my ($self) = @_;
        return $self->{bufferedImage};
}


sub setBufferedImage {
    my ($self, $bufferedImage) = @_;
        $self->{bufferedImage} = $bufferedImage;
}


sub getFrame {
    my ($self) = @_;
        return $self->{frame};
}

# use java::awt::image::BufferedImage;
use org::allbinary::logic::util::event::AllBinaryEventObject;

1;

