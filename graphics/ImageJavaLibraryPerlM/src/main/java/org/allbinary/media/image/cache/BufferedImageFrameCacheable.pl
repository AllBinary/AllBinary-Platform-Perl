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

package org::allbinary::media::image::cache::BufferedImageFrameCacheable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::CacheableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{frame} = undef;
    $self->{bufferedImage} = undef;
}


sub new {
    my ($class, $bufferedImage, $frame) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{frame} = $frame;
        $self->setBufferedImage($bufferedImage);
    return $self;
}


sub getKey {
    my ($self) = @_;
        return $self->{frame};
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


sub setFrame {
    my ($self, $frame) = @_;
        $self->{frame} = $frame;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append(ref($self));
        $stringBuffer->append(" Frame: ");
        $stringBuffer->appendlong($self->getFrame());
        return $stringBuffer->toString();
}

# use java::awt::image::BufferedImage;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::cache::CacheableInterface;

1;

