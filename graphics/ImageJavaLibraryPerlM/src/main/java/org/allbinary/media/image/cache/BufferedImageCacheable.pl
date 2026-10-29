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

package org::allbinary::media::image::cache::BufferedImageCacheable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::CacheableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{key} = undef;
    $self->{bufferedImage} = undef;
}


sub new {
    my ($class, $key) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{key} = $key;
        $self->setBufferedImage('java::awt::image::BufferedImage'->new($key->getWidth(), $key->getHeight(), $key->getType()));
    return $self;
}


sub getKey {
    my ($self) = @_;
        return $self->{key};
}


sub getBufferedImage {
    my ($self) = @_;
        return $self->{bufferedImage};
}


sub setBufferedImage {
    my ($self, $bufferedImage) = @_;
        $self->{bufferedImage} = $bufferedImage;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append(ref($self));
        $stringBuffer->append(" ");
        $stringBuffer->append($self->getKey()->toString());
        return $stringBuffer->toString();
}

# use java::awt::image::BufferedImage;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::cache::CacheableInterface;

1;

