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

package org::allbinary::media::image::io::IIOImageCacheable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::CacheableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{key} = undef;
    $self->{iioImage} = undef;
}


sub new {
    my ($class, $key) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{key} = $key;
    return $self;
}


sub getKey {
    my ($self) = @_;
        return $self->{key};
}


sub setBufferedImage {
    my ($self, $bufferedImage) = @_;
        $self->setIioImage('javax::imageio::IIOImage'->new($bufferedImage, undef, undef));
}


sub getIioImage {
    my ($self) = @_;
        return $self->{iioImage};
}


sub setIioImage {
    my ($self, $iioImage) = @_;
        $self->{iioImage} = $iioImage;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append(ref($self));
        $stringBuffer->append(" Reusable IIOImage");
        return $stringBuffer->toString();
}

# use java::awt::image::BufferedImage;
# use javax::imageio::IIOImage;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::cache::CacheableInterface;

1;

